import streamlit as st

from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time
import urllib.request
import os
import pandas as pd

import pickle


def run_info() :

    chrome_path ='C:\\Users\\-\\Documents\\GitHub\\yh_seo\\project\\movie\\croll\chromedriver.exe'
    base_url = "https://www.google.co.kr/imghp"

    chrome_options = webdriver.ChromeOptions()
    # chrome_options.add_argument('--headless') # 창 없는 모드
    # headless 모드의 호환성을 위해 아래 옵션 추가(가끔 막는 웹이 있음)
    #chrome_options.add_argument("user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36")
    chrome_options.add_argument("lang=ko_KR") # 한국어
    chrome_options.add_argument('window-size=1920x1080')
    # chrome_options.add_argument('--no-sandbox')
    # chrome_options.add_argument('--disable-dev-shm-usage')


    driver = webdriver.Chrome(chrome_path,chrome_options=chrome_options)
    driver.get(base_url)
    driver.implicitly_wait(3) # element가 로드될 때까지 지정한 시간만큼 대기할 수 있도록 설정
    driver.get_screenshot_as_file('google_screen.png')
    driver.close()

    def selenium_scroll_option():
        SCROLL_PAUSE_SEC = 3
        
        # 스크롤 높이 가져옴
        last_height = driver.execute_script("return document.body.scrollHeight")
        
        while True:
            # 끝까지 스크롤 다운
            driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")

            # 1초 대기
            time.sleep(SCROLL_PAUSE_SEC)

            # 스크롤 다운 후 스크롤 높이 다시 가져옴
            new_height = driver.execute_script("return document.body.scrollHeight")
        
            if new_height == last_height:
                break
            last_height = new_height

    df_pivot = pd.read_csv('data/df_pivot.csv')
    col = df_pivot.columns[1:]
    choice_movie = st.selectbox('별점매길 영화 선택', col)

    a= 'movie ' + choice_movie
    image_name = 'amugona'
    #b=int(input("몇 개 저장할래? : "))
    driver = webdriver.Chrome(chrome_path)
    driver.get('http://www.google.co.kr/imghp?hl=ko')
    browser = driver.find_element_by_name("q")
    browser.send_keys(a)
    browser.send_keys(Keys.RETURN)

    images = driver.find_elements_by_css_selector(".rg_i.Q4LuWd") #  클래스 네임에서 공백은 .을 찍어줌
    images_url = []
    for i in images: 
    
        if i.get_attribute('src')!= None :
                images_url.append(i.get_attribute('src'))
        else :
            images_url.append(i.get_attribute('data-src'))
    driver.close()

    #img = images_url[20]
    with open('data/url_dict.pickle', 'rb') as f:
    url_dict = pickle.load(f)

    url_dict[choice_movie]
    st.image(url_dict)

    df_overview = pd.read_csv('data/df_overview.csv', index_col=0)
    over = df_overview.set_index('title').loc[choice_movie][0]
    st.text(over)