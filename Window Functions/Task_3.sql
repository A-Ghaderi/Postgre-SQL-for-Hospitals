with total_cost as (
	select
		surgery_id,
		resource_name,
		resource_cost,
		sum(resource_cost) over
			(partition by surgery_id) as total_surgery_cost
	from general_hospital.surgical_costs
)
SELECT
	*,
	(resource_cost / total_surgery_cost) * 100 as pct_total_cost
FROM total_cost
where (resource_cost / total_surgery_cost) * 100 > 50;