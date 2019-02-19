import pyodbc as pd
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.widgets import Slider


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
cursor.execute("{CALL [sp_load_vector](@work_serial=?, @stamp_begin=?)}", (101, 741000)) 
rows = cursor.fetchall() 
array = np.array(rows, float)
array_max_per_channel = np.max(array, axis=0)
array_min_per_channel = np.min(array, axis=0)

x = np.arange(0,10.0, 1/512)


fig, ax = plt.subplots(19,1, figsize=(20,20), sharex=True, frameon=False)
plt.subplots_adjust(bottom=0.10, top=0.97, left=0.11, right=0.98, hspace=0.37)




# plt.yticks([])
# ax[0].grid(False)
# ax[18].grid(False)


for i in range (19):
    ax[i].axis([0, 10, array_min_per_channel[i], array_max_per_channel[i]], ylable='test') 
    ax[i].plot(x,array[:,i])
    ax[i].set_ylabel('C3_N C3-A1+A2',rotation=0, horizontalalignment='left') 
    ax[i].yaxis.set_label_coords(-0.12,1.1)
    
    

plt.show()

#print (array[:,0])
'''
while row: 
    print ( row[0] )
    row = cursor.fetchone()

'''
