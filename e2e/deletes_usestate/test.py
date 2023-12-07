import pyautogui
import time
import sys
import os

ui = pyautogui
path = sys.argv[1]

ui.write("dah")
ui.hotkey("shift")
ui.write(":wqa")
ui.hotkey("enter")

time.sleep(1)
expected = open(path + "/expected.jsx", 'r')
got = open(path + "/totest.jsx", 'r')

expected_content = expected.read()
got_content = got.read()

expected.close()
got.close()

assert(expected_content == got_content)
sys.stdout.write('\x1b[1;32m' + 'file edited successfully' + '\x1b[0m' + '\n')
