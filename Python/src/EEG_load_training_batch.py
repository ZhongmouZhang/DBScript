import pyodbc as pd
import numpy as np


# Some other example server values are
# server = 'localhost\sqlexpress' # for a named instance
# server = 'myserver,port' # to specify an alternate port
server = 'SDDBSSBX004' 
database = 'EEG_Data' 
cnxn = pd.connect('DRIVER={ODBC Driver 13 for SQL Server};SERVER='+server+';DATABASE='+database+';Trusted_Connection=Yes')
cursor = cnxn.cursor()

#Call a stored procedure
batch_number = 1
id = 0
cursor.execute("{CALL sp_load_a_training_sample (@batch_number=?, @id=?)}", (batch_number, id)) 
id, tagged, swapped = cursor.fetchone()
cursor.nextset()
rows=cursor.fetchall()
X = np.array(rows, float).reshape(97280,1)

if tagged == 'Y':
    Y = [[1]]
else:
    Y = [[0]]


while tagged is not None:
    cursor.execute("{CALL sp_load_a_training_sample (@batch_number=?, @id=?)}", (batch_number, id)) 
    id, tagged, swapped = cursor.fetchone()
    if tagged is not None:
        cursor.nextset()
        rows=cursor.fetchall()
        array = np.array(rows, float).reshape(97280,1)
        X = np.append(X,array, axis = 1)
        if tagged == 'Y':
            Y = np.append(Y,[[1]],axis=1)
        else:
            Y = np.append(Y,[[0]], axis = 1)


print (X.shape)





