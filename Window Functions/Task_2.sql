with provider_departments as (
	select
		admitting_provider_id,
		department_id,
		count(*) as num_encounters
	from general_hospital.encounters	
	group by admitting_provider_id, department_id
	),
	pd_ranked as (
	select
		*,
		row_number() over
			(partition by department_id order by num_encounters desc) as encounter_rank
	from provider_departments
	)
SELECT
	d.department_name,
	p.full_name as physician_name,
	encounter_rank
from pd_ranked pd
left outer join general_hospital.physicians p
	on p.id = pd.admitting_provider_id
left outer join general_hospital.departments d
	on d.department_id = pd.department_id
where encounter_rank <= 3;