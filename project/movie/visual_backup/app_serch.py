import streamlit as st
import pandas as pd

from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time
import urllib.request
import os
import pandas as pd

from tkinter.tix import COLUMN
from pyparsing import empty

# st.set_page_config(layout="wide")
# con1 = st.columns([0.5])
#con1 = st.columns([1.0])
#empty1,con2,con3,empty2 = st.columns([0.3,0.5,0.5,0.3])
# con4 = st.columns([1])

def run_serch() :
    con1 = st.columns([1.0])
    empty1,con2,con3,empty2 = st.columns([0.3,0.5,0.5,0.3])
#with con1 :
    st.title('영화 추천')

    with empty1 :
        empty()

    with empty2 :
        empty()
    #with con1 :
    df_pivot = pd.read_csv('data/df_pivot.csv')

    col = df_pivot.columns[1:]
    choice_movie = st.selectbox('별점매길 영화 선택', col)

    with con2 :
        st.title('이영화는')
        # ###########
        # # if st.button('보여주기') :
        # chrome_path ='C:\\Users\\-\\Documents\\GitHub\\yh_seo\\project\\movie\\croll\chromedriver.exe'
        # base_url = "https://www.google.co.kr/imghp"

        # chrome_options = webdriver.ChromeOptions()
        # # chrome_options.add_argument('--headless') # 창 없는 모드
        # # headless 모드의 호환성을 위해 아래 옵션 추가(가끔 막는 웹이 있음)
        # #chrome_options.add_argument("user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36")
        # chrome_options.add_argument("lang=ko_KR") # 한국어
        # chrome_options.add_argument('window-size=1920x1080')
        # # chrome_options.add_argument('--no-sandbox')
        # # chrome_options.add_argument('--disable-dev-shm-usage')


        # driver = webdriver.Chrome(chrome_path,chrome_options=chrome_options)
        # driver.get(base_url)
        # driver.implicitly_wait(3) # element가 로드될 때까지 지정한 시간만큼 대기할 수 있도록 설정
        # driver.get_screenshot_as_file('google_screen.png')
        # driver.close()

        # def selenium_scroll_option():
        #     SCROLL_PAUSE_SEC = 3
            
        #     # 스크롤 높이 가져옴
        #     last_height = driver.execute_script("return document.body.scrollHeight")
            
        #     while True:
        #         # 끝까지 스크롤 다운
        #         driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")

        #         # 1초 대기
        #         time.sleep(SCROLL_PAUSE_SEC)

        #         # 스크롤 다운 후 스크롤 높이 다시 가져옴
        #         new_height = driver.execute_script("return document.body.scrollHeight")
            
        #         if new_height == last_height:
        #             break
        #         last_height = new_height

        # a= 'movie ' + choice_movie
        # image_name = 'amugona'
        # #b=int(input("몇 개 저장할래? : "))
        # driver = webdriver.Chrome(chrome_path)
        # driver.get('http://www.google.co.kr/imghp?hl=ko')
        # browser = driver.find_element_by_name("q")
        # browser.send_keys(a)
        # browser.send_keys(Keys.RETURN)

        # images = driver.find_elements_by_css_selector(".rg_i.Q4LuWd") #  클래스 네임에서 공백은 .을 찍어줌
        # images_url = []
        # for i in images: 

        #     if i.get_attribute('src')!= None :
        #             images_url.append(i.get_attribute('src'))
        #     else :
        #         images_url.append(i.get_attribute('data-src'))
        # driver.close()

        # img = images_url[0]
        # st.image(img)

    with con3 :
        df_overview = pd.read_csv('data/df_overview.csv', index_col=0)
        over = df_overview.set_index('title').loc[choice_movie][0]
        st.markdown(over)

    ###########
    # with con1 :
    choice_rating = st.selectbox('별점 선택', range(1, 5+1))



    user_rating_reset = pd.read_csv('data/user_rating_reset.csv', index_col= 0)

    user_rating = pd.read_csv('data/user_rating.csv', index_col= 0)

    if st.button('저장하기') :
        if ( user_rating.loc[ user_rating['userId'] == 999 , ]['userId'].tolist() ) == [] :
            user_rating = user_rating_reset.append( { 'title' : choice_movie , 'userId' : 999, 'rating' : float(choice_rating) }, ignore_index=True )
            user_rating.to_csv('data/user_rating.csv')
            
        elif ( ( (user_rating.loc[ user_rating['userId'] == 999 , ])['userId'] == 999).tolist() )[0] :
            user_rating = user_rating.append( { 'title' : choice_movie , 'userId' : 999, 'rating' : float(choice_rating) }, ignore_index=True )
            user_rating.to_csv('data/user_rating.csv')
            
    if st.button('리셋하기') :
        user_rating = user_rating_reset
        user_rating.to_csv('data/user_rating.csv')

    if st.checkbox('부분 삭제하기') :
        # user_title = user_rating['title'].values
        user_title = list(enumerate(user_rating['title'].values))
        user_title_select = st.selectbox('삭제할 영화 선택', user_title)
        if st.button('삭제') :
            user_rating = user_rating.drop(index= user_title_select[0]
            , axis=0)
            user_rating.to_csv('data/user_rating.csv')

    st.subheader('나의 영화들')
    st.dataframe(user_rating)

    if st.button('내 영화들의 추천 영화 보기') :
        # 내가 영화에 준 별점을 상관계수
        # 에 채우는 작업
        df_corr = pd.read_csv('data/df_corr.csv', index_col='title')
        similar_movies_list = pd.DataFrame()

        for i in range( user_rating.shape[0] ) :
            movie_name = user_rating['title'][i]
            recom_movies = df_corr[movie_name].sort_values(ascending=False).to_frame()
            recom_movies.columns = ['correlation']
            recom_movies['weight'] = user_rating['rating'][i] * recom_movies['correlation']
            similar_movies_list = similar_movies_list.append( recom_movies )

        # 내 영화들 지우고 추천영화만 정렬해서 보여주는 작업
        similar_movies_list = similar_movies_list.sort_values('weight' , ascending=False)
        user_rating['title'].to_list()
        similar_movies_list.drop( user_rating['title'].to_list() , axis=0,  inplace= True )

        similar_movie = similar_movies_list.groupby('title')['weight'].max().sort_values(ascending = False).to_frame().reset_index()
        similar_movie = similar_movie.loc[ : , 'title' ].to_frame().head(5)

        st.dataframe(similar_movie)
