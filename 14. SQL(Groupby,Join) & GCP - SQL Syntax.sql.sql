-- Membuat tabel courses
CREATE TABLE courses (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name varchar(20),
    teachers_id INT,
    total_students INT
    );

-- Insert data ke tabel courses
INSERT INTO courses (name, teachers_id, total_students)
    VALUES  ('Calculus', 2, 20),
            ('Physics', 2, 10),
            ('Calculus', 1, 30),
            ('Computer Science', 1, 20),
            ('Politic', 13, 15),
            ('Algebra', 2, 10),
            ('Algebra', 13, 30),
            ('Computer Science', 10, 35),
            ('Life Science', 11, 20),
            ('Chemistry', 9, 22),
            ('Chemistry', 8, 16),
            ('Calculus', 5, 19),
            ('Politic', 4, 17),
            ('Biology', 6, 22),
            ('Physics', 3, 29),
            ('Biology', 8, 28),
            ('Calculus', 12, 34),
            ('Physics', 13, 34),
            ('Biology', 14, 25),
            ('Calculus', 15, 20);

-- Menampilkan semua tabel courses
SELECT *
from courses

-- Menggabungankan tabel teachers dan courses (Inner join/join)
SELECT *
FROM teachers
JOIN courses on teachers.id = courses.teachers_id;

-- Menggabungkan tabel teachers dan courses (Left Join)
SELECT *
FROM teachers
LEFT JOIN courses on teachers.id = courses.teachers_id;

-- Menggabungkan tabel teachers dan courses (Right Join)
SELECT *
FROM teachers
RIGHT JOIN courses on teachers.id = courses.teachers_id;

-- Menggabungkan tabel teachers dan courses (Outer Join)
SELECT *
FROM teachers
left OUTER JOIN courses on teachers.id = courses.teachers_id
UNION
SELECT *
FROM teachers
RIGHT OUTer JOIN courses on teachers.id = courses.teachers_id;

-- Menampilkan nama dosen dan mengajar apa saja
SELECT teachers.first_name, teachers.last_name, courses.name
from teachers
join courses on teachers.id = courses.teachers_id;

-- Menampilkan dosen yang mengajar calculus
SELECT *
from teachers
JOIN courses on teachers.id = courses.teachers_id
WHERE courses.name = 'calculus';

-- Melihat jumlah mata kuliah di setiap universitas
SELECT teachers.school, count(courses.name) as Total_matkul
from teachers
JOIN courses on teachers.id = courses.teachers_id
group by teachers.school;

-- Subquery atau inner query
-- Menampilkan nama dosen yang memiliki gaji tertinggi
SELECT first_name, last_name
from teachers
WHERE salary=(SELECT MAX(salary) from teachers);

-- Menampilkan rata-rata gaji dosen di Cambridge University
SELECT AVG(salary) as 'Rata-rata gaji', FLOOR(AVG(salary)) AS 'pembulatan ke bawah', CEIL(AVG(salary)) AS 'pembulatan ke atas'
from teachers
WHERE school = 'cambridge university';

-- Melihat dosen yang memiliki gaji tertinggi di setiap univesitas 
SELECT first_name, last_name, school, salary
from teachers
WHERE (school, salary) in (SELECT school, MAX(salary) from teachers group by school);

-- Melihat nama dosen dan jumlah mata kuliah yang diajarkan
SELECT teachers.first_name, count(courses.name) AS jumlah_matkul
from teachers
JOIN courses on teachers.id = courses.teachers_id
GROUP by teachers.first_name
ORDER by jumlah_matkul DESC;

-- Melihat universitas yang total mata kuliahnya lebih dari 5
SELECT teachers.school, COUNT(courses.name) as total_matkul
FROM teachers
JOIN courses on teachers.id = courses.teachers_id
group by teachers.school
HAVING total_matkul > 5;