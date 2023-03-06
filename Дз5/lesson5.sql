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

/*
   ##########################################
*/

CREATE TABLE schedule
(
	train_id INT NOT NULL,
    station VARCHAR(20),
    station_time TIME NOT NULL
);

INSERT schedule
VALUES
	(110, 'San Francisco', '10:00:00'),
    (110, 'RedWood City', '10:54:00'),
    (110, 'Palo Alto', '11:02:00'),
    (110, 'San Jose', '12:35:00'),
    (120, 'San Francisco', '11:00:00'),
    (120, 'Palo Alto', '12:49:00'),
    (120, 'San Jose', '13:30:00');
    
SELECT * FROM schedule;    
/*
    4. Добавьте новый столбец под названием «время до следующей станции».
*/
SELECT
	schedule.*,
    TIMEDIFF(LEAD(station_time) OVER (PARTITION BY train_id), station_time) AS time_to_next_station
FROM schedule;

