select distinct patient_encounter_id
from general_hospital.orders_procedures
where order_cd in (
	select order_cd
	from general_hospital.orders_procedures
	group by order_cd
	order by count(*) DESC
	limit 10
);