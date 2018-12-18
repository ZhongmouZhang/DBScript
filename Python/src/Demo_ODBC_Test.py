import pyodbc as pd
import numpy as np
import matplotlib.pyplot as plt

# Some other example server values are
# server = 'localhost\sqlexpress' # for a named instance
# server = 'myserver,port' # to specify an alternate port
server = 'tcp:localhost' 
database = 'EEG_Data' 
username = 'sa' 
password = 'zzmzzm' 
cnxn = pd.connect('DRIVER={ODBC Driver 13 for SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+ password)
cursor = cnxn.cursor()

#Call a stored procedure
cursor.execute("{CALL [sp_load_vector](@work_serial=?, @stamp_begin=?)}", ("1", "193342")) 
rows = cursor.fetchall() 
array = np.array(rows, float)

fig = plt.gcf()
fig.set_size_inches(100, 29)

x = np.arange(0,10.0, 1/512)
plt.plot(x, array[:,0])
plt.show()

#print (array[:,0])
'''
while row: 
    print ( row[0] )
    row = cursor.fetchone()

'''
