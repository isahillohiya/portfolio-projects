use pizza_runner;
-- Pizza Metric -- 

-- 1. How many pizzas were ordered?
select count(order_id) as 'total orders' 
from customer_orders ;

-- 2. How many unique customer orders were made?

select count(distinct order_id) as 'Unique customers'
from customer_orders ;

-- 3. How many successful orders were delivered by each runner?

select runner_id, count(order_id) '# of successful deliveries'
from runner_orders_temp 
where cancellation is NULL group by runner_id;
 
 -- 4. How many of each type of pizza was delivered?
 
 -- Using partition by
 select pizza_id,count(pizza_id) over (partition by pizza_id) 
from customer_orders_temp where order_id in (
					select order_id 
                    from runner_orders_temp 
                    where cancellation is null
                    )  -- returns order_id which are not cancelled 
;

-- using case 
select sum(
		case 
        when pizza_id = 1 then 1
        end
	) as 'Type 1'
,  sum(
		case 
        when pizza_id = 2 then 1
        end
	)  'Type 2' 
from customer_orders_temp  
where order_id in (
					select order_id 
                    from runner_orders_temp 
                    where cancellation is null
                    ) ; -- returns order_id which are not cancelled 



-- 5. How many Vegetarian and Meatlovers were ordered by each customer?

select distinct customer_id, sum(
		case 
        when pizza_id = 1 then 1
        end
	) over (partition by customer_id) as 'Meatlovers' 
,  sum(
		case 
        when pizza_id = 2 then 1
        end
	)  over (partition by customer_id) 'Vegetarian' 
from customer_orders_temp ;

-- 6. What was the maximum number of pizzas delivered in a single order?

select order_id, count(pizza_id) over (partition by order_id) Max_Number_of_pizza
from customer_orders_temp
where order_id in (
					select order_id 
                    from runner_orders_temp 
                    where cancellation is null
                    )  -- returns order_id which are not cancelled 
order by Max_Number_of_pizza desc 
limit 1;


-- 7. For each customer, how many delivered pizzas had at least 1 change and how many had no changes?
SELECT 
  customer_id,
  SUM(
    CASE WHEN exclusions is not NULL OR extras is not NULL THEN 1
    ELSE 0
    END) AS at_least_1_change,
  SUM(
    CASE WHEN exclusions is NULL AND extras is NULL THEN 1 
    ELSE 0
    END) AS no_change
FROM customer_orders_temp 
WHERE order_id in (
					select order_id 
                    from runner_orders_temp 
                    where cancellation is null
                    )  -- returns order_id which are not cancelled 
GROUP BY customer_id
ORDER BY customer_id;

-- 8. How many pizzas were delivered that had both exclusions and extras?
select count(pizza_id) "delivery count" from customer_orders_temp 
where order_id in (
					select order_id 
                    from runner_orders_temp 
                    where cancellation is null
                    )  and exclusions is not null and extras is not null  ;


-- 9. What was the total volume of pizzas ordered for each hour of the day?
select hour(order_time), count(pizza_id) 
from customer_orders_temp 
group by hour(order_time) 
order by hour(order_time);



-- What was the volume of orders for each day of the week? 
-- 1 : sunday and 7 : saturday
	select DAYOFWEEK(order_time),count(pizza_id)  
	from customer_orders_temp 
	group by DAYOFWEEK(order_time)
	order by DAYOFWEEK(order_time);
