# EDA : Spotify Playing History 🎵

![image](https://user-images.githubusercontent.com/40135948/148650425-f6445c27-ebda-424b-91b7-215ce97bfa26.png)

</br>

## Data source : Email sent by Spotify on request from the [website](https://www.spotify.com/us/account/privacy/)

</br>

## Context :

</br>


Dataset contains history of the tracks played by me and contains following features. 

- End time
- artist name 
- track name 
- duration played 

</br>

# Notebook content

- Data Presentation & collections 
  - working with json files  
  -  getting audio feature of the track using **Spotify API**

</br>

- EDA 
  - duration played distribution
  - top 10 songs by duration played
  - top 10 artist by duration played
  - Top 10 artist by number of songs
  - Top 3 songs of top artists
  - played time analysis by 
      - hour
      - day of the week 
      -  day of the month and
      -   month of the year
  - Nature of  top 100 songs 
  - Nature of top 5 songs
  - Nature of top 5 artist

## Used Libraries :
- Pandas : For cleaning and anlysis
- Numpy  : For repid and easy operations on arrays
- Matplotlib : For creating visualization
- Seaborn : To create beautiful-looking visualizations   
- plotly : To create beautiful-looking visualizations   

</br>

# Insights

## Duration played distribution

</br>

![image](https://user-images.githubusercontent.com/40135948/148650456-ab054d44-905d-4f5c-a7d1-e08d22b97849.png)

</br>


- most songs that i have played lasts between 2 to 4 minutes

## Top 10 songs by duration

</br>

![image](https://user-images.githubusercontent.com/40135948/148650557-9c0bf4ae-b81a-40b1-a347-dc3ccf21ff18.png)



</br

- Most played song is bad habit that i have played for more than 2 hours 
- second and third spot is secured by Fallin and Perfect with more than 1:30 hours play time
- other top 10 songs are played more than 1 hour 

## Top 10 artist by duration played

</br>

![image](https://user-images.githubusercontent.com/40135948/148650565-fda928e6-3fed-4f53-97b2-bf88b6fd391f.png)


</br

- ed sheeran ,tylor and AJR  are top artist in terms of durations listened 

## Top 10 artist by number of songs

</br>

![image](https://user-images.githubusercontent.com/40135948/148650578-0ce061ec-8bce-4066-b585-c5021b23ef5c.png)


</br

- Ariana grande , AJR and ed sheeran are top 3 atists in terms of Number of tracks listened

## Top 3 songs of top artists

</br>

![image](https://user-images.githubusercontent.com/40135948/148650592-62035c86-128e-4e16-97cc-97b5c95fe35e.png)


</br>


## Played time analysis

</br>

![image](https://user-images.githubusercontent.com/40135948/148650616-6b0c27cb-cd5f-47d1-b26a-f97f9b920f63.png)


</br>

- peack hours are between 10 AM to 2 PM
- There's also decent amount of use between 2 AM to 7 AM 

</br>

![image](https://user-images.githubusercontent.com/40135948/148650626-fed2552a-4623-47e3-b4d4-6b889207f230.png)


</br>


- I use spotify mostly on weekends and thursday

</br>

![image](https://user-images.githubusercontent.com/40135948/148650645-b5df70c2-edf3-4d74-8322-1b928d5cc127.png)


</br>

- use of spotify increases around date 10 and 20 and rest of the time it keeps fluctuating 

</br>

![image](https://user-images.githubusercontent.com/40135948/148650663-d38bd121-2326-42ae-a9ba-7a309dba8373.png)


</br>

- Use of spotify was highest in first two month
- March ,June , September, october and december have decent amount of use
- rest of the month have very low usage

## Nature of my top 100 songs

</br>

![image](https://user-images.githubusercontent.com/40135948/148650715-a4a0db2c-9c5f-4ff9-9d9c-a31464625bd6.png)


</br>

- most od the songs are high in mode dancebility and energy 

## Nature of My top 5 songs

</br>

![image](https://user-images.githubusercontent.com/40135948/148650746-756eed8f-8a79-4d39-9f8d-8f632f765c12.png)

</br>

- all the songs have high energy and dancebility
- All the songs have high mode except bad habit
- There's only one song which have high valence


## Nature of my top 5 artist

</br>

![image](https://user-images.githubusercontent.com/40135948/148650771-0fc215ce-2361-4d0b-9613-a4197cfa1468.png)

</br>

- Top 3 artists have high melody (ed, tylor and AJR)
- The valence is low for all of them except shown mendes and ed sheeran 
- energy and danceablity is decent for all the artists
