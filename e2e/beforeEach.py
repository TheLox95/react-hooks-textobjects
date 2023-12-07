import pyautogui
import sys
import time
import os

ui = pyautogui

ui.hotkey("winleft", "shitf", "T")
time.sleep(1)

root_dir = os.getcwd()
ui.write("vim " + root_dir + sys.argv[1][1:] + "/totest.jsx")
ui.hotkey("enter")
