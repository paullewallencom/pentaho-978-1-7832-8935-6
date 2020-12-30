select st.store_country, pc.product_family,pc.product_category,  
CONCAT(t.the_year, ' - ', t.quarter) as period, SUM(sf.unit_sales) as unit_sales, 
SUM(sf.store_sales) as store_sales, SUM(sf.store_cost) as store_cost from sales_fact_1998 sf
inner join product p on sf.product_id = p.product_id
inner join product_class pc on p.product_class_id = pc.product_class_id
inner join time_by_day t on sf.time_id = t.time_id
inner join customer c on sf.customer_id = c.customer_id
inner join promotion pr on sf.promotion_id = pr.promotion_id
inner join store st on sf.store_id = st.store_id
group by st.store_country, pc.product_family, pc.product_category, 
t.the_year, t.quarter, st.store_country