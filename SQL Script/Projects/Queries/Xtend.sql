select name, 
	LastName = case charindex(',' , name) 
					when 0 then name 
					else substring (name, 1, charindex(',' , name)-1) 
			   end ,
	FirstName = case charindex(',' , name) 
					when 0 then '' 
					when len(name) then ''
					else ltrim(substring(name, charindex(',' , name) +1, len(name)-charindex(',' , name))) 
				end 
from XKM where format != 9


select ascii (substring (FrqType,1,1)) , ascii (substring (FrqType,2,1)), ascii (substring (FrqType,3,1)), FrqType, XnPrivate
from XNFRQ
where (ascii (substring (FrqType,1,1)) = 37 and ascii (substring (FrqType,2,1)) = 37 and substring (FrqType,3,1) = 'P')
		or FrqType like '!%03' escape '!'
		or FrqType like '!%05' escape '!'
		or FrqType like '!%06' escape '!'
		or FrqType like '!%09' escape '!' 
order by FrqType
		
------------------------------------------------------ UPDATE ------------------------------------------------------------
begin tran
update XKM 
set		name = case charindex(',' , name) 
					when 0 then name 
					else substring (name, 1, charindex(',' , name)-1) 
			   end ,
	FirstName = case charindex(',' , name) 
					when 0 then FirstName
					when len(name) then FirstName
					else rtrim(ltrim(substring(name, charindex(',' , name) +1, len(name)-charindex(',' , name)))) 
				end 
where format != 9 and len (case charindex(',' , name) 
					when 0 then FirstName
					when len(name) then FirstName
					else rtrim(ltrim(substring(name, charindex(',' , name) +1, len(name)-charindex(',' , name)))) 
				end ) <=20

select * from XKM where format != 9 and ltrim(firstname)=''

-- rollback tran
-- commit tran

update XNFRQ
set XnPrivate = 1
where (ascii (substring (FrqType,1,1)) = 37 and ascii (substring (FrqType,2,1)) = 37 and substring (FrqType,3,1) = 'P')
		or FrqType like '!%03' escape '!'
		or FrqType like '!%05' escape '!'
		or FrqType like '!%06' escape '!'
		or FrqType like '!%09' escape '!'
		
		
