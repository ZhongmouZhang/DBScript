 IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SSISPatientSearchResult_CompositeClientLink]') AND parent_object_id = OBJECT_ID(N'[dbo].[SSISPatientSearchResult]'))
ALTER TABLE [dbo].[SSISPatientSearchResult] DROP CONSTRAINT [FK_SSISPatientSearchResult_CompositeClientLink]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SSISPatientSearchResult_SSISPatientSearch]') AND parent_object_id = OBJECT_ID(N'[dbo].[SSISPatientSearchResult]'))
ALTER TABLE [dbo].[SSISPatientSearchResult] DROP CONSTRAINT [FK_SSISPatientSearchResult_SSISPatientSearch]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CompositeClientLinkID_CompositeClientLink]') AND parent_object_id = OBJECT_ID(N'[dbo].[CompositeClientLinkHistory]'))
ALTER TABLE [dbo].[CompositeClientLinkHistory] DROP CONSTRAINT [FK_CompositeClientLinkID_CompositeClientLink]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistoryOriginalCompositeClientID_CompositeClient]') AND parent_object_id = OBJECT_ID(N'[dbo].[CompositeClientLinkHistory]'))
ALTER TABLE [dbo].[CompositeClientLinkHistory] DROP CONSTRAINT [FK_HistoryOriginalCompositeClientID_CompositeClient]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistoryTranslatedCompositeClientID_CompositeClient]') AND parent_object_id = OBJECT_ID(N'[dbo].[CompositeClientLinkHistory]'))
ALTER TABLE [dbo].[CompositeClientLinkHistory] DROP CONSTRAINT [FK_HistoryTranslatedCompositeClientID_CompositeClient]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SourceClient_ClientCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[SourceClient]'))
ALTER TABLE [dbo].[SourceClient] DROP CONSTRAINT [FK_SourceClient_ClientCategory]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SourceClient_SourceSystem]') AND parent_object_id = OBJECT_ID(N'[dbo].[SourceClient]'))
ALTER TABLE [dbo].[SourceClient] DROP CONSTRAINT [FK_SourceClient_SourceSystem]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ActionAudit_UserAction]') AND parent_object_id = OBJECT_ID(N'[dbo].[ActionAudit]'))
ALTER TABLE [dbo].[ActionAudit] DROP CONSTRAINT [FK_ActionAudit_UserAction]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CompositeClient_ClientCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[CompositeClient]'))
ALTER TABLE [dbo].[CompositeClient] DROP CONSTRAINT [FK_CompositeClient_ClientCategory]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CompositeClient_SourceSystem]') AND parent_object_id = OBJECT_ID(N'[dbo].[CompositeClient]'))
ALTER TABLE [dbo].[CompositeClient] DROP CONSTRAINT [FK_CompositeClient_SourceSystem]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OriginalCompositeClientID_CompositeClient]') AND parent_object_id = OBJECT_ID(N'[dbo].[CompositeClientLink]'))
ALTER TABLE [dbo].[CompositeClientLink] DROP CONSTRAINT [FK_OriginalCompositeClientID_CompositeClient]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TranslatedCompositeClientID_CompositeClient]') AND parent_object_id = OBJECT_ID(N'[dbo].[CompositeClientLink]'))
ALTER TABLE [dbo].[CompositeClientLink] DROP CONSTRAINT [FK_TranslatedCompositeClientID_CompositeClient]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkQueueCompositeClient_CompositeClientLink]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkQueueCompositeClient]'))
ALTER TABLE [dbo].[WorkQueueCompositeClient] DROP CONSTRAINT [FK_WorkQueueCompositeClient_CompositeClientLink]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkQueueCompositeClient_WorkQueue]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkQueueCompositeClient]'))
ALTER TABLE [dbo].[WorkQueueCompositeClient] DROP CONSTRAINT [FK_WorkQueueCompositeClient_WorkQueue]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkQueueMessage_ClientCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkQueueMessage]'))
ALTER TABLE [dbo].[WorkQueueMessage] DROP CONSTRAINT [FK_WorkQueueMessage_ClientCategory]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkQueueMessage_SourceSystem]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkQueueMessage]'))
ALTER TABLE [dbo].[WorkQueueMessage] DROP CONSTRAINT [FK_WorkQueueMessage_SourceSystem]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkQueueMessage_WorkQueue]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkQueueMessage]'))
ALTER TABLE [dbo].[WorkQueueMessage] DROP CONSTRAINT [FK_WorkQueueMessage_WorkQueue]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkQueue_SourceSystem]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkQueue]'))
ALTER TABLE [dbo].[WorkQueue] DROP CONSTRAINT [FK_WorkQueue_SourceSystem]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkQueueData_WorkQueueStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkQueue]'))
ALTER TABLE [dbo].[WorkQueue] DROP CONSTRAINT [FK_WorkQueueData_WorkQueueStatus]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkQueueData_WorkQueueType]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkQueue]'))
ALTER TABLE [dbo].[WorkQueue] DROP CONSTRAINT [FK_WorkQueueData_WorkQueueType]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkQueueSourceClient_SourceClient]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkQueueSourceClient]'))
ALTER TABLE [dbo].[WorkQueueSourceClient] DROP CONSTRAINT [FK_WorkQueueSourceClient_SourceClient]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkQueueSourceClient_WorkQueue]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkQueueSourceClient]'))
ALTER TABLE [dbo].[WorkQueueSourceClient] DROP CONSTRAINT [FK_WorkQueueSourceClient_WorkQueue]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CompositeClientHistory_ClientCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[CompositeClientHistory]'))
ALTER TABLE [dbo].[CompositeClientHistory] DROP CONSTRAINT [FK_CompositeClientHistory_ClientCategory]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CompositeClientHistory_CompositeClient]') AND parent_object_id = OBJECT_ID(N'[dbo].[CompositeClientHistory]'))
ALTER TABLE [dbo].[CompositeClientHistory] DROP CONSTRAINT [FK_CompositeClientHistory_CompositeClient]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CompositeClientHistory_SourceSystem]') AND parent_object_id = OBJECT_ID(N'[dbo].[CompositeClientHistory]'))
ALTER TABLE [dbo].[CompositeClientHistory] DROP CONSTRAINT [FK_CompositeClientHistory_SourceSystem]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RecordAudit_ActionAudit]') AND parent_object_id = OBJECT_ID(N'[dbo].[RecordAudit]'))
ALTER TABLE [dbo].[RecordAudit] DROP CONSTRAINT [FK_RecordAudit_ActionAudit]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RecordAudit_RecordAction]') AND parent_object_id = OBJECT_ID(N'[dbo].[RecordAudit]'))
ALTER TABLE [dbo].[RecordAudit] DROP CONSTRAINT [FK_RecordAudit_RecordAction]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SourceClientLinkID_CompositeClientLink]') AND parent_object_id = OBJECT_ID(N'[dbo].[SourceClientLink]'))
ALTER TABLE [dbo].[SourceClientLink] DROP CONSTRAINT [FK_SourceClientLinkID_CompositeClientLink]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SourceClientLinkID_SourceClient]') AND parent_object_id = OBJECT_ID(N'[dbo].[SourceClientLink]'))
ALTER TABLE [dbo].[SourceClientLink] DROP CONSTRAINT [FK_SourceClientLinkID_SourceClient]
GO


