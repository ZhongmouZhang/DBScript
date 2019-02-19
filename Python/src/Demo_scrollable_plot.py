import numpy as np
import matplotlib.pyplot as plt
from matplotlib.widgets import Slider


fig, ax = plt.subplots(19,1, figsize=(20,20))
plt.subplots_adjust(bottom=0.16, top=0.99, left=0.09, right=0.97, hspace=0.35)

t = np.arange(0.0, 100.0, 0.1)
s = np.sin(np.pi*t)
ax[0].plot(t,s)
ax[18].plot(t, 10*s)

# axis = [x_min, x_max, y_min, y_max]
plt.axis([0, 10, -1, 1])  

axcolor = 'lightgoldenrodyellow'
# axes rect = [left, bottom, width, height] ; the value is the percentage of the whole figure size
axpos = plt.axes([0.2, 0.1, 0.65, 0.03], facecolor=axcolor)

spos = Slider(axpos, 'Pos', 0, 90, valstep=1)

def update(val):
    pos = spos.val
    ax[0].axis([pos,pos+10,-1,1])
    ax[18].axis([pos,pos+10,-20,20])
    # plt.axis([pos,pos+10,-2,2])
    fig.canvas.draw_idle()

spos.on_changed(update)

plt.show()