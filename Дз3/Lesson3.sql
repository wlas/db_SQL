CREATE DATABASE IF NOT EXISTS lesson3;

USE lesson3;
CREATE TABLE IF NOT EXISTS `staff`
( 
	`id` INT AUTO_INCREMENT PRIMARY KEY ,
	`firstname` VARCHAR(45),
    `lastname` VARCHAR(45),
    `post` VARCHAR(45),
    `seniority` INT,
    `salary` INT,
    `age` INT
);
TRUNCATE staff;
INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES
	('Вася', 'Петров', 'Начальник', 40, 100000, 60),
	('Петр', 'Власов', 'Начальник', 8, 70000, 30),
	('Катя', 'Катина', 'Инженер', 2, 70000, 25),
	('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
	('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
	('Петр', 'Петров', 'Рабочий', 20, 25000, 40),
	('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
	('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
	('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
	('Максим', 'Петров', 'Рабочий', 2, 11000, 22),
	('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
	('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);
    
/*
	1. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания
*/
SELECT * FROM staff
ORDER BY salary DESC;  -- сортировка в порядке убывания

SELECT * FROM staff 
ORDER BY salary; -- сортировка в порядке возрастания

/*
	2. Выведите 5 максимальных заработных плат (saraly).
*/
SELECT * FROM staff
ORDER BY salary DESC
LIMIT 5; 
/*
	3. Посчитайте суммарную зарплату (salary) по каждой специальности (роst).
*/
SELECT post, SUM(salary) FROM staff
GROUP BY post;
/*
	4. Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 25 до 49 лет включительно.
*/
SELECT post, COUNT(lastname) AS "Количество сот-ов" FROM staff
WHERE age BETWEEN 25 AND 49 AND post = 'Рабочий';

/*
	5. Найдите количество специальностей.
*/
SELECT post, COUNT(post) AS "Кол-во специальностей"
FROM staff
GROUP BY post
