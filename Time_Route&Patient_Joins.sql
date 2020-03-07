--confirmed date count--
SELECT confirmed_date,	acc_confirmed AS "Total_Confirmed",	new_confirmed AS "Count_of_Confirmed",	patient_id,	sex,	birth_year,	country,	region,	infection_reason,	infection_order,	infected_by,	contact_number,	confirmed_date,	state,	province,	city,	visit,	latitude,	longitude
 FROM route_patient A

LEFT JOIN (Select date,acc_confirmed,new_confirmed FROM time) B

ON A.confirmed_date = B.date

WHERE confirmed_date is not null

ORDER BY confirmed_date;

--released date count--
SELECT released_date,	acc_released AS "Total_Released",	new_released AS "Count_of_Released",	patient_id,	sex,	birth_year,	country,	region,	infection_reason,	infection_order,	infected_by,	contact_number,	confirmed_date,	state,	province,	city,	visit,	latitude,	longitude
 FROM route_patient A

LEFT JOIN (Select date,acc_released,new_released FROM time) B
ON A.released_date = B.date

WHERE released_date is not null

ORDER BY released_date;

--deceased date count--
SELECT deceased_date,	acc_deceased AS "Total_Deceased",	new_deceased AS "Count_of_Deceased",	patient_id,	sex,	birth_year,	country,	region,	infection_reason,	infection_order,	infected_by,	contact_number,	confirmed_date,	state,	province,	city,	visit,	latitude,	longitude
 FROM route_patient A

LEFT JOIN (Select date,acc_deceased,new_deceased FROM time) B
ON A.deceased_date = B.date

WHERE deceased_date is not null

ORDER BY deceased_date;

