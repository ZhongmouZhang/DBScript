import pyodbc as pd
import numpy as numpy
import Func_EEG_load_training_batch as ltb
import Func_EEG_Graphing as egraph

server = '.' 
database = 'EEG_Data' 
cnxn = pd.connect('DRIVER={ODBC Driver 13 for SQL Server};SERVER='+server+';DATABASE='+database+';Trusted_Connection=Yes')
cursor = cnxn.cursor()

# rows = ltb.retrieve_test_file_name(cursor)
# egraph.draw_EEG_wave(cursor, 'B5', '2018-12-13 13:38:45', 4)
egraph.draw_EEG_wave(cursor, 'C14abn  ', '2018-11-05 10:10:20.000', 3, 'test', (10,20))
