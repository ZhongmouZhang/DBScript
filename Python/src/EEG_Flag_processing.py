import os
import pyodbc as pd
from datetime import datetime

server = 'SDDBSSBX004' 
database = 'EEG_Data' 
cnxn = pd.connect('DRIVER={ODBC Driver 13 for SQL Server};SERVER='+server+';DATABASE='+database+';Trusted_Connection=Yes')
cursor = cnxn.cursor()

directory = '//srvnetapp01/sql_back$/CMS/C2/'
flag_begin = 0

for filename in os.listdir(directory):
    if filename.endswith(".txt"):
        new_name = directory + filename
        with open(new_name, encoding='utf-16') as f:
            for line in f:
                words = line.rstrip().split('\t')
                if "Creation Date:" in words[0]:
                    scan_date = datetime.strptime(words[1], '%H:%M:%S %b %d, %Y')
                elif "Time" in words[0] and "Duration" in words[1] and "Title" in words[2]:
                    flag_begin = 1
                elif flag_begin == 1:
                    tag_datetime = datetime.combine(datetime.date(scan_date), datetime.time(datetime.strptime(words[0], '%H:%M:%S')))
                    cursor.execute("insert into tbl_scan_data_tag (file_name, scan_datatime, duration, title) values (?,?,?,?)"
                                    , filename, tag_datetime, words[1], words[2])
                    cnxn.commit()
        continue
    else:
        continue

