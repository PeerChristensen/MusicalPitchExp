#This is a PsychoPy script used to play auditory stimuli, 
# A3 tones of durations 1000-5000 msec in 5oo msec intervals, played in pairs.
#Author: Peer Christensen

from psychopy import core, visual, gui, monitors, sound, event
import random, os
from random import sample
import numpy as np

win= visual.Window([1000,800], monitor="testMonitor",color=(-1,-1,-1))

durations=[]
for i in np.arange(1,5.1,0.5):
    durations.append(i)
random.shuffle(durations)

durations2=[]
for i in np.arange(1,5.1,0.5):
    durations2.append(i)
random.shuffle(durations2)

def runExp():
    event.waitKeys(keyList=['return'])
    core.wait(0.4)
    for i in range(1,len(durations)+1):
        trialNum=visual.TextStim(win=win,text=str(i))
        trialNum.draw()
        win.flip()
        stim1=sound.Sound('A',octave=3,sampleRate=44100,secs=durations[i],stereo=True)
        stim2=sound.Sound('A',octave=3,sampleRate=44100,secs=durations2[i],stereo=True)
        core.wait(1)
        stim1.play()
        core.wait(durations[i])
        core.wait(2)
        stim2.play()
        core.wait(0.2)
        win.flip()
        event.waitKeys(keyList=['return'])

runExp()
win.close()
core.quit()
