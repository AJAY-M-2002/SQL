use restaurant_db;
-- Displaying all the values.
select * from menu_items;
-- Find the number of items on the menu.
select count(*) from menu_items;
-- what are the least and most expensive items on the menu?
select * from menu_items
order by price;
select * from menu_items
order by price desc;
-- How many Italian dishes are on the menu?
select count(*) from menu_items
where category='Italian';
-- What are the least and most expensive Italian dishes on the menu/
select*
from menu_items
where category='Italian'
order by price;
select*
from menu_items
where category='Italian'
order by price desc;
-- How many dishes are in each category?
select category,count(menu_item_id) as num_dishes
from menu_items
 group by category;
-- What is the average dish price within each category?
select category,avg(price) as avg_price
from menu_items
 group by category;
-- view the order_details table.
select * from order_details;
-- what is the date range of the table?
Select min(order_date), max(order_date) from order_details; 
--  How many orders were made  within this data range?
select count(distinct order_id) from order_details;
-- How many items were ordered within this data range?
select count(*) from order_details;
-- which order had the most number of items?
select order_id, count(item_id) as num_items
 from order_details group by order_id
 order by num_items desc;
-- how many orders had more than 12 items?
select count(*) from
(select order_id, count(item_id) as num_items
 from order_details group by order_id
 Having num_items > 12 )as num_orders;  
 -- Combine the menu_items and order_details tables into a sigle table.
select * from menu_items;
select * from order_details;
select * 
from order_details od left join menu_items mi
 on od.item_id = mi.menu_item_id;
-- what were the least and most ordered items? what categories were they in?
 select item_name, category, count(order_details_id) as num_purchase
from order_details od left join menu_items mi
 on od.item_id = mi.menu_item_id
 group by item_name,category
 order by num_purchase Desc;
--  what are the top 5 orders that spend the most money
  select order_id, sum(price) as total_spend
from order_details od left join menu_items mi
 on od.item_id = mi.menu_item_id
 group by order_id
 order by total_spend Desc
 limit 5;
-- View the details of the highest spend order. what insights can gather from the 
 select category, count(item_id) as num_items
from order_details od left join menu_items mi
 on od.item_id = mi.menu_item_id
where order_id = 440
group by category;
--  View the details of the top 5 highest spend order. what insights can you gather from 
 select category, order_id, count(item_id) as num_items
from order_details od left join menu_items mi
 on od.item_id = mi.menu_item_id
where order_id in (440, 2075, 1957, 330, 2675)
group by category, order_id;