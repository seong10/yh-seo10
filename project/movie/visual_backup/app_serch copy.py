import streamlit as st
import pandas as pd

def run_serch() :

    df_pivot = pd.read_csv('data/df_pivot.csv')

    col = df_pivot.columns[1:]
    choice_movie = st.selectbox('별점매길 영화 선택', col)
    choice_rating = st.selectbox('별점 선택', range(1, 5+1))

    df = pd.read_csv('data/df.csv', usecols= [1, 3, 2])
    df_user = pd.read_csv('data/df_user.csv', usecols= [1, 3, 2])

    if st.button('저장하기') :
        if ( df_user.loc[ df_user['userId'] == 999 , ]['userId'].tolist() ) == [] :
            df_user = df.append( { 'title' : choice_movie , 'userId' : 999, 'rating' : float(choice_rating) }, ignore_index=True )
            df_user.to_csv('data/df_user.csv')
   
        elif ( ( (df_user.loc[ df_user['userId'] == 999 , ])['userId'] == 999).tolist() )[0] :
            df_user = df_user.append( { 'title' : choice_movie , 'userId' : 999, 'rating' : float(choice_rating) }, ignore_index=True )
            df_user.to_csv('data/df_user.csv')

    if st.button('리셋하기') :
        df_user = df
        df_user.to_csv('data/df_user.csv')

    st.dataframe(df_user.loc[ df_user['userId'] == 999 , ])
    st.dataframe(df_user) 