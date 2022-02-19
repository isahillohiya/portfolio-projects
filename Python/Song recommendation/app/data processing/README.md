# Data Collection

This python script scraps hot 100 songs from billboard website.
</br>


There are two files :
1. billboard.py : collects top songs name form the billboard website
2. data_prepraration.iptnb : Makes data almost model ready

</br>

## Steps 

1. collect songs ame with help of billboard.py

2. Find any good movie to watch in evening because this script is gonna take time 😁😁
   
3. Collect spotify_id with help of track and artist name through spotify api ; refer  data_prepraration.iptnb
4. Collect song features with help of spotify_id  ; refer  data_prepraration.iptnb

# Data processing 

1. Keep top 100 genres and put 'other' for other genres as there are aproxx 5000 according to one source  ; refer  data_prepraration.iptnb
   
Note : I had inserted this data on local machine and created sql file from that so that docker can read that easily insert data into mysql container