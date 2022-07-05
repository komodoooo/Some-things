from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium import webdriver
import time

def main(sex:str, times:int) -> None:
    son_arkos = webdriver.Chrome();
    son_arkos.get(sex);
    time.sleep(3);           #delay to accept cookies
    xpath = ("/html/body/ytd-app/ytd-consent-bump-v2-lightbox/tp-yt-paper-dialog/div[4]/div[2]/div[6]/div[1]/"+
            "ytd-button-renderer[2]/a/tp-yt-paper-button/yt-formatted-string");
    cookies = son_arkos.find_element(By.XPATH, xpath);
    cookies.click();
    for _ in range(0x0, times):
        son_arkos.get(sex);
        Keys.SPACE;
        time.sleep(5);
        son_arkos.refresh();
        
if __name__ == "__main__":
    try:
        main(str(input("Url: ")), int(input("Times: ")));
    except Exception as e:
        print(f"\nERROR:{e}\n");
