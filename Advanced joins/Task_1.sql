SELECT
	p1.full_name as physician_name,
	p2.name as practice_name
FROM general_hospital.physicians p1
CROSS JOIN general_hospital.practices p2;