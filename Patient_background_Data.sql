--creates table
CREATE TABLE Overall_Patient_Background_Data (
Origin_From_Korea int,
Origin_From_China int,
Number_of_Male_Patients int,
Number_of_Female_patients int,
Average_patient_birth_year int,
Youngest_patient_birth_year int,
Oldest_patient_birth_year int);

--queries
INSERT INTO Overall_Patient_Background_Data (Origin_From_Korea)
SELECT COUNT(country)
FROM patient WHERE country = 'Korea';

INSERT INTO Overall_Patient_Background_Data (Origin_from_china)
SELECT COUNT(country)
FROM patient WHERE country = 'China';

INSERT INTO Overall_Patient_Background_Data (Number_of_Male_Patients)
SELECT COUNT(sex)
FROM patient WHERE sex = 'male';

INSERT INTO Overall_Patient_Background_Data (Number_of_Female_patients)
SELECT COUNT(sex)
FROM patient WHERE sex = 'female';

INSERT INTO Overall_Patient_Background_Data (Average_patient_birth_year)
SELECT round(AVG(birth_year),0)
FROM patient;

INSERT INTO Overall_Patient_Background_Data (Youngest_patient_birth_year)
SELECT MAX(birth_year)
FROM patient;

INSERT INTO Overall_Patient_Background_Data (Oldest_patient_birth_year)
SELECT MIN(birth_year)
FROM patient;


SELECT * FROM Overall_Patient_Background_Data;
