 UPDATE district
set [1]= (select count(*) from contactlist where Mid(location,1,1)=district.row and val(nz(mid(location,2,2),0))=1)