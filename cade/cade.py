from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium import webdriver
import multiprocessing, time

opt=webdriver.ChromeOptions()
opt.add_argument("--mute-audio")
opt.add_argument("--disable-blink-features=AutomationControlled")
opt.add_experimental_option("excludeSwitches", ["enable-automation"])
opt.add_experimental_option("useAutomationExtension", False)

DELAY:int=30
BANNER = '''\n
          o
       o^/|\^o
    o_^|\/*\/|^_o
   o\*`'.\|/.'`*/o
    \\\\\\\\\\\\|//////
     {><><@><><}
     `"""""""""`\n
\tA Youtube views generator, with multiprocessing.
\tInspired to "Cade", the greatest carder.
'''

def main(sex:str, times:int=0xff)-> None:
    global DELAY, opt
    son_arkos = webdriver.Chrome(options=opt);
    cookies = ('//*[@id="content"]/div[2]/div[6]/div[1]/ytd-button-renderer[2]'+
               '/yt-button-shape/button/yt-touch-feedback-shape/div/div[2]')
    for _ in range(times) if times is int else times:
        son_arkos.get(sex);
        time.sleep(DELAY/10-1);  #delay to accept cookies
        son_arkos.find_element(By.XPATH, cookies).click();
        Keys.SPACE;
        time.sleep(DELAY+5);
        son_arkos.delete_all_cookies() #son_arkos.refresh() will crush lol
    son_arkos.close()

if __name__ == "__main__":
    try:
        print(BANNER)
        cade:list=[]
        url:str=input("Youtube video URL: ")
        times=input("(press enter to loop) Number of times: ")
        tabs=input("Number of tabs: ")
        if times == "" or "\n": times=iter(int,1)
        for k in range(int(tabs)):
            kk=multiprocessing.Process(target=main,args=(url,times),)
            kk.start();cade.append(kk)
        for kkk in cade: kkk.join()
    except Exception as e:
        quit(f"\nERROR:{e}\n");
else: pass
