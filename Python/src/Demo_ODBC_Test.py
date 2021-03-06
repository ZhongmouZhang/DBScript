import pyodbc as pd
import numpy as np
import matplotlib as mpl
import matplotlib.pyplot as plt
from matplotlib.widgets import Slider

# set smaller font size
mpl.rcParams['font.size'] = 10. 

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
list_channel = ['C3_N','C4_N','CZ_N','F3_N','F4_N','F7_N','F8_N','FZ_N','FP1_N','FP2_N','O1_N','O2_N','P3_N','P4_N', 'PZ_N','T3_N','T4_N','T5_N','T6_N']

x = np.arange(0,10.0, 1/512)


fig, ax = plt.subplots(19,1, figsize=(20,20), sharex=True, frameon=False)
plt.subplots_adjust(bottom=0.10, top=0.97, left=0.05, right=0.98, hspace=0.37)




# plt.yticks([])
# ax[0].grid(False)
# ax[18].grid(False)


for i in range (19):
    ax[i].axis([0, 10, array_min_per_channel[i], array_max_per_channel[i]]) 
    ax[i].plot(x,array[:,i])
    ax[i].set_ylabel(list_channel[i],rotation=0,verticalalignment='center_baseline') 
    ax[i].yaxis.set_label_coords(-0.04,0.5)
    
    

plt.show()

#print (array[:,0])
'''
while row: 
    print ( row[0] )
    row = cursor.fetchone()

'''
