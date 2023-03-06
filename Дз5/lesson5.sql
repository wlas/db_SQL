CREATE DATABASE IF NOT EXISTS lesson5;
USE lesson5;

CREATE TABLE cars
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);
INSERT INTO cars(`name`,`cost`)
VALUES
	("Audi", 52642), 
    ("Mercedes", 57127 ),
    ("Skoda", 9000 ),
    ("Volvo", 29000),
	("Bentley", 350000),
    ("Citroen ", 21000 ), 
    ("Hummer", 41400), 
    ("Volkswagen ", 21600);

/*
	1. Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов.
*/
CREATE VIEW price_min AS
SELECT * FROM cars
WHERE cost < 25000;

SELECT * FROM price_min;

/*
	2. Изменить в существующем представлении порог для стоимости: 
    пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW).
*/
ALTER VIEW price_min AS 
SELECT * FROM cars 
WHERE cost < 30000;

SELECT * FROM price_min;
/*
	3. 	Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”.
*/
CREATE VIEW only_car AS
SELECT * FROM cars
WHERE `name` IN ("Skoda","Audi");

SELECT * FROM only_car;
