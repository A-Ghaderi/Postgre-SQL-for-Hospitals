SELECT
	p.full_name as provider,
	avg(v.bp_systolic) as avg_systolic,
	avg(v.bp_diastolic) as avg_diastolic
FROM general_hospital.vitals v
JOIN general_hospital.encounters e USING (patient_encounter_id)
LEFT OUTER JOIN general_hospital.physicians p
	on e.admitting_provider_id = p.id
GROUP BY p.full_name;