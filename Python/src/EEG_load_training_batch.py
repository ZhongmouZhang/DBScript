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


