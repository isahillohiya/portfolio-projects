import requests
from bs4 import BeautifulSoup
import pandas as pd 
from datetime import  timedelta, datetime
import numpy as np
import time


baseURL = "https://www.billboard.com/charts/hot-100/"
# The script will scrap hot 100 songs from start_date till end_date 
start_date = '2021-06-06'
end_date = datetime.today()
interval = 7
# pointer_date contains date for which we want to scrap data 
pointer_date = datetime.strptime(start_date, '%Y-%m-%d')


hotHits = pd.DataFrame(columns = ['url' , 'weekid' , 'artist' ,'song' ])
# urls for which we faild to scrap data 
error_url = []
flag = 1

while flag:
  
    try:
	# as  we are incrementing 7 days at the end of loop this condition prevents loop from scraping future date data that would be unavailble.
        if pointer_date < end_date:
            ptr_date = str(pointer_date.date())   
               
        else:
            ptr_date = str(end_date.date())
            flag = 0
        # demo url : https://www.billboard.com/charts/hot-100/2003-03-15/
        url = baseURL + ptr_date  
        r = requests.get(url)
        htmlContent = r.content
        soup = BeautifulSoup(htmlContent,'html.parser')
    
            
    	
        table  = soup.find('div', class_="chart-results-list // lrv-u-padding-t-150 lrv-u-padding-t-050@mobile-max")
        ul = table.find_all('ul')
        
	# data is availble on every 3rd element in array    
        for i in np.arange(0,300,3):
            song = ul[i].find('h3').string.strip()

    
            artist = ul[i].find_all('li')[3].find('span').string.strip()
           
    
            tempdf = pd.DataFrame([[url ,ptr_date,artist,song]], columns=['url' , 'weekid' , 'artist' ,'song' ] )
           
            hotHits = hotHits.append(tempdf) 
        # incrimenting 7 days data as collecting weekly data
        pointer_date = pointer_date + timedelta(interval)    
    except:
        error_url.append(url)
        pointer_date = pointer_date + timedelta(interval)    
    time.sleep(5)
    
     

hotHits.to_csv("HotStuff.csv")