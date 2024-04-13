use domino;
select * from pizza;
select day(order_date) from pizza;
-- TOTAL_REVENUE
Select sum(total_price) as TOTAL_REVENUE
FROM pizza;
-- AVG_ORDER_VALUE
select sum(total_price)/count(distinct(order_id)) as AVG_ORDER_VALUE
from pizza;
-- TOTAL_PIZZA_SOLD
select sum(quantity) as TOTAL_PIZZA_SOLD
from pizza;
-- TOTAL_ORDERS
select count(distinct(order_id)) as TOTAL_ORDERS
from pizza;
-- AVG_PIZZA_PER_ORDER
select sum(quantity)/count(distinct(order_id))
from pizza;
-- DAILY TRENDS FOR TOTAL ORDERS
SELECT dayname(order_date)as ORDER_DATE,count(distinct(order_id))as TOTAL_ORDERS
from pizza
group by dayname(order_date);
-- percentage of sales by pizza_category
select pizza_category,cast(sum(total_price)as decimal(10,2))as total_revenue,
cast(sum(total_price)*100 /(select sum(total_price) from pizza)as decimal(10,2)) as percentage
from pizza
group by pizza_category;
-- percentage of sales by pizza_size
select pizza_size,cast(sum(total_price)as decimal(10,2)) as total_revenue,
cast(sum(total_price)*100/(select sum(total_price) from pizza)as decimal(10,2)) as percentage
from pizza
group by pizza_size
order by pizza_size;
-- TOTAL_PIZZA_SOLD_OF_EACH_CATEGORY
select pizza_category,cast(sum(quantity)as decimal(10,2))as total_pizza_sold
from pizza
group by pizza_category;
-- top 5 pizza by revenue
select  distinct(pizza_name) ,cast(SUM(total_price)as decimal(10,2))as total_revenue
from pizza
group by pizza_name 
order by total_revenue desc
limit 5;
-- bottom 5 pizza by revenue
select  distinct(pizza_name) ,cast(SUM(total_price)as decimal(10,2))as total_revenue
from pizza
group by pizza_name 
order by total_revenue asc
limit 5;
-- top 5 pizza by quantity
select  pizza_name ,SUM(quantity)as total_quantity
from pizza
group by pizza_name
order by total_quantity desc
limit 5;
-- bottom 5 pizza by quantity
select  distinct(pizza_name) ,SUM(quantity)as total_quantity
from pizza
group by pizza_name
order by total_quantity asc
limit 5;
-- top 5 pizza by orders
select pizza_name,count(distinct(order_id))as total_orders
from pizza
group by pizza_name
order by total_orders desc
limit 5;
-- bottom 5 pizza by orders
select pizza_name,count(distinct(order_id))as total_orders
from pizza
group by pizza_name
order by total_orders asc
limit 5;



