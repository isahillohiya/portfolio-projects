# 🍕 Case Study #2 - Pizza Runner

## 🍝 Solution - A. Pizza Metrics

### 1. How many pizzas were ordered?

````sql
select count(order_id) as 'total orders' 
from customer_orders ;

````

**Output:**




- Total of 14 pizzas were ordered.

### 2. How many unique customer orders were made?

````sql
select count(distinct customer_id) as 'Unique customers'
from customer_orders ;
````

**Output:**


- There are 10 unique customer orders.

### 3. How many successful orders were delivered by each runner?

````sql

select runner_id, count(order_id) '# of successful deliveries'
from runner_orders_temp 
where cancellation is NULL 
group by runner_id;
````

**Output:**

- Runner 1 has 4 successful delivered orders.
- Runner 2 has 3 successful delivered orders.
- Runner 3 has 1 successful delivered order.

### 4. How many of each type of pizza was delivered?

````sql
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
````

**Output:**


- There are 9 delivered Meatlovers pizzas and 3 Vegetarian pizzas.

### 5. How many Vegetarian and Meatlovers were ordered by each customer?**

````sql
SELECT 
  c.customer_id, 
  p.pizza_name, 
  COUNT(p.pizza_name) AS order_count
FROM #customer_orders AS c
JOIN pizza_names AS p
  ON c.pizza_id= p.pizza_id
GROUP BY c.customer_id, p.pizza_name
ORDER BY c.customer_id;
````

**Output:**



- Customer 101 ordered 2 Meatlovers pizzas and 1 Vegetarian pizza.
- Customer 102 ordered 2 Meatlovers pizzas and 1 Vegetarian pizzas.
- Customer 103 ordered 3 Meatlovers pizzas and 1 Vegetarian pizza.
- Customer 104 ordered 3 Meatlovers pizza.
- Customer 105 ordered 1 Vegetarian pizza.

### 6. What was the maximum number of pizzas delivered in a single order?

````sql

select order_id, count(pizza_id) over (partition by order_id) Max_Number_of_pizza
from customer_orders_temp
where order_id in (
					select order_id 
                    from runner_orders_temp 
                    where cancellation is null
                    )  -- returns order_id which are not cancelled 
order by Max_Number_of_pizza desc 
limit 1;

````

**Output:**



- Maximum number of pizza delivered in a single order is 3 pizzas.

### 7. For each customer, how many delivered pizzas had at least 1 change and how many had no changes?

````sql
SELECT 
  c.customer_id,
  SUM(
    CASE WHEN c.exclusions <> ' ' OR c.extras <> ' ' THEN 1
    ELSE 0
    END) AS at_least_1_change,
  SUM(
    CASE WHEN c.exclusions = ' ' AND c.extras = ' ' THEN 1 
    ELSE 0
    END) AS no_change
FROM customer_orders_temp c
JOIN runner_orders_temp r
  ON c.order_id = r.order_id
WHERE r.distance != 0
GROUP BY c.customer_id
ORDER BY c.customer_id;
````

**Output:**


- Customer 101 and 102 does not want any changes for their pizza
- Customer 103, 104 and 105 prefer  to make changes in their pizza

### 8. How many pizzas were delivered that had both exclusions and extras?

````sql
select count(pizza_id) "count" from customer_orders_temp 
where  order_id in (
			select order_id 
            from runner_orders_temp 
            where cancellation is null
            ) and exclusions is not null and extras is not null  ;
````

**Output:**



- Only 1 pizza delivered that had both extra and exclusion topping.

### 9. What was the total volume of pizzas ordered for each hour of the day?

````sql
select hour(order_time), count(pizza_id) 
from customer_orders_temp 
group by hour(order_time) 
order by hour(order_time);
````

**Output:**



- Highest volume of pizza ordered is at 13 (1:00 pm), 18 (6:00 pm) , 21 (9:00 pm) and and 23 (11:00 pm) .
- Lowest volume of pizza ordered is at 11 (11:00 am), 19 (7:00 pm).
- during rest of the hours there were no orders.

### 10. What was the volume of orders for each day of the week?

````sql
select DAYOFWEEK(order_time),count(pizza_id)  
from customer_orders_temp 
group by DAYOFWEEK(order_time)
order by DAYOFWEEK(order_time);
````

**Output:**




- There are 5 pizzas ordered on Wednesday and Saturday.
- There are 3 pizzas ordered on Thursday.
- There is 1 pizza ordered on Friday.


