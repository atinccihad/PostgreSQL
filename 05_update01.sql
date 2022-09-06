CREATE TABLE companies(
  company_id SMALLINT,
  company VARCHAR(20),
  number_of_employees SMALLINT
);
INSERT INTO companies VALUES(100, 'IBM', 12000);
INSERT INTO companies VALUES(101, 'GOOGLE', 18000);
INSERT INTO companies VALUES(102, 'MICROSOFT', 10000);
INSERT INTO companies VALUES(103, 'APPLE', 21000);
--TASK-1 : companies tablosundan en yüksek ikinci number_of_employees değeri olan company ve number_of_employees değerlerini çağırın.
--1.yol OFFSET ve FETCH NEXT kullanarak
SELECT company,number_of_employees
FROM companies
Order By number_of_employees DESC
OFFSET 1 row
FETCH NEXT 1 row only;
--2.yol 
SELECT company, number_of_employees
FROM companies
WHERE number_of_employees = (SELECT MAX(number_of_employees)
                             FROM companies
                             WHERE number_of_employees < (SELECT MAX(number_of_employees)
                             FROM companies));
--TASK-2 : number_of_employees değeri ortalama çalışan sayısından az olan number_of_employees değerlerini 16000 olarak UPDATE edin.
UPDATE companies
SET number_of_employees = 16000
WHERE number_of_employees < (SELECT AVG(number_of_employees)
                             FROM companies)
--TASK-3 : Prepared statement kullanarak company adı IBM olan number_of_employees değerini 9999 olarak güncelleyin.
UPDATE companies SET number_of_employees = 9999 WHERE company = 'IBM'
SELECT * FROM companies 