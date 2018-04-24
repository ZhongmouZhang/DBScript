 -- create an example queue table 
CREATE TABLE DBO.QUEUE ( 
  QUEUEID    INT IDENTITY( 1  , 1  ) NOT NULL PRIMARY KEY, 
  SOMEACTION VARCHAR(100)) 

GO 

-- seed the queue table with 10 rows 
DECLARE  @counter INT 

SELECT @counter = 1 

WHILE (@counter <= 10) 
  BEGIN 
    INSERT INTO DBO.QUEUE 
               (SOMEACTION) 
    SELECT 'some action ' + CAST(@counter AS VARCHAR) 
     
    SELECT @counter = @counter + 1 
  END 
  
  
  
----------------------------------------------------------------------------------
--  read row from the table queue concurrently
----------------------------------------------------------------------------------

  SET NOCOUNT ON 
DECLARE @queueid INT  

WHILE (SELECT COUNT(*) FROM DBO.QUEUE WITH (updlock, readpast)) >= 1 

BEGIN 

   BEGIN TRAN TRAN1  

   SELECT TOP 1 @queueid = QUEUEID  
   FROM DBO.QUEUE WITH (updlock, readpast)  

   PRINT 'processing queueid # ' + CAST(@queueid AS VARCHAR)  

   -- account for delay in processing time  
   WAITFOR DELAY '00:00:05'  

   DELETE FROM DBO.QUEUE  
   WHERE QUEUEID = @queueid 
   COMMIT 
END