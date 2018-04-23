 ---------------------------- Service Broker -----------------------
-- In this exercise we will learn how to cofigure Servie Broker and send and recieve messages.
-------------------------------------------------------------------
CREATE DATABASE ServiceBrokerTest
GO
USE ServiceBrokerTest
GO
-- Enable Service Broker
ALTER DATABASE ServiceBrokerTest SET ENABLE_BROKER
GO
-- Create Message Type
CREATE MESSAGE TYPE SBMessage
VALIDATION = NONE
GO
-- Create Contract
CREATE CONTRACT SBContract
(SBMessage SENT BY INITIATOR)
GO
-- Create Send Queue
CREATE QUEUE SBSendQueue
GO
-- Create Receive Queue
CREATE QUEUE SBReceiveQueue
GO
-- Create Send Service on Send Queue
CREATE SERVICE SBSendService
ON QUEUE SBSendQueue (SBContract)
GO
-- Create Receive Service on Recieve Queue
CREATE SERVICE SBReceiveService
ON QUEUE SBReceiveQueue (SBContract)
GO
-- Begin Dialog using service on contract
DECLARE @SBDialog uniqueidentifier
DECLARE @Message NVARCHAR(128)
BEGIN DIALOG CONVERSATION @SBDialog
FROM SERVICE SBSendService
TO SERVICE 'SBReceiveService'
ON CONTRACT SBContract
WITH ENCRYPTION = OFF
-- Send messages on Dialog
SET @Message = N'Very First Message';
SEND ON CONVERSATION @SBDialog
MESSAGE TYPE SBMessage (@Message)
SET @Message = N'Second Message';
SEND ON CONVERSATION @SBDialog
MESSAGE TYPE SBMessage (@Message)
SET @Message = N'Third Message';
SEND ON CONVERSATION @SBDialog
MESSAGE TYPE SBMessage (@Message)
GO
-- View messages from Receive Queue
SELECT CONVERT(NVARCHAR(MAX), message_body) AS Message
FROM SBReceiveQueue
GO
-- Receive messages from Receive Queue
RECEIVE TOP(1) CONVERT(NVARCHAR(MAX), message_body) AS Message
FROM SBReceiveQueue
GO
-- Receive messages from Receive Queue
RECEIVE CONVERT(NVARCHAR(MAX), message_body) AS Message
FROM SBReceiveQueue
GO
-- Clean Up
USE master
GO
DROP DATABASE ServiceBrokerTest
GO