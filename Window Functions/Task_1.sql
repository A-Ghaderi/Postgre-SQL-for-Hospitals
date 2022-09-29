with surgeries_lagged as (
	SELECT
		surgery_id,
		master_patient_id,
		surgical_admission_date,
		surgical_discharge_date,
		lag(surgical_discharge_date) OVER
			(partition by master_patient_id order by surgical_admission_date) as previous_discharge_date
	FROM general_hospital.surgical_encounters
)
SELECT 
	*,
	(surgical_admission_date - previous_discharge_date) as days_between_surgeries
FROM surgeries_lagged
where (surgical_admission_date - previous_discharge_date) <= 30;