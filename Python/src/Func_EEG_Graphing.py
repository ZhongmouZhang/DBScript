import pyodbc as pd
import numpy as np
import matplotlib as mpl
import matplotlib.pyplot as plt
from matplotlib.widgets import Slider

# set smaller font size
# file_name = 'B5'
# datetime_begin = '2018-12-13 13:38:45'
# frame_number = 4

def draw_EEG_wave (cursor, file_name, datetime_begin, frame_number, data_from='training', figure_size = (10,20)):
    mpl.rcParams['font.size'] = 10.
    if data_from == 'training':
        cursor.execute("{CALL sp_load_graphing_frame (@file_name=?, @datetime_begin=?, @frame_number=?)}", (file_name, datetime_begin, frame_number)) 
    else:
        cursor.execute("{CALL sp_load_graphing_frame_for_test (@file_name=?, @datetime_begin=?, @frame_number=?)}", (file_name, datetime_begin, frame_number)) 
    rows = cursor.fetchall() 
    array = np.array(rows, float)

    array_max = np.max(array)
    array_min = np.min(array)

    list_channel = ['FP2_N','F4_N','C4_N','P4_N','O2_N','FP1_N','F3_N','C3_N','P3_N','O1_N','F8_N','T4_N','T6_N', 'F7_N','T3_N','T5_N','FZ_N','CZ_N', 'PZ_N',]

    x = np.arange(0, len(array)/512.0, 1/512)


    fig, ax = plt.subplots(19,1, figsize=figure_size, sharex=True, frameon=False)
    plt.subplots_adjust(bottom=0.07, top=0.99, left=0.1, right=0.98, hspace=0.37)
    plt.title(datetime_begin)

    for i in range (19):
        ax[i].axis([0, len(array)/512.0, array_min, array_max]) 
        ax[i].plot(x,array[:,i])
        ax[i].set_ylabel(list_channel[i],rotation=0,verticalalignment='center_baseline') 
        ax[i].yaxis.set_label_coords(-0.08,0.5)
        
    plt.show()
