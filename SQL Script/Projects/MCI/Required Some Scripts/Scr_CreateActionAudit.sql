 USE [MCI]
GO
/****** Object:  StoredProcedure [dbo].[CreateActionAudit]    Script Date: 04/07/2008 14:38:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
create PROCEDURE [dbo].[CreateActionAudit]
@UserSourceSystemName	VARCHAR(15),
@UserActionName			VARCHAR(100), 
@UserDomain				VARCHAR(100),
@UserLoginName			VARCHAR(100),
@UserFullName			VARCHAR(100),
@SPActualParameters		VARCHAR(300),
@SPReturnCode			INT, 
@ActionAuditID			INT OUTPUT
AS
SET NOCOUNT ON

DECLARE @ReturnCode			INT,
		@ErrorCode			INT,
		@UserSourceSystemID	INT,
		@UserActionID		INT 

IF	@SPActualParameters	=	''	SET	@SPActualParameters	=	NULL
IF	@UserDomain			=	''	SET	@UserDomain			=	NULL
IF	@UserLoginName		=	''	SET	@UserLoginName		=	NULL
IF	@UserFullName		=	''	SET	@UserFullName		=	NULL
IF	@UserSourceSystemName	=	''	SET	@UserSourceSystemName	=	NULL

SELECT	@ActionAuditID		= 0,
		@ReturnCode			= 0,
		@ErrorCode			= 0,
		@UserSourceSystemID	= 0,
		@UserActionID		= 0 

SET @UserActionID = dbo.GetUserActionID(@UserActionName)

SELECT	@UserSourceSystemID = SourceSystemID
FROM	SourceSystem
WHERE	SourceSystemName = @UserSourceSystemName

SET @UserSourceSystemID = ISNULL(@UserSourceSystemID, 0)

SELECT @ErrorCode = @@ERROR
IF (@ErrorCode <> 0)
	BEGIN
    	RAISERROR('CreateActionAudit. Error occurred retrieving SourceSystemID. Error (%ld).', 16, 16, @ErrorCode)
		SET @ReturnCode = -1 
		GOTO ERROR
	END

IF @UserActionID < 1
	BEGIN
    	RAISERROR('CreateActionAudit. Error: UserActionID is out-of-range. Error (%ld).', 16, 16, @ErrorCode)
		SET @ReturnCode = -1 
		GOTO ERROR
	END

INSERT ActionAudit
(
UserSourceSystemID,
UserActionID,
UserDomain,
UserLoginName, 
UserFullName,
ActionDate,
SPActualParameters,
SPReturnCode
)
VALUES
(
@UserSourceSystemID,
@UserActionID,
@UserDomain,
@UserLoginName, 
@UserFullName,
GETDATE(),
@SPActualParameters,
@SPReturnCode
)

SET @ActionAuditID = ISNULL(SCOPE_IDENTITY(), 0)

SELECT @ErrorCode = @@ERROR
IF (@ErrorCode <> 0) OR (@ActionAuditID < 1) 
	BEGIN
    	RAISERROR('CreateActionAudit. Error occurred inserting ActionAudit. Error (%ld).', 16, 16, @ErrorCode)
		SET @ReturnCode = -1 
		GOTO ERROR
	END

ERROR:
RETURN @ReturnCode