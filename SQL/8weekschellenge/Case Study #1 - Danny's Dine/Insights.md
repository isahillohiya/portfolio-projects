# 🍜 Case Study #1: Danny's Diner

## Solution

View the complete syntax [here](#).

***


### 1. What is the total amount each customer spent at the restaurant?
<br/>

#### Approach
- Merge ```Menu``` and ```sales``` tables to access **product_id** and **price** at same time 
- group by **customer_id** and use SUM() with **price** to get total money spend by each customer


```` sql
select customer_id , sum(price) "Total spent"
from 
	menu m 
        inner join 
    sales s 
		on 
    s.product_id = m.product_id 
group by s.customer_id ;
````


#### Output:
| customer_id | Total spent |
| ----------- | ----------- |
| A           | 76          |
| B           | 74          |
| C           | 36          |

#### Insight 
- Customer A spent total $76 
- Customer b spent total $74
- Customer c spent total $36


</br>


### 2. How many days has each customer visited the restaurant?

#### Approach 
- group by **customer_id** in table ```sales``` and count unique visits of each customer through **Order_date** column 
  
  

````sql
select customer_id  , count(distinct order_date) "Unique visit #" 
from sales
group by customer_id; 
````

  
#### Output:
| customer_id | Unique visit #  |
| ----------- | ----------- 	|
| A           | 4          		|
| B           | 6          		|
| C           | 2          		|

#### Insights 
- Customer A visited 4 times.
- Customer B visited 6 times.
- Customer C visited 2 times.

</br>


### 3. What was the first item from the menu purchased by each customer?
</br>

#### Approach
- create new column named **Purchase_rank** that ranks **customer_id** based on **order_date** 
- select data where **Purchase_rank** is 1 to get first item purchased by each customer
  
  </br>

````sql
with temp_table
as (
select s.customer_id  , m.product_id , m.product_name , DENSE_RANK() OVER(PARTITION BY s.customer_id ORDER BY s.order_date) Purchase_rank
from sales s
		inner join 
	menu m
		on
	s.product_id = m.product_id
 ) select customer_id, product_name  from temp_table where Purchase_rank = 1 ;
````
</br>
 
#### Output :
| customer_id | product_name | 
| ----------- | ----------- |
| A           | curry        | 
| A           | sushi        | 
| B           | curry        | 
| C           | ramen        |
| C           | ramen        |


#### Insight 

- First ordered Item of **A** were curry and sushi.
- First ordered Item of **B** was curry.
- First ordered Item of **C** was ramen and it was ordered twise in a day.

</br> 

### 4. What is the most purchased item on the menu and how many times was it purchased by all customers?
</br>

#### Approach 

- Join ```menu``` and ```sales``` via **product_id** to access  **product_id** and **product_name** in same table 
- group by **product_id** and count **product_id** to get number of each product is bought. 
- order them in desending order and limit rows to 1 to get the product that is boutght maximumn times.
 
 </br>


````sql
select m.product_name, count(s.product_id) "# purchased"
from sales s
	inner join
    menu m 
    on 
    s.product_id = m.product_id
group by s.product_id
order by count(product_id) desc limit 1 ;

````

</br>

  
#### Output 
| product_name   | # purchased  | 
| ----------- 	 | ----------- 	|
|  ramen      	 |  	8	    |

#### Insights 
- **Ramen** is most purchased product with purchased count of **8**


</br>

### 5. Which item was the most popular for each customer?

</br>

#### Approach
- Join ```menu``` and ```sales``` via **product_id** to access  **product_id** and **product_name** in same table 
- group **customer_id** and **product_name** 
- create new column named **product_rank** that ranks **customer_id** based on **customer_id** as we have grouped **customer_id** and **product_name**
- select data where **product_rank** is 1 to get most popular item ordered by each customer


</br>

```` sql
select customer_id,product_name
from  (select s.customer_id ,m.product_name, DENSE_RANK() OVER(PARTITION BY s.customer_id ORDER BY COUNT(s.customer_id) DESC) product_rank
	   from sales s
				inner join 
			menu m
				on 
			s.product_id = m.product_id
		group by s.customer_id,m.product_name
            ) as tbl 
where product_rank = 1 ;
````

#### Output : 


| customer_id    | product_name  	| 
| ----------- 	 | ----------- 		|
|  A      	 	 |  	ramen	    |
|  B      	 	 |  	curry	    |
|  B      	 	 |  	sushi	    |
|  B      	 	 |  	ramen	    |
|  C      		 |  	ramen	    |


#### Insights

</br>

- **Ramen** is most popular item for customer **A** 
- **curry**, **sushi**  and - **Ramen** are most popular items for customer **B** 
- **Ramen** is most popular item for customer **C** 

</br>

###  6.  Which item was purchased first by the customer after they became a member?

</br>

#### Approach


- Join ```Sales``` , ```member``` and ``` menu ``` so that we can access reqired columns such as **product_name** , **customer_id** and **join_date**
-  fillter the orders which have **order_date** same or after **join_date** of customers
-  create new column named **given_rank** that ranks **customer_id** based on **order_date** 
-  To get first order of each customer, select data that have **given_rank** equal to 1  


</br>

````sql
with itm_purchased_cte
as(
select s.customer_id ,product_name, dense_rank() over (partition by customer_id order by order_date) given_rank
from 
	sales s 
		inner join 
    members me
		on 
	s.customer_id = me.customer_id 
		inner join 
	menu m 
		on 
    s.product_id = m.product_id
where order_date >= join_date  )
select customer_id,product_name 
from itm_purchased_cte 
where given_rank = 1 ;

````

#### Output :

</br>

| customer_id |  product_name |
| ----------- | ------------  |
| A           |  curry        |
| B           |  sushi        |

</br>

#### Insights

</br>

- Customer **A** has ordered **curry** after they became member 
- Customer **B** has ordered **sushi** after they became member 



</br>

### 7. Which item was purchased just before the customer became a member?

</br>

#### Approach


- Join ```Sales``` , ```member``` and ``` menu ``` so that we can access reqired columns such as **product_name** , **customer_id** and **join_date**
-  fillter the orders which have **order_date**  before **join_date** of customers
-  create new column named **given_rank** that ranks **customer_id** based on **order_date** in descending order  
-  To get first order of each customer before becomeing member, select data that have **given_rank** equal to 1  

</br>

````sql
with itm_purchased_cte
as(
select s.customer_id ,product_name, dense_rank() over (partition by customer_id order by order_date desc) given_rank
from 
	sales s 
		inner join 
    members me
		on 
	s.customer_id = me.customer_id 
		inner join 
	menu m 
		on 
    s.product_id = m.product_id
where order_date < join_date  )
select customer_id,product_name 
from itm_purchased_cte 
where given_rank = 1 ;
````

#### Output :

| customer_id |  product_name |
| ----------- | ------------  |
| A           |  sushi        |
| A           |  curry        |
| B           |  sushi        |


#### Insights

- Last order of Customer **A** before becoming member was **Sushi** and **curry**

- Last order of Customer **B** before becoming member was **Sushi** 


</br>

###	8. What is the total items and amount spent for each member before they became a member?

</br>

#### Approach

-  Join ```Sales``` , ```member``` and ``` menu ``` so that we can access reqired columns such as **product_name**  **price** and **join_date** in single query 
-  fillter the orders which have **order_date**  before **join_date** of customers
-  group by **customer_id** and count **product_id** and sum the **price** 


````sql 
select s.customer_id,count(s.product_id) "Total items purchased", sum(m1.price) "Total amount spend" 
from 
	sales s 
		inner join 
	members m 
		on 
	s.customer_id = m.customer_id 
		inner join 
	menu m1
		on 
	s.product_id = m1.product_id
where order_date < join_date
group by s.customer_id ;
````

#### Output :

</br>

| customer_id | Total items purchased |  Total amount spend |
| ----------- | ---------- 		 	  |  ----------  		|
| B           | 3				      |  40       			|
| A           | 2 				      |  25			       	|

</br>

#### Insights

- Customer **A** bought total 2 items and spent **$25** 
- Customer **B** bought total 3 items and spent **$40** 


</br>

### 9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?

#### Approach
- Join ```menu``` and ```sales``` via **product_id** to access columns like  **product_id** and **price** in same table  
- group by **customer_id** 
- create new column named **Points** that computes the points based on given condition in the question.

</br>



````sql
select s.customer_id, 
		sum(case	
			when m.product_id = 1 then m.price * 20
            else m.price * 10
		end ) "Points" 
from sales s 
		inner join 
	menu m 
			on 
	s.product_id = m.product_id 
group by s.customer_id; 
    
````

</br>

| customer_id | Points | 
| ----------- | -------|
| A           | 860    |
| B           | 940    |
| C           | 360    |

</br>

#### Insights

- Total points for Customer A is 860.
- Total points for Customer B is 940.
- Total points for Customer C is 360.

</br>

###  10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi — how many points do customer A and B have at the end of January?

#### Approach

 - Join ```menu``` ```member``` and ```sales``` via **product_id** and **customer_id** to access columns like  **product_id** , **join_date** , **price** in same table  
- group by **customer_id** 
- create new column named **Points** that computes the points based on given condition in the question.
  

````sql
 select 
	s.customer_id,
    sum(case 
			when m.product_id = 1 then m.price * 20
            when s.order_date between m1.join_date and date_add(m1.join_date,interval 6 day) then m.price * 20
			else m.price *10						
		end) "Points" 
from 
	sales s 
		inner join 
	menu m 
		on 
	s.product_id = m.product_id 
		inner join 
	members m1
		on
	m1.customer_id = s.customer_id
where 
	s.order_date <= '2021-01-31'
group by customer_id;
````

#### Output :

</br>

| customer_id | Points		 | 
| ----------- | ----------   |
| B           | 820 		 |
| A           | 1370 		 |

</br>

#### Insights

- Total points for Customer A is 1,370.
- Total points for Customer B is 820.

