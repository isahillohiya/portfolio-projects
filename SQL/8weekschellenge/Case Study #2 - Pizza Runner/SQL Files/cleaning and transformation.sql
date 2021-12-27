SELECT * FROM pizza_runner.customer_orders;
use pizza_runner ;
-- cleaned table 1 --
CREATE  table customer_orders_temp AS
select 
	 order_id,
     customer_id,
    pizza_id , 
	CASE 
		when exclusions LIKE 'null' or exclusions LIKE '' then NULL
        else exclusions
        end as exclusions ,
	case 
		when extras LIKE 'null' or extras LIKE '' then NULL
        else extras
        end as extras
	,order_time
from customer_orders;


select distinct order_id , customer_id ,pizza_id , order_time from customer_orders ;

-- cleand table 2 --
create table runner_orders_temp as 
select order_id, runner_id , 
	case 
		when pickup_time like 'null' then NULL
        else pickup_time
	end as pickup_time,
 case 
	when distance regexp '.k' then regexp_replace(distance,'[^0-9.]','') 
    when distance like 'null' then null
    else distance
    end as distance,
 case 
	when duration regexp '.m' then regexp_replace(duration,'[^0-9]','') 
    when duration like 'null' then null
    else duration
    end as duration,
case 
	when cancellation LIKE 'null' or cancellation LIKE '' then NULL
	else cancellation
end as cancellation
from runner_orders; 
-- 

describe runner_orders_temp ; 
ALTER TABLE runner_orders_temp
modify pickup_time DATETIME ; 

ALTER TABLE runner_orders_temp
modify distance FLOAT ;

ALTER TABLE runner_orders_temp
modify duration INT ;