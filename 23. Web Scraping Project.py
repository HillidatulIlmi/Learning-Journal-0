from bs4 import BeautifulSoup
import requests
from selenium import webdriver
import pandas as pd
import time

driver = webdriver.Chrome('chromedriver')

driver.get('https://news.ycombinator.com/')

def scrap():

    data1 = []
    data2 = []

    for i in range(1,3):
        url ='https://news.ycombinator.com/news?p={}'.format(i)
        driver.get(url)
        response = requests.get('https://news.ycombinator.com/').text
        soup = BeautifulSoup(response,'lxml')

        data1 += [title.text for title in soup.find_all('a',class_='titlelink')]
        data2 += [info['href'] for info in soup.find_all('a',class_='titlelink')]

        data_final = pd.DataFrame()
        data_final['title'] = data1
        data_final['info'] = data2
    
    data_final.to_csv(r'D:/materi/ngajar/bahan/web_scrap/data_final.csv',index=False)

index = 0
while True :
    scrap()
    index +=1
    time_wait = 1
    print(f'run ke {index}')
    print(f'time wait  {time_wait} menit')
    time.sleep(time_wait*60)

    

