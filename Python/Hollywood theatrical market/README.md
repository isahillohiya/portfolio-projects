# EDA : Hollywood Theatrical Market Synopsis 1995 to 2021 

## Insert Image here

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

</br>

- Ticket sales was booming untill 2002 Then it started gradually decresing 
- There is dramatic drop in ticket sales in 2020 that is most probabily due to covid-19
- Ticket sales is seeing recovery in 2021 that

</br>

### insert highest lowest table here 

</br>

- Highests : 2002 (1.58B)
- Lowest : 2020 : (223.64M)

</br>

## Highest Gross films
</br>

### Genre :

</br>

- Majority of the films belongs to **Adventure** genre followed by **action** genre 
- Similar trend is for **average Revenue**, **Adventure** genre have highest highest revenue followed by **action**.

</br>

### Rating

</br>

- Majority of the films belongs to **PG-13(19)** rating 
- **PG** is second highest(5) reting that is much lower compared to **PG-13**
- **PG-13** generate highest revenue followed by **PG** and **G**, respectivly.

</br>

### DISTRIBUTOR

</br>

- Top distributor in terms of Number of fils is **walt disney** with **12** films, followed by **warner bros.** and **Sony Pictures** with 4 films each.
  
- However,In terms of total revenue, **20th century Fox , Dreamworks SKG and Paramount pictures** tops the table with **\$678** , **\$650** and **\$651** , respectivly.
  
- similar can be seen with Total tickets sold


## Popular creative types

- More than **50%** released films are **contemporary fiction** 
- Second biggest chunk(16.7%) is occupied by **Factual** movies
- **Supar hero** movies have the lowest release number.

- In terms of **Total Gross** Top 3 creative types are Contemporaty fiction, kids fiction and Science fiction 
- Eventhough **super hero** creative type have lowest release count it have the highest average revenue In terms of **Average Gross** followed by **Kids fictiom** and **science fiction**. 

- on the other hand, Factual movies have second highest release count but have the lowest revenue in terms of **Average Gross** as well as **Total Gross**

## Top Distributors

</br>

  - **Warner bros** have distributed most number of films with **17.1%** of market share Followed by **Sony Pictures** with **15.5%** market share
  
- other top distributor like **Walt Disney** , **Universal** ,  **20th century fox** and **Paramount Pictures** have market share between around **10%** to **12%**  

</br>

- **Walt Diseney** is 3rd largest distributor but it has the highest **Average gross** as well as **Total Gross**
- **Warner Bro.** and **Soney Pictures** are largest and second largest distributor but they ranks 6th and 7th in terms of **Average gross**, respectivly.

- **Dreamwork SKG** distributes least number of films but it ranks second in terms of **Average gross**



## Top Genres

 - People love watching drama as 35% of movies released are drama
- Other top genres are comedy and documentary with 15.6% share each.
- Black comedy and Musical have least number of releases.

</br>

- despite having low number of total releases, Adventure and Action are generating more in terms of both, total gross and average gross

- Eventhough, Documenry genre have high number of movies released, they have the second lowest in terms of gross and lowest in terms of average gross


## Top Grossing Ratings


- There is big chunck of 35% that is not being rated at all
- Most released films are **R** rated which account for **33%** followed by **PG-13** and **PG** with **19.6%** and **9.3%**

</br>

- Not Rate films have terible Total as well as average GROSS despite have so many films released
- Even though **R** rated films have high release count, it ranks 4 in terms of average revenue where top 3 spots are secured by **PG-13** , **PG** and **G**

</br>

- almost 95% of the fils are either PG-13, PG or R rated

## Top Grossing Sources

- Majorty of the films are Original screenplay
- Second and third larged source of Films are Real life events and Fiction boook / short story respectivly. 

</br>

- Original screenplay have highest total gross as it have highest number of released by it has 3rd lowest average revenue.
- on the other hand movies based on Novels have High total revenue and highst average revenue


## Top Production Methodsm

- mejority of the films are produced through Live action method
- Considerable amount of movies are produced through Animation/Live action, Digital animation and hand animation
- other types have negligable number of movies

</br>

- Live action have highest total gross as they have highest number of movies but they have bad average gross 
- animations seems to have good average gross dispite having low total gross


## WideReleasesCount

- Top 6 major studios were releasing more than 100 movies every year untill 2008 and after that the number of movies started to fall
  
</br>

- Initialy, Top 6 studios were producing low movies untill 2002 and after that they saw high groth untill 2008
after 2008 other studios have very big fluctions in number of releases
