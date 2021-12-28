-- Runner and customer Experience 

-- 1. How many runners signed up for each 1 week period? (i.e. week starts 2021-01-01)
with runner_cte
as (
SELECT
runner_id ,DATE_FORMAT(DATE_ADD(registration_date, INTERVAL (YEAR('2017-01-01') - YEAR(registration_date)) year), '%Y-%m-%d') registration_date
from runners) -- As week() function starts counting week from first sunday of year and not first day of year we convert every year to the year where Sunday comes on 1st day of year
select week(registration_date) 'week of the year', count(runner_id) 'number of registration'
from runner_cte 
group by week(registration_date) ;

-- 2. What was the average time in minutes it took for each runner to arrive at the Pizza Runner HQ to pickup the order?
select  avg(minute(timediff(pickup_time,order_time))) "Average time"
from customer_orders_temp c 
		join 
	runner_orders_temp r 
		on 
	c.order_id = r.order_id;


-- 3. Is there any relationship between the number of pizzas and how long the order takes to prepare?

with temp as(
select  c.order_id,count(c.pizza_id) over (partition by order_id) Number_of_pizza, minute(timediff(pickup_time,order_time)) Prepare_time
from customer_orders_temp c 
		inner join 
	runner_orders_temp r 
		on
	c.order_id = r.order_id )
    select Number_of_pizza,avg(Prepare_time) "Average time" from temp group by Number_of_pizza ; 
; 

-- 4. What was the average distance travelled for each customer?

with temp_tbl1
as
(
select distinct c.order_id , c.customer_id, distance 
from 	customer_orders_temp c 
			left join 
		runner_orders_temp r 
			on 
		c.order_id = r.order_id
)
select distinct customer_id , avg(distance) over (partition by customer_id) 'Avg distanced travelled for customer' 
from temp_tbl1;


-- 5. What was the difference between the longest and shortest delivery times for all orders?

select max(duration) - min(duration) 'Time difference' 
from runner_orders_temp ;

-- 6. What was the average speed for each runner for each delivery and do you notice any trend for these values?

select order_id,runner_id,distance , duration,round((distance*60 / duration),2)  " AVG speed"
from runner_orders_temp 
where cancellation is null order by runner_id;

-- 7. What is the successful delivery percentage for each runner?
select runner_id, round(100- ((count(cancellation) * 100) / count(order_id)),2)  as 'successful delivery rate '
from runner_orders_temp 
group by runner_id;


