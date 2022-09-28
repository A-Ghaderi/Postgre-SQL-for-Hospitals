with provider_encounter as (
	select
		ordering_provider_id,
		patient_encounter_id,
		count(order_procedure_id) as num_procedures
	from general_hospital.orders_procedures
	group by ordering_provider_id, patient_encounter_id
	),
	provider_orders as (
	select
		ordering_provider_id,
		avg(num_procedures) as avg_num_procedures
	from provider_encounter
	group by ordering_provider_id
	)
select
	p.full_name,
	o.avg_num_procedures
from general_hospital.physicians p
left outer join provider_orders o
	on p.id = o.ordering_provider_id
where o.avg_num_procedures is not null
order by o.avg_num_procedures desc;

	