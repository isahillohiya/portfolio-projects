# EDA : Hollywood Theatrical Market Synopsis 1995 to 2021 

![image](https://user-images.githubusercontent.com/40135948/148254424-bd844eef-42ff-4d03-b5ae-4f5fab32146d.png)

</br>

## Data source : [ Hollywood Theatrical Market Synopsis 1995 to 2021 ](https://www.kaggle.com/johnharshith/hollywood-theatrical-market-synopsis-1995-to-2021)

## Context :
</br>
This Dataset contains the data of market analysis built on The Numbers unique categorization system, which uses 6 different criteria to identify a movie. All movies released since 1995 are categorized according to the following attributes: 

</br>

- Creative type (factual, contemporary fiction, fantasy etc.), 
-  Source (book, play, original screenplay etc.)
-  Genre (drama, horror, documentary etc.)
-  MPAA rating
-  Production method (live action, digital animation etc.) 
-  Distributor. 

</br>

In order to provide a fair comparison between movies released in different years, all rankings are based on ticket sales, which are calculated using average ticket prices announced by the MPAA in their annual state of the industry report.

</br>

## Notebook content

- Data cleaning 
  - Dealing with null values
  - Data type converting 
  - Removing undesired columns

</br>

- EDA
  -  Analysis and Visulization of following data 
     - Anual ticket sales
     - High Gross fils   
     - Creative type
     -  Source
     -  Genre
     -  MPAA rating
     -  Production method
     -  Distributor

</br>

## Used Libraries :
- Pandas : For cleaning and anlysis
- Numpy  : For repid and easy operations on arrays
- Matplotlib : For creating visualization
- Seaborn : To create beautiful-looking visualizations   
- os : to access data easily 
- re : To use regex while clean data
- numerize : To convert big number into words and

</br>

# Insights

## Anual ticket sales:

![image](https://user-images.githubusercontent.com/40135948/148254589-888deb6c-4663-480e-9fd2-2d48d98029e0.png)

</br>

- Ticket sales was booming untill 2002 Then it started gradually decresing 
- There is dramatic drop in ticket sales in 2020 that is most probabily due to covid-19
- Ticket sales is seeing recovery in 2021 that

</br>

![image](https://user-images.githubusercontent.com/40135948/148254684-e68a4743-cf10-4a61-a21c-6f4448982221.png)

</br>

- Highests : 2002 (1.58B)
- Lowest : 2020 : (223.64M)

</br>

## Highest Gross films
</br>

### Genre :

![image](https://user-images.githubusercontent.com/40135948/148254731-9d7acbd8-66d8-441e-b294-a21b44c50b3f.png)


</br>

- Majority of the films belongs to **Adventure** genre followed by **action** genre 
- Similar trend is for **average Revenue**, **Adventure** genre have highest highest revenue followed by **action**.

</br>

### Rating

![image](https://user-images.githubusercontent.com/40135948/148254780-c04624f2-f859-42bd-b6c6-1835fc3d046a.png)


</br>

- Majority of the films belongs to **PG-13(19)** rating 
- **PG** is second highest(5) reting that is much lower compared to **PG-13**
- **PG-13** generate highest revenue followed by **PG** and **G**, respectivly.

</br>

### DISTRIBUTOR

![image](https://user-images.githubusercontent.com/40135948/148254824-72bfc1f6-9c4c-4de4-9edb-c251e0074fa3.png)


</br>

- Top distributor in terms of Number of fils is **walt disney** with **12** films, followed by **warner bros.** and **Sony Pictures** with 4 films each.
  
- However,In terms of total revenue, **20th century Fox , Dreamworks SKG and Paramount pictures** tops the table with **\$678** , **\$650** and **\$651** , respectivly.
  
- similar can be seen with Total tickets sold


## Popular creative types

![image](https://user-images.githubusercontent.com/40135948/148254876-88974724-33d4-4662-823c-ad50af42a0e5.png)


- More than **50%** released films are **contemporary fiction** 
- Second biggest chunk(16.7%) is occupied by **Factual** movies
- **Supar hero** movies have the lowest release number.

</br>

![image](https://user-images.githubusercontent.com/40135948/148254916-bad4823b-c53c-4bb1-b4cc-340f2bb2451c.png)

</br>

- In terms of **Total Gross** Top 3 creative types are Contemporaty fiction, kids fiction and Science fiction 
- Eventhough **super hero** creative type have lowest release count it have the highest average revenue In terms of **Average Gross** followed by **Kids fictiom** and **science fiction**. 

- on the other hand, Factual movies have second highest release count but have the lowest revenue in terms of **Average Gross** as well as **Total Gross**

## Top Distributors

</br>

![image](https://user-images.githubusercontent.com/40135948/148254968-7d273d3b-4f29-4f0b-a0c0-63f86c16ada4.png)


</br>

  - **Warner bros** have distributed most number of films with **17.1%** of market share Followed by **Sony Pictures** with **15.5%** market share
  
- other top distributor like **Walt Disney** , **Universal** ,  **20th century fox** and **Paramount Pictures** have market share between around **10%** to **12%**  

</br>

![image](https://user-images.githubusercontent.com/40135948/148255030-27e0b51d-75cd-4cbd-a45c-a1b925fadc98.png)


</br>

- **Walt Diseney** is 3rd largest distributor but it has the highest **Average gross** as well as **Total Gross**
- **Warner Bro.** and **Soney Pictures** are largest and second largest distributor but they ranks 6th and 7th in terms of **Average gross**, respectivly.

- **Dreamwork SKG** distributes least number of films but it ranks second in terms of **Average gross**



## Top Genres

</br>

![image](https://user-images.githubusercontent.com/40135948/148255081-21abbc40-c9f6-470a-8127-3b4b2e9fbf2e.png)


</br>

 - People love watching drama as 35% of movies released are drama
- Other top genres are comedy and documentary with 15.6% share each.
- Black comedy and Musical have least number of releases.

</br>

![image](https://user-images.githubusercontent.com/40135948/148255109-24d241cc-9b0c-497d-9c12-a5b77256d77a.png)


</br>

- despite having low number of total releases, Adventure and Action are generating more in terms of both, total gross and average gross

- Eventhough, Documenry genre have high number of movies released, they have the second lowest in terms of gross and lowest in terms of average gross


## Top Grossing Ratings

</br>

![image](https://user-images.githubusercontent.com/40135948/148255208-810f953b-33cb-4964-b275-995752c65631.png)


</br>


- There is big chunck of 35% that is not being rated at all
- Most released films are **R** rated which account for **33%** followed by **PG-13** and **PG** with **19.6%** and **9.3%**

</br>

![image](https://user-images.githubusercontent.com/40135948/148255255-cf82c4ff-dde8-41f6-bab7-c824b0f20c4c.png)


</br>

- Not Rate films have terible Total as well as average GROSS despite have so many films released
- Even though **R** rated films have high release count, it ranks 4 in terms of average revenue where top 3 spots are secured by **PG-13** , **PG** and **G**

</br>

![image](https://user-images.githubusercontent.com/40135948/148255276-06619b52-e1ed-492e-920f-09d6a316088e.png)

</br>

- almost 95% of the fils are either PG-13, PG or R rated

## Top Grossing Sources

</br>

![image](https://user-images.githubusercontent.com/40135948/148255305-37c59c15-963f-4d84-9b7e-e9010e0f56a5.png)

</br>

- Majorty of the films are Original screenplay
- Second and third larged source of Films are Real life events and Fiction boook / short story respectivly. 

</br>

![image](https://user-images.githubusercontent.com/40135948/148255360-744632ab-078d-4b44-89da-751b271c3e0b.png)


</br>

- Original screenplay have highest total gross as it have highest number of released by it has 3rd lowest average revenue.
- on the other hand movies based on Novels have High total revenue and highst average revenue


## Top Production Methodsm

</br>

![image](https://user-images.githubusercontent.com/40135948/148255389-26543099-9418-4937-bf92-894171a66532.png)


</br>

- mejority of the films are produced through Live action method
- Considerable amount of movies are produced through Animation/Live action, Digital animation and hand animation
- other types have negligable number of movies

</br>

![image](https://user-images.githubusercontent.com/40135948/148255430-d851c036-1fb5-47df-9eb2-49910d083b7d.png)


</br>

- Live action have highest total gross as they have highest number of movies but they have bad average gross 
- animations seems to have good average gross dispite having low total gross


## WideReleasesCount

</br>

![image](https://user-images.githubusercontent.com/40135948/148255466-c2a60eea-752c-4e23-ba6f-2fdda3a65353.png)


</br>

- Top 6 major studios were releasing more than 100 movies every year untill 2008 and after that the number of movies started to fall
  
</br>

![image](https://user-images.githubusercontent.com/40135948/148255501-88f67945-00fa-4ca9-bb7e-d3b3f9068d3d.png)


</br>

- Initialy, Top 6 studios were producing low movies untill 2002 and after that they saw high groth untill 2008
after 2008 other studios have very big fluctions in number of releases
