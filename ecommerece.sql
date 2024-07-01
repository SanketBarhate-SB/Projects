create database E_commerce;
use E_commerce;

#---------------KPI 1---------------#
create table kpi_1
select orders.order_id,orders.order_purchase_timestamp,payment.payment_value,payment.payment_type
from olist_orders_dataset as orders
left join olist_order_payments_dataset as payment
on orders.order_id = payment.order_id;
select * from kpi_1;
select dayname(order_purchase_timestamp) from Olist_orders_dataset;
select 
if (dayname(order_purchase_timestamp) in("sunday","saturday"), "weekend","weekday") as day_type,
round(sum(payment_value),2) as Total_payment from kpi_1
group by day_type;

#--------------KPI 2--------------#

select review_score,payment_type,count(olist_order_reviews_dataset.order_id) as total_score
from olist_order_reviews_dataset 
join olist_order_payments_dataset
on olist_order_reviews_dataset.order_id = olist_order_payments_dataset.order_id
where review_score= 5 and payment_type = "credit_card"
group by review_score,payment_type;

#----------KPI 3-----------#

select avg(datediff(order_delivered_carrier_date,order_purchase_timestamp)) as delivery,product_category_name
from olist_orders_dataset
join olist_order_items_dataset  on
olist_orders_dataset.order_id = olist_order_items_dataset.order_id
join olist_products_dataset on
olist_products_dataset.product_id = olist_order_items_dataset.product_id
WHERE olist_products_dataset.product_category_name = 'Pet_shop'
group by product_category_name;

#----------KPI 4-----------#

select avg(oi.price) as average_price,avg(op.payment_value) as average_payment_value
from olist_order_items_dataset oi
join olist_order_payments_dataset op on oi.order_id = op.order_id
join olist_sellers_dataset os on oi.seller_id = os.seller_id
where os.seller_city = 'Sao Paulo';
    
#----------KPI 5-----------#

select round(avg(datediff(order_delivered_carrier_date,order_purchase_timestamp)),0) as delivery,review_score
from olist_orders_dataset
join olist_order_reviews_dataset on
olist_orders_dataset.order_id = olist_order_reviews_dataset.order_id
group by review_score;

select count(order_id) as orders , order_status,customer_city
from olist_orders_dataset
join olist_customers_dataset on
olist_orders_dataset.customer_id = olist_customers_dataset.customer_id
where order_status="shipped"
group by order_status,customer_city;


select count(olist_products_dataset.product_id) as product, product_category_name
from olist_products_dataset
join olist_order_iteams_dataset on
olist_order_iteams_dataset.product_id = olist_products_dataset.product_id
where product_category_name="cool_stuff"








    
    

