 USE [MCI]
GO
/****** Object:  StoredProcedure [dbo].[AppUpdateUpdateQueueStatus]    Script Date: 04/07/2008 13:27:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
create PROCEDURE [dbo].[AppUpdateUpdateQueueStatus]
(
@WorkQueueID                     INT,
@UserDomain				VARCHAR(100), 
@UserLoginName			VARCHAR(100),
@UserFullName			VARCHAR(100),
@UserSourceSystemName	VARCHAR(50),
@NewStatus              VARCHAR(50),
@UpdateWorkQueueNo				INT
)
AS
BEGIN

DECLARE @WorkQueueStatusID INT,
        @ProcessDate DATETIME,
        @OldSourceClientID INT, 
		@NewSourceClientID INT,
		@CompositeClientLinkID INT,
		@CompositeClientID INT,
		@ReturnCode INT,
		@ErrorCode INT,
		@SPName Varchar(100),
		@SPActualParameters Varchar(300),
		@ActionAuditID INT,
		@MCIID VARCHAR(15),
        @FirstName VARCHAR(50),
        @LastName  VARCHAR(50),
        @Gender  VARCHAR(50),
        @DateOfBirth DATETIME,
        @SourceSystemID INT,
        @SSID VARCHAR(15),
		@AcceptWorkStatusID INT,
		@UpdatesToApply VARCHAR(10),
		@CurrentWorkQueueStatusID INT 
        
SELECT  @ProcessDate = GetDate(),
		@ErrorCode = 0,
		@ReturnCode = 0,
		@AcceptWorkStatusID = 3,
		@UpdatesToApply = 'ALL'
		 

IF  @UpdateWorkQueueNo = 1			SET @UpdatesToApply         =   'MCIID'		
        
IF	@UserDomain				=	''	SET	@UserDomain				=	NULL
IF	@UserLoginName			=	''	SET	@UserLoginName			=	NULL
IF	@UserFullName			=	''	SET	@UserFullName			=	NULL
IF	@UserSourceSystemName	=	''	SET	@UserSourceSystemName	=	NULL

SELECT	@WorkQueueStatusID = WorkQueueStatusID 
FROM	WorkQueueStatus
WHERE	WorkQueueStatusName = @NewStatus

IF (@WorkQueueStatusID IS NULL)
	BEGIN
	RAISERROR ('Work Queue Status ID : (%s) not found.', 16, 16, @NewStatus)
	GOTO ERROR
	END
	
SELECT	@CurrentWorkQueueStatusID = WorkQueueStatusID
FROM	WorkQueue
WHERE	WorkQueueID = @WorkQueueID
SET @CurrentWorkQueueStatusID = ISNULL(@CurrentWorkQueueStatusID,0)

IF (@CurrentWorkQueueStatusID = @WorkQueueStatusID)
	GOTO _EXIT

SET @SPName = OBJECT_NAME(@@PROCID)
SET @SPActualParameters =        
'Work Queue ID= ' + ISNULL(CONVERT(VARCHAR(50),@WorkQueueID), '') + 
' New Work Queue Status= ' + ISNULL(@NewStatus, '')

EXEC @ReturnCode = dbo.CreateActionAudit
					@UserSourceSystemName	= @UserSourceSystemName,
					@UserActionName			= @SPName, 
					@UserDomain				= @UserDomain,
					@UserLoginName			= @UserLoginName,
					@UserFullName			= @UserFullName,
					@SPActualParameters		= @SPActualParameters,
					@SPReturnCode			= 0,
					@ActionAuditID			= @ActionAuditID OUTPUT
                
BEGIN TRY
    
IF (@WorkQueueStatusID = @AcceptWorkStatusID)
	BEGIN

	-- We exchange the current OLD SourceClient with the most recent updating
	-- SourceClient for the related CompositeClient
	--
	SELECT	@NewSourceClientID = SourceClientID 
	FROM	WorkQueueSourceClient 
	WHERE	WorkQueueID = @WorkQueueID
	AND		SourceClientLabel = 'NEW'

	SELECT @ErrorCode = @@ERROR
	IF (@ErrorCode <> 0) GOTO ERROR
	
	SET @CompositeClientID = dbo.GetTranslatedCompositeClient ( @NewSourceClientID )
	IF @CompositeClientID = 0 GOTO ERROR

	SET @OldSourceClientID = dbo.GetActiveSourceClient ( @CompositeClientID )

	BEGIN TRANSACTION
	
	IF ISNULL(@OldSourceClientID,0) <> 0
		BEGIN	
		UPDATE	WorkQueueSourceClient
		SET		SourceClientID = @OldSourceClientID
		WHERE	WorkQueueID = @WorkQueueID
		AND		SourceClientLabel = 'OLD'
		END
	
	EXEC ActivateSourceClient @NewSourceClientID, @ErrorCode OUTPUT 
	IF (@ErrorCode <> 0) GOTO ERROR
       
	EXEC @ReturnCode = UpdateCompositeClient 
							@CompositeClientID,
        					@NewSourceClientID,
        					@UpdatesToApply,
        					@ActionAuditID
	IF (@ReturnCode <> 0) GOTO ERROR

	END -- Accept
	
UPDATE	WorkQueue 
SET		UserLoginName		= @UserLoginName,
		ProcessDate			= @ProcessDate,
		WorkQueueStatusID	= @WorkQueueStatusID
WHERE WorkQueueID			= @WorkQueueID

-- Updates for the status change to accept are transactioned (see above in if block)
-- so we need to check if there is an active transaction that needs committed here.
--
IF XACT_STATE() <> 0 COMMIT TRANSACTION

END TRY
BEGIN CATCH

IF XACT_STATE() <> 0 ROLLBACK TRANSACTION
EXEC dbo.RethrowError
GOTO ERROR

END CATCH

SELECT  @SourceSystemID	=   SourceSystemID,
		@SSID			=   SSID,
		@MCIID			=   MCIID,
		@FirstName		=   FirstName,
		@LastName		=   LastName,
		@Gender			=   Gender,
		@DateOfBirth	=   DateOfBirth
FROM	WorkQueueMessage
WHERE	WorkQueueID = @WorkQueueID

EXEC dbo.CreateRecordAudit
			@ActionAuditID,
			2, --Modified
			@SourceSystemID,
			@SSID,
			@MCIID,
			@FirstName,
			@LastName,
			@DateOfBirth,
			@Gender

_EXIT:

RETURN	@ReturnCode

ERROR:

IF XACT_STATE() <> 0 ROLLBACK TRANSACTION

EXEC dbo.UpdateActionAuditResultCode @ActionAuditID, -1 

SET @ReturnCode = -1
RAISERROR('AppUpdateupdateQueueStatus Error occured during Processing of UpdateQueue Error (%ld).', 16, 16, @ErrorCode)

RETURN @ReturnCode

END