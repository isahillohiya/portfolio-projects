# 🍕 Case Study #2 Pizza Runner

## Solution - B. Runner and Customer Experience

### 1. How many runners signed up for each 1 week period? (i.e. week starts 2021-01-01)

````sql
with runner_cte
as (
SELECT
runner_id ,DATE_FORMAT(DATE_ADD(registration_date, INTERVAL (YEAR('2017-01-01') - YEAR(registration_date)) year), '%Y-%m-%d') registration_date
from runners) -- As week() function starts counting week from first sunday of year and not first day of year we convert every year to the year where Sunday comes on 1st day of year
select week(registration_date) 'week of the year', count(runner_id) 'number of registration'
from runner_cte 
group by week(registration_date) ;
````

**Output:**

</br>


![image](https://user-images.githubusercontent.com/40135948/147536731-c34de6d6-0bb0-460d-bd3a-8f404cb7ad2b.png)


**Insight:**


- On Week 1 of Jan 2021, 2 new runners signed up.
- On Week 2 and 3 of Jan 2021, 1 new runner signed up.

### 2. What was the average time in minutes it took for each runner to arrive at the Pizza Runner HQ to pickup the order?

````sql
select  avg(minute(timediff(pickup_time,order_time))) "Average time"
from customer_orders_temp c 
		join 
	runner_orders_temp r 
		on 
	c.order_id = r.order_id;
````

**Output:**

</br>


![image](https://user-images.githubusercontent.com/40135948/147536848-7a9431a7-75a8-418e-9ecc-ce514d4bcd99.png)

**Insight:**


- The average time taken in minutes by runners to arrive at Pizza Runner HQ to pick up the order is 18.25 minutes.

### 3. Is there any relationship between the number of pizzas and how long the order takes to prepare?

````sql
with temp as(
select  c.order_id,count(c.pizza_id) over (partition by order_id) Number_of_pizza, minute(timediff(pickup_time,order_time)) Prepare_time
from customer_orders_temp c 
		inner join 
	runner_orders_temp r 
		on
	c.order_id = r.order_id )
    select Number_of_pizza,avg(Prepare_time) "Average time" from temp group by Number_of_pizza ; 
; 
````

**Output:**

</br>


![image](https://user-images.githubusercontent.com/40135948/147536893-da3dbfb0-c926-43d2-bf76-a7e5d4ec844b.png)

**Insight:**

- On average, a single pizza order takes 12 minutes to prepare.
- An order with 3 pizzas takes 29 minutes at an average of around 10 minutes per pizza.
- It takes 19 minutes to prepare an order with 2 pizzas which is 9 minutes per pizza — making 2 pizzas in a single order the ultimate efficiency rate.

### 4. What was the average distance travelled for each customer?

````sql
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
````

**Output:**

</br>

![image](https://user-images.githubusercontent.com/40135948/147536924-33398a81-b560-41d4-9aac-3e12d9a0e609.png)


**Insight:**

_(Assuming that distance is calculated from Pizza Runner HQ to customer’s place)_

- Customer 104 stays the nearest to Pizza Runner HQ at average distance of 10km, whereas Customer 105 stays the furthest at 25km.

### 5. What was the difference between the longest and shortest delivery times for all orders?



```sql
select max(duration) - min(duration) 'Time difference' 
from runner_orders_temp ;
```

**Output:**

</br>


![image](https://user-images.githubusercontent.com/40135948/147536941-3d7edd14-9cac-4ba9-a26b-a2acc18592e0.png)

**Insight:**


- The difference between longest  and shortest delivery time for all orders is 30 minutes.

### 6. What was the average speed for each runner for each delivery and do you notice any trend for these values?

````sql
select order_id,runner_id,distance , duration,round((distance*60 / duration),2) " AVG speed"
from runner_orders_temp 
where cancellation is null order by runner_id;
````

**Output:**

</br>


![image](https://user-images.githubusercontent.com/40135948/147537195-b67f251d-3b04-4961-8bd3-06251c2dc520.png)

**Insight:**

_(Average speed = Distance in km / Duration in hour)_
- Runner 1’s average speed runs from 37.5km/h to 60km/h.
- Runner 2’s average speed runs from 35.1km/h to 93.6km/h. Danny should investigate Runner 2 as the average speed has a 300% fluctuation rate!
- Runner 3’s average speed is 40km/h

### 7. What is the successful delivery percentage for each runner?

````sql
select runner_id, round(100- ((count(cancellation) * 100) / count(order_id)),2)  as 'successful delivery rate '
from runner_orders_temp 
group by runner_id;
````

**Output:**

</br>


![image](https://user-images.githubusercontent.com/40135948/147536979-1127c8f8-e3e7-45aa-a9c4-9e4674221c52.png)

**Insight:**

- Runner 1 has 100% successful delivery.
- Runner 2 has 75% successful delivery.
- Runner 3 has 50% successful delivery



***
