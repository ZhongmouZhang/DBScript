import numpy as numpy
import EEG_load_training_batch as ltb

X, Y = ltb.load_mini_batch(2)

print (X.shape, Y.shape)