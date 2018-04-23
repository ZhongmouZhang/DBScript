 USE [MCI]
GO
/****** Object:  StoredProcedure [dbo].[AppRetrieveUpdateQueue]    Script Date: 04/07/2008 13:24:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
create PROC [dbo].[AppRetrieveUpdateQueue]
@StartDate                      DATETIME,
@EndDate                        DATETIME,
@SourceSystemName               VARCHAR(50),
@WorkQueueStatusName            VARCHAR(50),
@UserDomain                     VARCHAR(100),
@UserLoginName                  VARCHAR(100),
@UserFullName                   VARCHAR(100),
@UserSourceSystemName           VARCHAR(50),
@UpdateWorkQueueNo				INT 
AS

BEGIN 
DECLARE @ErrorCode  INT,
        @ReturnCode     INT,
        @WorkQueueStatusID INT,
        @WorkQueueID INT,
        @OrphanSourceClientID INT,
        @ReplaceOrphanSourceClientID INT, 
        @NewSourceClientID INT,
        @MCIID VARCHAR(15),
        @PHN VARCHAR(15),
        @ClientCategoryID INT,
        @ClientCategoryName VARCHAR(50),
        @FirstName VARCHAR(50),
        @LastName  VARCHAR(50),
        @SecondName VARCHAR(50),
        @AliasFirstName  VARCHAR(50),
        @AliasLastName  VARCHAR(50),
        @AliasSecondName  VARCHAR(50),
        @Gender  VARCHAR(50),
        @DateOfBirth DATETIME,
        @DateOfDeath DATETIME,
        @PostalCode  VARCHAR(10),
        @UpdateDate DATETIME,
        @SourceSystemID INT,
        @SSID   VARCHAR(15),
        @OtherID VARCHAR(50),
        @CreateDate     DATETIME,
        @LastUpdatingSSID VARCHAR(15),
        @LastUpdatingSourceSystemID INT,
		@SPName Varchar(100),
		@SPActualParameters Varchar(300),
		@ActionAuditID INT, 
		@StartDateStr VARCHAR(50),
		@EndDateStr VARCHAR(50),
		@ActivationDate		DATETIME,
		@UpdateWorkQueueTypeID INT,
		@CompositeClientID INT

DECLARE @UpdateWorkQueueList TABLE (
        WorkQueueID                     INT,
        WorkQueueStatusID               INT,
        WorkQueueStatusName             VARCHAR(50),
        OrphanSourceClientID       INT,
        OrphanSourceSystemID               INT,
        OrphanSourceSystemName             VARCHAR(50),
        OrphanClientCategoryID                     INT,
        OrphanClientCategoryName                 VARCHAR(50),
        OrphanMCIID                          VARCHAR(15),
        OrphanPHN                          VARCHAR(15),
        OrphanSSID                         VARCHAR(15),
        OrphanOtherID                      VARCHAR(50),
        OrphanFirstName                    VARCHAR(50),
        OrphanLastName                     VARCHAR(50),
        OrphanSecondName                   VARCHAR(50),
        OrphanGender                       VARCHAR(50),
        OrphanDateOfBirth                  DATETIME,
        OrphanDateOfDeath                  DATETIME,
        OrphanPostalCode                   VARCHAR(50),
        OrphanCreateDate                   DATETIME,
        OrphanActivationDate               DATETIME,
        NewSourceClientID					INT,
        NewSourceSystemID					INT,
        NewSourceSystemName             VARCHAR(50),
        NewClientCategoryID                     INT,
        NewClientCategoryName                 VARCHAR(50),
        NewMCIID                          VARCHAR(15),
        NewPHN                          VARCHAR(15),
        NewSSID                         VARCHAR(15),
        NewOtherID                      VARCHAR(50),
        NewFirstName                    VARCHAR(50),
        NewLastName                     VARCHAR(50),
        NewSecondName                   VARCHAR(50),
        NewGender                       VARCHAR(50),
        NewDateOfBirth                  DATETIME,
        NewDateOfDeath                  DATETIME,
        NewPostalCode                   VARCHAR(50),
        NewCreateDate                   DATETIME,
        NewActivationDate               DATETIME
        ) 

SELECT  @UpdateDate = GetDate(),
        @ErrorCode = 0,
        @ReturnCode = 0

IF	@UpdateWorkQueueNo	= 0		SET @UpdateWorkQueueTypeID = 7
IF	@UpdateWorkQueueNo	= 1		SET @UpdateWorkQueueTypeID = 11

IF	@UserDomain			=	''	SET	@UserDomain			=	NULL
IF	@UserLoginName		=	''	SET	@UserLoginName		=	NULL
IF	@UserFullName		=	''	SET	@UserFullName		=	NULL
IF	@UserSourceSystemName	=	''	SET	@UserSourceSystemName	=	NULL

SET @SPName = OBJECT_NAME(@@PROCID)
SET @StartDateStr = ''
SET @EndDateStr = ''
IF @StartDate IS NOT NULL
	SET @StartDateStr = CONVERT(VARCHAR(50),@StartDate)
IF @EndDate IS NOT NULL
	SET @EndDateStr = CONVERT(VARCHAR(50),@EndDate)

SET @SPActualParameters =       
'Start date= ' + @StartDateStr +
' End Date= ' + @EndDateStr + 
' Source System Name= ' + ISNULL(@SourceSystemName, '') + 
' Work Queue System Name= ' + ISNULL(@WorkQueueStatusName, '') 

EXEC @ReturnCode = dbo.CreateActionAudit
                @UserSourceSystemName   		= @UserSourceSystemName,
                @UserActionName                 = @SPName, 
                @UserDomain                     = @UserDomain,
                @UserLoginName                  = @UserLoginName,
                @UserFullName                   = @UserFullName,
                @SPActualParameters             = @SPActualParameters,
                @SPReturnCode                   = 0,
                @ActionAuditID                  = @ActionAuditID OUTPUT
                
-- If @SourceSystemName is ALL, then @SourceSystemID will be NULL/0. This is OK
--
SELECT  @SourceSystemID = SourceSystemID
FROM    SourceSystem
WHERE   SourceSystemName = @SourceSystemName

SELECT @ErrorCode = @@ERROR
IF (@ErrorCode <> 0)
	BEGIN
	RAISERROR('AppRetrieveUpdateQueue Error occured during Processing of Queue Error (%ld).', 16, 16, @ErrorCode)
	SET @ReturnCode = -1
	GOTO ERROR
	END

SELECT  @WorkQueueStatusID = WorkQueueStatusID
FROM    WorkQueueStatus
WHERE   WorkQueueStatusName = @WorkQueueStatusName

SELECT @ErrorCode = @@ERROR

IF (@ErrorCode <> 0)
	BEGIN
	RAISERROR('AppRetrieveUpdateQueue Error occured during Processing of Queue Error (%ld).', 16, 16, @ErrorCode)
	SET @ReturnCode = -1
	GOTO ERROR
	END

IF (RTRIM(LTRIM(@SourceSystemName)) <> 'ALL')
	BEGIN
	DECLARE SelectedWorkQueue CURSOR
	READ_ONLY
	FOR
	SELECT  WorkQueueID
	FROM    WorkQueue
	WHERE   CreateDate >= @StartDate
	AND     CreateDate <= @EndDate
	AND     WorkQueueStatusID = @WorkQueueStatusID
	AND     WorkQueueTypeID = @UpdateWorkQueueTypeID 
	AND     WorkQueueID IN (SELECT WorkQueueID FROM WorkQueueMessage WHERE SourceSystemID = @SourceSystemID)
	END
ELSE
	BEGIN
	DECLARE SelectedWorkQueue CURSOR
	READ_ONLY
	FOR
	SELECT  WorkQueueID
	FROM    WorkQueue
	WHERE   CreateDate >= @StartDate
	AND     CreateDate <= @EndDate
	AND     WorkQueueStatusID = @WorkQueueStatusID
	AND     WorkQueueTypeID = @UpdateWorkQueueTypeID
	AND     WorkQueueID IN (SELECT WorkQueueID FROM WorkQueueMessage WHERE SourceSystemID > 0)
	END

OPEN    SelectedWorkQueue

SELECT @ErrorCode = @@ERROR
IF (@ErrorCode <> 0)
	BEGIN
	RAISERROR('AppRetrieveUpdateQueue Error occured during Processing of Queue Error (%ld).', 16, 16, @ErrorCode)
	SET @ReturnCode = -1
	GOTO ERROR
	END

FETCH NEXT FROM SelectedWorkQueue INTO @WorkQueueID
WHILE (@@fetch_status <> -1)
	BEGIN
	IF (@@fetch_status <> -2)
		BEGIN

		INSERT INTO @UpdateWorkQueueList ( WorkQueueID ,WorkQueueStatusID ,WorkQueueStatusName)
		VALUES (@WorkQueueID ,@WorkQueueStatusID ,@WorkQueueStatusName)

		SELECT @ErrorCode = @@ERROR
		IF (@ErrorCode <> 0)
			BEGIN
			RAISERROR('AppRetrieveUpdateQueue Error occured during Processing of Queue Error (%ld).', 16, 16, @ErrorCode)
			SET @ReturnCode = -1
			GOTO ERROR
			END

		SET @NewSourceClientID = NULL

		SELECT @NewSourceClientID = SourceClientID FROM
		WorkQueueSourceClient WHERE
		WorkQueueID = @WorkQueueID AND
		SourceClientLabel = 'NEW'

		SELECT @ErrorCode = @@ERROR
		IF (@ErrorCode <> 0)
			BEGIN
			RAISERROR('AppRetrieveUpdateQueue Error occured during Processing of Queue Error (%ld).', 16, 16, @ErrorCode)
			SET @ReturnCode = -1
			GOTO ERROR
			END

		-- The Master information comes from the existing OLD sourceclient for accepted entries
		-- otherwise get the values from the most recent sourceclient that updated the master
		-- 
		SET @OrphanSourceClientID = NULL
		SET @ReplaceOrphanSourceClientID = NULL

		SELECT @OrphanSourceClientID = SourceClientID FROM
		WorkQueueSourceClient WHERE
		WorkQueueID = @WorkQueueID AND
		SourceClientLabel = 'OLD'

		SELECT @ErrorCode = @@ERROR

		IF (@ErrorCode <> 0)
			BEGIN
			RAISERROR('AppRetrieveUpdateQueue Error occured during Processing of Queue Error (%ld).', 16, 16, @ErrorCode)
			SET @ReturnCode = -1
			GOTO ERROR
			END

		IF @WorkQueueStatusID <> 3
			BEGIN
			SET @CompositeClientID = dbo.GetTranslatedCompositeClient ( @NewSourceClientID )
			IF @CompositeClientID = 0 GOTO ERROR
			SET @ReplaceOrphanSourceClientID = dbo.GetActiveSourceClient ( @CompositeClientID )
			IF ISNULL(@ReplaceOrphanSourceClientID,0) <> 0
				BEGIN
				SET @OrphanSourceClientID = @ReplaceOrphanSourceClientID
				END
			END

		-- Add Master information to result set (aka OLD/ORPHAN)
		--
		SELECT     @SourceSystemID = NULL ,
		@ClientCategoryID = NULL , 
		@SourceSystemName = NULL,
		@ClientCategoryName = NULL,
		@MCIID = NULL ,             
		@PHN = NULL ,             
		@SSID = NULL ,
		@OtherID = NULL ,          
		@FirstName = NULL ,    
		@LastName = NULL ,
		@SecondName = NULL ,   
		@Gender = NULL ,       
		@DateOfBirth = NULL ,  
		@DateOfDeath = NULL ,  
		@PostalCode = NULL ,   
		@CreateDate = NULL,
		@ActivationDate = NULL  

		SELECT  @SourceSystemID         =   SourceClient.SourceSystemID,
				@SSID                   =   SSID,
				@MCIID                  =   MCIID,
				@PHN                    =   PHN,
				@ClientCategoryID       =   SourceClient.ClientCategoryID,
				@FirstName              =   FirstName,
				@LastName               =   LastName,
				@SecondName             =   SecondName,
				@Gender                 =   Gender,
				@DateOfBirth            =   DateOfBirth,
				@DateOfDeath            =   DateOfDeath,
				@PostalCode             =   PostalCode,
				@CreateDate             =   CreateDate,
				@OtherID                =   OtherID,
				@ActivationDate			=	ActivationDate,
				@SourceSystemName		=	SourceSystemName,
				@ClientCategoryName		=	ClientCategoryName
		FROM SourceClient
		LEFT JOIN SourceSystem ON SourceSystem.SourceSystemID = SourceClient.SourceSystemID
		LEFT JOIN ClientCategory ON ClientCategory.ClientCategoryID = SourceClient.ClientCategoryID
		WHERE SourceClientID = @OrphanSourceClientID

		SELECT @ErrorCode = @@ERROR
		IF (@ErrorCode <> 0)
			BEGIN
			RAISERROR('AppRetrieveUpdateQueue Error occured during Processing of Queue Error (%ld).', 16, 16, @ErrorCode)
			SET @ReturnCode = -1
			GOTO ERROR
			END

		EXEC dbo.CreateRecordAudit
		@ActionAuditID,
		3, --Viewed
		@SourceSystemID,
		@SSID,
		@MCIID,
		@FirstName,
		@LastName,
		@DateOfBirth,
		@Gender

		UPDATE @UpdateWorkQueueList SET
		OrphanSourceClientID			   =       @OrphanSourceClientID,
		OrphanSourceSystemID               =       @SourceSystemID,
		OrphanClientCategoryID             =       @ClientCategoryID,           
		OrphanSourceSystemName             =       @SourceSystemName,
		OrphanClientCategoryName           =       @ClientCategoryName,           
		OrphanMCIID                        =       @MCIID,             
		OrphanPHN                          =       @PHN,             
		OrphanSSID                         =       @SSID,        
		OrphanOtherID                      =       @OtherID,          
		OrphanFirstName                    =       @FirstName,    
		OrphanLastName                     =       @LastName,     
		OrphanSecondName                   =       @SecondName,
		OrphanGender                       =       @Gender,       
		OrphanDateOfBirth                  =       @DateOfBirth,
		OrphanDateOfDeath                  =       @DateOfDeath,  
		OrphanPostalCode                   =       @PostalCode,   
		OrphanCreateDate                   =       @CreateDate,
		OrphanActivationDate               =       @ActivationDate
		WHERE WorkQueueID = @WorkQueueID

		SELECT @ErrorCode = @@ERROR

		IF (@ErrorCode <> 0)
			BEGIN
			RAISERROR('AppRetrieveUpdateQueue Error occured during Processing of Queue Error (%ld).', 16, 16, @ErrorCode)
			SET @ReturnCode = -1
			GOTO ERROR
			END

		-- Add New information to result
		-- If the WorkQueue is MDS Update Queue, then all the NEW values come from the NEW sourceclient
		-- If the WorkQueue is MDS MCIID Update Queue, then only the SSID, SSName, MCIID and CreateDAte
		-- come from the NEW SourceClient, the rest are from the MASTER/OLD/ORPHAN
		--
		IF @UpdateWorkQueueTypeID = 11 --MDS MCIID Update Queue:
			BEGIN

			SELECT  @SourceSystemID = NULL ,
				@SourceSystemName = NULL,
				@MCIID = NULL ,             
				@SSID = NULL ,
				@CreateDate = NULL   ,
				@ActivationDate = NULL  

			SELECT  @SourceSystemID         =   SourceClient.SourceSystemID,
				@SSID                   =   SSID,
				@MCIID                  =   MCIID,
				@CreateDate             =   CreateDate,
				@ActivationDate			=	ActivationDate,
				@SourceSystemName		=	SourceSystemName
			FROM SourceClient
			LEFT JOIN SourceSystem ON SourceSystem.SourceSystemID = SourceClient.SourceSystemID
			WHERE SourceClientID = @NewSourceClientID

			END					
		ELSE -- The @UpdateWorkQueueTypeID = 7 MDS Update Queue
			BEGIN
			SELECT  @SourceSystemID = NULL ,
				@ClientCategoryID = NULL ,  
				@SourceSystemName = NULL,
				@ClientCategoryName = NULL,
				@MCIID = NULL ,             
				@PHN = NULL ,             
				@SSID = NULL ,
				@OtherID = NULL ,
				@FirstName = NULL ,    
				@LastName = NULL ,     
				@SecondName = NULL ,   
				@Gender = NULL ,       
				@DateOfBirth = NULL ,  
				@DateOfDeath = NULL ,  
				@PostalCode = NULL ,   
				@CreateDate = NULL   ,
				@ActivationDate = NULL  

			SELECT  @SourceSystemID         =   SourceClient.SourceSystemID,
				@SSID                   =   SSID,
				@MCIID                  =   MCIID,
				@PHN                    =   PHN,
				@ClientCategoryID       =   SourceClient.ClientCategoryID,
				@FirstName              =   FirstName,
				@LastName               =   LastName,
				@SecondName             =   SecondName,
				@Gender                 =   Gender,
				@DateOfBirth            =   DateOfBirth,
				@DateOfDeath            =   DateOfDeath,
				@PostalCode             =   PostalCode,
				@CreateDate             =   CreateDate,
				@OtherID                =   OtherID,
				@ActivationDate			=	ActivationDate,
				@SourceSystemName		=	SourceSystemName,
				@ClientCategoryName		=	ClientCategoryName
			FROM SourceClient
			LEFT JOIN SourceSystem ON SourceSystem.SourceSystemID = SourceClient.SourceSystemID
			LEFT JOIN ClientCategory ON ClientCategory.ClientCategoryID = SourceClient.ClientCategoryID
			WHERE SourceClientID = @NewSourceClientID
			END 

		SELECT @ErrorCode = @@ERROR
		IF (@ErrorCode <> 0)
			BEGIN
			RAISERROR('AppRetrieveUpdateQueue Error occured during Processing of Queue Error (%ld).', 16, 16, @ErrorCode)
			SET @ReturnCode = -1
			GOTO ERROR
			END

		EXEC dbo.CreateRecordAudit
		@ActionAuditID,
		3, --Viewed
		@SourceSystemID,
		@SSID,
		@MCIID,
		@FirstName,
		@LastName,
		@DateOfBirth,
		@Gender

		UPDATE @UpdateWorkQueueList SET
		NewSourceClientID			    =       @NewSourceClientID,
		NewSourceSystemID               =       @SourceSystemID,
		NewClientCategoryID             =       @ClientCategoryID,           
		NewSourceSystemName             =       @SourceSystemName,
		NewClientCategoryName           =       @ClientCategoryName,           
		NewMCIID                        =       @MCIID,             
		NewPHN                          =       @PHN,             
		NewSSID                         =       @SSID,        
		NewOtherID                      =       @OtherID,          
		NewFirstName                    =       @FirstName,
		NewLastName                     =       @LastName,     
		NewSecondName                   =       @SecondName,   
		NewGender                       =       @Gender,       
		NewDateOfBirth                  =       @DateOfBirth,
		NewDateOfDeath                  =       @DateOfDeath,  
		NewPostalCode                   =       @PostalCode,   
		NewCreateDate                   =       @CreateDate,
		NewActivationDate				=		@ActivationDate     
		WHERE WorkQueueID = @WorkQueueID

		SELECT @ErrorCode = @@ERROR
		IF (@ErrorCode <> 0)
			BEGIN
			RAISERROR('AppRetrieveUpdateQueue Error occured during Processing of Queue Error (%ld).', 16, 16, @ErrorCode)
			SET @ReturnCode = -1
			GOTO ERROR
			END
		END
	FETCH NEXT FROM SelectedWorkQueue INTO @WorkQueueID
END

CLOSE SelectedWorkQueue
DEALLOCATE SelectedWorkQueue

IF @UserDomain = 'MCI' AND @UserLoginName = 'MCI_RSUSER'  -- For report
	BEGIN
	SELECT WorkQueueID, WorkQueueStatusID ,
	WorkQueueStatusName ,  OrphanSourceClientID,  OrphanSourceSystemID ,  OrphanSourceSystemName ,  OrphanClientCategoryID ,  OrphanClientCategoryName , 
	OrphanMCIID, OrphanPHN ,  OrphanSSID ,  OrphanOtherID ,  OrphanFirstName ,  OrphanLastName ,  OrphanSecondName ,  OrphanGender ,  OrphanDateOfBirth ,  OrphanDateOfDeath ,
	OrphanPostalCode ,  OrphanCreateDate , OrphanActivationDate,  NewSourceClientID ,  NewSourceSystemID ,  NewSourceSystemName ,  NewClientCategoryID ,
	NewClientCategoryName ,  NewMCIID, NewPHN ,  NewSSID ,  NewOtherID ,  NewFirstName ,  NewLastName ,  NewSecondName ,  NewGender ,  NewDateOfBirth , 
	NewDateOfDeath ,  NewPostalCode ,  NewCreateDate , NewActivationDate
	FROM @UpdateWorkQueueList WHERE WorkQueueID > 0 ORDER BY NewLastName
	END
ELSE
	BEGIN
	SELECT WorkQueueID, WorkQueueStatusID ,
	WorkQueueStatusName ,  OrphanSourceClientID,  OrphanSourceSystemID ,  OrphanSourceSystemName ,  OrphanClientCategoryID ,  OrphanClientCategoryName , 
	OrphanMCIID, OrphanPHN ,  OrphanSSID ,  OrphanOtherID ,  OrphanFirstName ,  OrphanLastName ,  OrphanSecondName ,  OrphanGender ,  OrphanDateOfBirth ,  OrphanDateOfDeath ,
	OrphanPostalCode ,  OrphanCreateDate , OrphanActivationDate,  NewSourceClientID ,  NewSourceSystemID ,  NewSourceSystemName ,  NewClientCategoryID ,
	NewClientCategoryName ,  NewMCIID, NewPHN ,  NewSSID ,  NewOtherID ,  NewFirstName ,  NewLastName ,  NewSecondName ,  NewGender ,  NewDateOfBirth , 
	NewDateOfDeath ,  NewPostalCode ,  NewCreateDate, NewActivationDate 
	FROM @UpdateWorkQueueList WHERE WorkQueueID > 0 ORDER BY WorkQueueID ASC
	END

Return 0

ERROR:

EXEC dbo.UpdateActionAuditResultCode @ActionAuditID, -1 

RETURN @ReturnCode

END