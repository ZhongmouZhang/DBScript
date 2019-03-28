import pyodbc as pd
import numpy as numpy
import EEG_load_training_batch as ltb

server = '.' 
database = 'EEG_Data' 
cnxn = pd.connect('DRIVER={ODBC Driver 13 for SQL Server};SERVER='+server+';DATABASE='+database+';Trusted_Connection=Yes')
cursor = cnxn.cursor()

X, Y = ltb.load_sample_of_one_second_randomly(cursor, 2)

print (X.shape, Y.shape)