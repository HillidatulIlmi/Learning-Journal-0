-- Membuat table teachers
CREATE TABLE teachers (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name varchar(25) NOT NULL,
    last_name varchar(50),
    school varchar(50) NOT NULL,
    hire_date date,
    salary numeric
    );
    
-- Menambah kolom baru age

ALTER table teachers ADD age INT;

-- Menghapus kolom age
ALTER TABLE teachers DROP age;

-- Mengganti tipe data kolom salary
ALTER TABLE teachers MODIFY salary int;

-- Mengganti nama tabel
ALTER TABLE teachers RENAME TO guru;

ALTER TABLE guru RENAME to teachers;

-- ubah nama colom
 alter TABLE teachers rename COLUMN salary to gaji;
 alter TABLE teachers RENAME COLUMN gaji to salary;


-- Insert data
INSERT INTO teachers (id,first_name, last_name, school, hire_date, salary)
    VALUES (1,'Janet', 'Smith', 'MIT', '2011-10-30', 36200),
           (2,'Lee', 'Reynolds', 'MIT', '1993-05-22', 65000),
           (3,'Samuel', 'Cole', 'Cambridge University', '2005-08-01', 43500),
           (4,'Samantha', 'Bush', 'Cambridge University', '2011-10-30', 36200),
           (5,'Betty', 'Diaz', 'Cambridge University', '2005-08-30', 43500),
           (6,'Kathleen', 'Roush', 'MIT', '2010-10-22', 38500),
           (7,'James', 'Diaz', 'Harvard University', '2003-07-18', 61000),
           (8,'Zack', 'Smith', 'Harvard University', '2000-12-29', 55500),
           (9,'Luis', 'Gonzales', 'Standford University', '2002-12-01', 50000),
           (10,'Frank', 'Abbers', 'Standford University', '1999-01-30', 66000);
           
-- insert data without id
INSERT INTO teachers (first_name, last_name, school, hire_date, salary)
    VALUES ('Samuel', 'Abbers', 'Standford University', '2006-01-30', 32000),
           ('Jessica', 'Abbers', 'Standford University', '2005-01-30', 33000),
           ('Tom', 'Massi', 'Harvard University', '1999-09-09', 39500),
           ('Esteban', 'Brown', 'MIT', '2007-01-30', 36000),
           ('Carlos', 'Alonso', 'Standford University', '2001-01-30', 44000);
           
-- Menampilkan semua data
SELECT * 
FROM teachers;

-- Menghapus semua data di tabel
TRUNCATE TABLE teachers;

-- Menghapus tabel 
DROP TABLE teachers;

-- Mengubah salary dari id = 3
UPDATE teachers 
SET salary = 50000 
WHERE id = 3;

-- Menampilkan kolom first name, school, salary
SELECT first_name, school, salary
FROM teachers;

-- Mengurutkan gaji dari yang terkecil
SELECT first_name, school, salary
FROM teachers
ORDER by salary;

-- Mengurutkan gaji dari yang terbesar
SELECT first_name, school, salary
FROM teachers
ORDER by salary DESC;

-- Mengurutkan last name dari Z-A dan school dari A-Z
SELECT *
from teachers
order BY last_name DESC, school ASC;

-- Menghapus data yang id = 6
DELETE FROM teachers
WHERE id = 6;

-- menambah data baru
INSERT into teachers (id, first_name, last_name, school, hire_date, salary)
VALUES (6,'Kathleen', 'Roush', 'MIT', '2010-10-22', 38500);

-- Mencari dosen yang school nya di Harvard gaji di atas 40000
SELECT *
from teachers
WHERE school = 'harvard university' and salary > 40000;

-- Mencari dosen yang school nya mengandung kata va
SELECT *
from teachers
where school like '%va%';

SELECT *
from teachers
where school like 'harvard%';

SELECT *
from teachers
where school like '%university';

-- Mencari dosen yang nama belakangnya abbers atau smith
-- CARA 1 (pake or)
SELECT * 
FROM teachers
WHERE last_name = 'abbers' or last_name = 'smith';

-- CARA 2 (pake in)
SELECT * 
from teachers
WHERE last_name in ('abbers','smith');

-- Mencari gaji antara 20000 sampai 50000 dan urutkan dari yang paling besar
SELECT *
FROM teachers
WHERE salary BETWEEN 20000 and 50000
order by salary DESC;

-- Mencari dosen yang di hire dari tanggal 1999-09-09 sampai 2002-12-01
SELECT *
FROM teachers
WHERE hire_date BETWEEN '1999-09-09' AND '2002-12-01';

-- Melihat total gaji dari MIT
SELECT school, SUM(salary) as total_salary
FROM teachers
WHERE school = 'mit';

-- Melihat total gaji dari masing-masing universitas
SELECT school, sum(salary) as 'total salary'
from teachers
GROUP by school;

-- Melihat unique value di kolom school
SELECT DISTINCT school
from teachers;

-- Melihat berapa unique value di kolomo school
SELECT COUNT(DISTINCT(school))
from teachers;

-- Melihat total data di sekolah MIT
SELECT count(school) as 'total data mit'
from teachers
WHERE school = 'mit';

-- Melihat banyak sekolah di data
SELECT DISTINCT(school),COUNT(school) 
from teachers 
GROUP BY school;

