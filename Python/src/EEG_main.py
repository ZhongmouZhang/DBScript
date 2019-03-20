import pyodbc as pd
import numpy as numpy
import EEG_load_training_batch as ltb

server = 'SDDBSSBX004' 
database = 'EEG_Data' 
cnxn = pd.connect('DRIVER={ODBC Driver 13 for SQL Server};SERVER='+server+';DATABASE='+database+';Trusted_Connection=Yes')
cursor = cnxn.cursor()

X, Y = ltb.load_mini_batch_of_ten_second(cursor, 2)

print (X.shape, Y.shape)