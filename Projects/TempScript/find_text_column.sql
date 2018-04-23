 select * 
from sys.objects o 
		join sys.columns c on o.object_id=c.object_id
		join sys.types t ON t.system_type_id = c.user_type_id
where o.name = 'USR_CASELOAD'
		and (t.name IN('xml','image','text','ntext') 
			OR (t.name IN('varchar','nvarchar','varbinary','nvarbinary') AND c.max_length = -1))