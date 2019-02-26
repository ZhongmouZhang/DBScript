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
server = 'SDDBSSBX004' 
database = 'EEG_Data' 
cnxn = pd.connect('DRIVER={ODBC Driver 13 for SQL Server};SERVER='+server+';DATABASE='+database+';Trusted_Connection=Yes')
cursor = cnxn.cursor()

#Call a stored procedure
file_name = 'C2'
datetime_begin = '2018-12-13 07:58:52'
cursor.execute("{CALL sp_load_graphing_frame (@file_name=?, @datetime_begin=?)}", (file_name, datetime_begin)) 
rows = cursor.fetchall() 
array = np.array(rows, float)
array_max_per_channel = np.max(array, axis=0)
array_min_per_channel = np.min(array, axis=0)
list_channel = ['FP2_N','F4_N','C4_N','P4_N','O2_N','FP1_N','F3_N','C3_N','P3_N','O1_N','F8_N','T4_N','T6_N', 'F7_N','T3_N','T5_N','FZ_N','CZ_N', 'PZ_N',]

x = np.arange(0,10.0, 1/512)


fig, ax = plt.subplots(19,1, figsize=(20,20), sharex=True, frameon=False)
plt.subplots_adjust(bottom=0.10, top=0.97, left=0.05, right=0.98, hspace=0.37)
plt.title(datetime_begin)




# plt.yticks([])
# ax[0].grid(False)
# ax[18].grid(False)


for i in range (19):
    # ax[i].axis([0, 10, array_min_per_channel[i], array_max_per_channel[i]]) 
    ax[i].axis([0, 10, -200, 200]) 
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
