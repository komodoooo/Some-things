from time import sleep
from threading import Thread
from keyboard import is_pressed
from pyautogui import prompt, confirm, alert, leftClick
thunberg=False
def detect(char:str):
    global thunberg
    while True:
        if is_pressed(char): 
            thunberg=True
            return
try:
    nigga:str=prompt("Type the stop execution character: ")
    if len(nigga)!=1: raise TypeError("Write a character.")
    delay=float(prompt("Type the delay: "))
    confirm(f"You can press '{nigga}' during execution to stop.\nPress OK to start in 3 seconds.")
    sleep(3)
    dk=Thread(target=detect, args=(nigga,))
    dk.start()
    while not thunberg:
        leftClick()
        sleep(delay)
except Exception as e:
    alert(str(e))
