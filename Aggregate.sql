SELECT * FROM 
patient a
LEFT JOIN route b
ON a.patient_id = b.patient_id