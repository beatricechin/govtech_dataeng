-- question 1 
select c.customer_id, sum(c2.price) from public.customer c 
inner join public.transaction_table tt 
on c.customer_id = tt.customer_id  
left join public.car c2 
on c2.car_id = tt.car_id 
group by c.customer_id 
order by customer_id 

-- question 2 
with cars_sold as (
	select * from transaction_table tt 
	inner join customer c 
	on c.customer_id = tt.customer_id 
),
-- map car with the manufacturer
manufacturer_car as (
	select * from car c 
	inner join manufacturer m 
	on c.manufacturer_id = m.manufacturer_id 
)

select m.manufacturer_name, count(c.transaction_id) as sales_number
from cars_sold c 
left join manufacturer_car m 
on c.car_id = m.car_id 
where c.sold_dt >= date_trunc('month', CURRENT_DATE)
group by m.manufacturer_name 
order by sales_number desc
limit 3