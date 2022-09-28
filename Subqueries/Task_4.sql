with old_los as (
	SELECT
		extract(year from age(now(), p.date_of_birth)) as age,
		avg(s.surgical_discharge_date - s.surgical_admission_date) as avg_los
	from general_hospital.patients p
	inner join general_hospital.surgical_encounters s
		on p.master_patient_id = s.master_patient_id
	where
		p.date_of_birth is not null
		and extract(year from age(now(), p.date_of_birth)) >= 65
	group by extract(year from age(now(), p.date_of_birth))
	)
select e.*
from general_hospital.encounters e
inner join general_hospital.patients p
	on e.master_patient_id = p.master_patient_id
	and p.date_of_birth >= '1995-01-01'
where
	extract(day from(e.patient_discharge_datetime - e.patient_admission_datetime)) >= all(
	select avg_los
	from old_los
	);
