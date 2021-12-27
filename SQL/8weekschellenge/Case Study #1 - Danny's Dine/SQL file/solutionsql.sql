/* --------------------
   Case Study Questions
   --------------------*/

use dannys_diner;
-- 1. What is the total amount each customer spent at the restaurant?
select customer_id , sum(price) "Total spent"
from 
	menu m inner join sales s 
		on 
        s.product_id = m.product_id 
group by s.customer_id ;

-- 2. How many days has each customer visited the restaurant?
select customer_id  , count(distinct order_date) "Unique visit #" 
from sales
group by customer_id; 



-- 3. What was the first item from the menu purchased by each customer? 

with temp_table
as (
select s.customer_id  , m.product_id , m.product_name , DENSE_RANK() OVER(PARTITION BY s.customer_id ORDER BY s.order_date) Purchase_rank
from sales s
		inner join 
	menu m
		on
	s.product_id = m.product_id
 ) select customer_id, product_name  from temp_table where Purchase_rank = 1 ;

select * from sales ;
-- 4. What is the most purchased item on the menu and how many times was it purchased by all customers?

select m.product_name, count(s.product_id) "# purchased"
from sales s
	inner join
    menu m 
    on 
    s	.product_id = m.product_id
group by s.product_id
order by count(product_id) desc limit 1 ;

-- 5. Which item was the most popular for each customer?

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


-- 6. Which item was purchased first by the customer after they became a member?
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


-- 7. Which item was purchased just before the customer became a member?
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

----
 
 ---

-- 8. What is the total items and amount spent for each member before they became a member?
 select s.customer_id,count(s.product_id) "Total items purchased", sum(m1.price) "Total amount spend" 
from 
	sales s inner join members m 
		on s.customer_id = m.customer_id 
	inner join menu m1
		on s.product_id = m1.product_id
where order_date < join_date
group by s.customer_id ;


-- 9.  If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
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
    
-- 10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?
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
