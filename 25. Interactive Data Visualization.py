import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import plotly.express as px
import datetime

import streamlit as st

# st.title('My First App')

# st.header('This is Button')
# if st.button('click me!'):
#     st.write('Clicked!')
# else:
#     st.write('Click the Button!')
    
# st.header('This is checkbox')
# if st.checkbox('Hello, Click me!'):
#     st.write('Checked!')
# else:
#     st.write('Unchecked')

# st.header('Radio Button')
# selected_radio = st.radio('What is your favourite Genre', 
#                             ['Comedy', 'Romance', 'Action'])
# if selected_radio == 'Comedy':
#     st.write('Good Choice!')
# elif selected_radio == 'Romance':
#     st.write('Sweet!')
# else:
#     st.write('Bravo!')  

# st.header('This select box')
# selected_box = st.selectbox('What is your favourite Genre', 
#                             ['Comedy', 'Romance', 'Action'],
#                             index=1)
# if selected_box == 'Comedy':
#     st.write('Good Choice!')
# elif selected_box == 'Romance':
#     st.write('Sweet!')
# else:
#     st.write('Bravo!')  

# st.header('This is Multi-Select box')
# output_multi = st.multiselect('Your favourite colour?',
#                      ['Green', 'Yellow', 'Blue', 'Red'],
#                      ['Green', 'Blue'])

# st.write(type(output_multi))

# st.header('this is slider')
# slide = st.slider('Select Range of Values', 0, 20, [5, 10])
# st.write(slide)

# st.header('this is range select')
# slide = st.select_slider('Select fruits', ['Apple', 'Mango', 'Strawberry', 'Orange', 'Kiwi'],
#                             ['Apple', 'Strawberry'])
# st.write(slide)

# st.header('This date')
# st.date_input('Input date')

# st.header('This time')
# st.time_input('Set alarm', datetime.time(8, 30))

# st.sidebar.title('This is sidebar')
# st.sidebar.selectbox('select pages', ['page 1', 'page 2', 'page 3'])
# st.sidebar.caption('demo only')

# arr = np.random.normal(1,1, size=50)
# arr

# st.subheader('Matplotlib')
# fig, ax = plt.subplots()
# ax.hist(arr)

# st.pyplot(fig)

# st.subheader('seaborn')
# fig2, ax2 = plt.subplots()
# sns.histplot(arr, ax = ax2)

# st.plotly_chart(fig2)

# st.subheader('plotly')
# df = px.data.gapminder().query("country=='Canada'")
# fig = px.line(df, x="year", y="lifeExp", title='Life expectancy in Canada')

# st.plotly_chart(fig)

# @st.cache
# def load_data():
#     data = pd.read_csv('Pokemon.csv')
#     return data

# df = load_data()

# st.write(df)

# fig, ax = plt.subplots()
# sns.histplot(df['Attack'], ax=ax)
# st.pyplot(fig)

# # kombinasi dengan widget interactivity
# selected = st.selectbox('Select Type 1', list(df['Type 1'].unique()))

# fig1, ax1 = plt.subplots()
# sns.histplot(df[df['Type 1'] == selected]['Attack'], ax=ax1)
# st.pyplot(fig1)

# selected_2 = st.radio('Select Generation', [1, 2, 3, 4, 5, 6])

# fig2, ax2 = plt.subplots()
# sns.scatterplot(df[df['Generation']==selected_2]['Attack'], df[df['Generation']==selected_2]['Speed'], ax=ax2)
# st.pyplot(fig2)

import streamlit as st
import pandas as pd
import numpy as np

st.title('Uber pickups in NYC')

DATE_COLUMN = 'date/time'
DATA_URL = ('https://s3-us-west-2.amazonaws.com/'
            'streamlit-demo-data/uber-raw-data-sep14.csv.gz')

@st.cache
def load_data(nrows):
    data = pd.read_csv(DATA_URL, nrows=nrows)
    lowercase = lambda x: str(x).lower()
    data.rename(lowercase, axis='columns', inplace=True)
    data[DATE_COLUMN] = pd.to_datetime(data[DATE_COLUMN])
    return data

data_load_state = st.text('Loading data...')
data = load_data(10000)
data_load_state.text("Done! (using st.cache)")

if st.checkbox('Show raw data'):
    st.subheader('Raw data')
    st.write(data)

st.subheader('Number of pickups by hour')
hist_values = np.histogram(data[DATE_COLUMN].dt.hour, bins=24, range=(0,24))[0]
st.write(hist_values)
st.bar_chart(hist_values)

# Some number in the range 0-23
hour_to_filter = st.slider('hour', 0, 23, 17)
filtered_data = data[data[DATE_COLUMN].dt.hour == hour_to_filter]
st.write(filtered_data)
st.subheader('Map of all pickups at %s:00' % hour_to_filter)
st.map(filtered_data)