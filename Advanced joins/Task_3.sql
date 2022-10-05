SELECT
	count(distinct sc.surgery_id)
FROM general_hospital.surgical_costs sc
FULL JOIN general_hospital.surgical_encounters se USING (surgery_id)
WHERE 
	se.surgery_id IS NULL;
