import pyodbc as pd
import numpy as np


def load_batch_of_ten_second (cursor, batch_number):
    #Call a stored procedure
    id = 0
    cursor.execute("{CALL sp_load_training_sample_of_ten_second (@batch_number=?, @id=?)}", (batch_number, id)) 
    id, tagged, _ = cursor.fetchone()
    cursor.nextset()
    rows=cursor.fetchall()
    X = np.array(rows, float).reshape((1,5120, 19))

    if tagged == 'Y':
        Y = [[1]]
    else:
        Y = [[0]]


    while tagged is not None:
        cursor.execute("{CALL sp_load_training_sample_of_ten_second (@batch_number=?, @id=?)}", (batch_number, id)) 
        id, tagged, _ = cursor.fetchone()
        if tagged is not None:
            cursor.nextset()
            rows=cursor.fetchall()
            array = np.array(rows, float).reshape((1, 5120, 19))
            X = np.append(X,array, axis = 0)
            if tagged == 'Y':
                Y = np.append(Y,[[1]],axis=0)
            else:
                Y = np.append(Y,[[0]], axis = 0)

    return (X,Y)


def load_batch_of_one_second (cursor, batch_number):

    #Call a stored procedure
    id = 0
    cursor.execute("{CALL sp_load_training_sample_of_one_second (@batch_number=?, @id=?)}", (batch_number, id)) 
    id, tagged, _ = cursor.fetchone()
    cursor.nextset()
    rows=cursor.fetchall()
    X = np.array(rows, float).reshape((1, 512, 19))

    if tagged == 'Y':
        Y = [[1]]
    else:
        Y = [[0]]


    while tagged is not None:
        cursor.execute("{CALL sp_load_training_sample_of_one_second (@batch_number=?, @id=?)}", (batch_number, id)) 
        id, tagged, _ = cursor.fetchone()
        if tagged is not None:
            cursor.nextset()
            rows=cursor.fetchall()
            array = np.array(rows, float).reshape((1, 512, 19))
            X = np.append(X,array, axis = 0)
            if tagged == 'Y':
                Y = np.append(Y,[[1]],axis=0)
            else:
                Y = np.append(Y,[[0]], axis = 0)

    return (X,Y)

def load_predicated_batch_of_one_second (cursor, file_name):
    stamp_begin = 0
    cursor.execute("{CALL sp_load_test_sample_of_one_second (@file_name=?, @stamp_begin=?)}", (file_name, stamp_begin)) 
    _, stamp_begin, _ = cursor.fetchone()
    cursor.nextset()
    rows=cursor.fetchall()
    X = np.array(rows, float).reshape((1, 512, 19))
    stamp_array = [[stamp_begin]]
 
    while stamp_begin is not None:
        cursor.execute("{CALL sp_load_test_sample_of_one_second (@file_name=?, @stamp_begin=?)}", (file_name, stamp_begin)) 
        _, stamp_begin, _ = cursor.fetchone()
        if stamp_begin is not None:
            cursor.nextset()
            rows=cursor.fetchall()
            array = np.array(rows, float).reshape((1, 512, 19))
            X = np.append(X,array, axis = 0)
            stamp_array = np.append(stamp_array, [[stamp_begin]], axis = 0)

    return (X,stamp_array)

def retrieve_test_file_name (cursor):
    cursor.execute ("select distinct file_name from tbl_test_set_list_of_one_second order by file_name" )
    return (cursor.fetchall())


def load_sample_of_one_second_randomly (cursor, batch_number = 0, tagged = '', swapped = ''):
    cursor.execute("{CALL sp_load_training_sample_of_one_second_randomly (@batch_number=?, @tagged=?, @swappe=?)}", (batch_number, tagged, swapped)) 
    id, tagged, _ = cursor.fetchone()
    cursor.nextset()
    rows=cursor.fetchall()
    X = np.array(rows, float).reshape((1, 512, 19))

    if tagged == 'Y':
        Y = [[1]]
    else:
        Y = [[0]]
    return (X,Y)


