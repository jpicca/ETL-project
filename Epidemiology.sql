CREATE TABLE Epidemiology_Summary (
Patients_deceased int,
Average_number_of_people_contacted int,
Number_of_patients_released int,
Number_of_patients_isolated int);

DROP TABLE Epidemiology_Summary;
INSERT INTO Epidemiology_Summary (Patients_deceased)
SELECT COUNT(state) 
FROM patient WHERE state = 'deceased';

INSERT INTO Epidemiology_Summary (Average_number_of_people_contacted)
SELECT round(AVG(contact_number),0)
FROM patient;

INSERT INTO Epidemiology_Summary (Number_of_patients_released)
SELECT COUNT(state)
FROM patient WHERE state = 'released';

INSERT INTO Epidemiology_Summary (Number_of_patients_isolated)
SELECT COUNT(state)
FROM patient WHERE state = 'isolated';

SELECT * FROM Epidemiology_Summary;











