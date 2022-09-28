select a.account_id, a.total_account_balance
from general_hospital.accounts a
where 
	total_account_balance > 10000
	and exists(
		select 1
		from general_hospital.encounters e
		where e.hospital_account_id = a.account_id
		and patient_in_icu_flag = 'Yes'
	
	);
