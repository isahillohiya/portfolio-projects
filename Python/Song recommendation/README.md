# Song recommendation engine 

It gives you Song recommendations based song similarity.

It has works in two steps:

 - **Song search**: Type the song name and select the song from drop down box (This engine have more than 24K top songs)
- **Recommendations** : It finds similar song  from database using 'spotify_genre','danceability','skey','valence','tempo' and give top 6 songs that matches these feature most.

K Nearest Neighbor algorith is used for recommendation engine

</br>

## Table of Contents 

- [Song recommendation engine](#song-recommendation-engine)

  - [Built With](#built-with)
  - [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installing](#installing)
  - [Deployment](#deployment)
  - [Data collection](#data-collection)
  - [##### add link for python script](#-add-link-for-python-script)
  - [Algorihm ](#algorihm)

## Built With

* [Flask](https://flask.palletsprojects.com/en/2.0.x/) - The web framework used
* [MYSQL](https://www.mysql.com/    ) - Database used
* [Python](https://docs.python.org/3/) - Programming Language used

</br>

## Getting-Started

These instructions will get you a copy of the project up and running on your local machine.To get started, __clone__ the repository to your system.

</br>

## Prerequisites

- **Docker Desktop** - Includes Docker Engine and Docker-Compose required to run the project.


Run the following command to check your installation:
```
$ docker --version
$ docker-compose --version
```

## Installing

</br>

After completing the above prerequisites all you need to do, are the following steps to get the project up and running!

**Kindly make sure the Ports 8080 of your system is available**

Set the downloaded repository as the current directory on your terminal/CMD :

```
 cd <repository-path>
```

Execute the following commands to get the project running

```
 docker-compose build
 docker-compose up
```

## Deployment

After the sucessfull execution of the above commands, you can check the deployment by.  

Going to your favorite browser and going to:  

```
localhost:8080
```

## Data collection 

## ##### add link for python script 

- Download data from [data.world](https://data.world/kcmillersean/billboard-hot-100-1958-2017) (Not upto date)
- Collect new songs name through [python script]()
- 
- Get features like energy and genre for newly collected songs through [spotify api](https://developer.spotify.com/documentation/web-api/)


## Algorihm :
 - K Nearest Neighbor algorith is used for recommendation engine.
  
  KNN is using [spotify features](https://medium.com/@boplantinga/what-do-spotifys-audio-features-tell-us-about-this-year-s-eurovision-song-contest-66ad188e112a) like:
- genre of artist
- danceability
- key 
- valance 
- tempo

