dbcc showcontig ('disease')  
dbcc showcontig ('person')  
dbcc showcontig ('document_route2')  
dbcc showcontig ('sch_task')  
dbcc showcontig ('document')  

exec sp_spaceused 'disease'                             
exec sp_spaceused 'person'
exec sp_spaceused 'document_route2'   
exec sp_spaceused 'sch_task'   
exec sp_spaceused 'document' 


dbcc dbreindex ('disease','',90)
dbcc dbreindex ('person','',90)
dbcc dbreindex ('document_route2','',90)
dbcc dbreindex ('sch_task','',90)
dbcc dbreindex ('document','',90)


