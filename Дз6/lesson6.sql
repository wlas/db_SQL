/*
	1.	Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
	Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/
DROP FUNCTION IF EXISTS convert_time;

delimiter $$
CREATE FUNCTION convert_time (seconds INT)
RETURNS CHAR(80)
DETERMINISTIC 
BEGIN
	DECLARE days, hours, minutes INT DEFAULT 0;
    DECLARE sec_per_minutes INT DEFAULT 60;
    DECLARE min_per_hours INT DEFAULT 60;
    DECLARE hours_per_days INT DEFAULT 24;
    
    SET minutes = seconds DIV sec_per_minutes;
    SET seconds = seconds % sec_per_minutes;
    SET hours = minutes DIV min_per_hours;
    SET minutes = minutes % min_per_hours;
    SET days = hours DIV hours_per_days;
    SET hours = hours % hours_per_days;
    RETURN concat(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds ');    
END $$
delimiter ;

SELECT convert_time(12345);

/*
	2.	Выведите только четные числа от 1 до 10 включительно. (Через функцию / процедуру)
	Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2)
*/
DROP PROCEDURE IF EXISTS get_even_numbers;

delimiter $$
CREATE PROCEDURE get_even_numbers (numb INT)
BEGIN
	DECLARE result CHAR(30);
    DECLARE tmp CHAR(5);    
    SET result = "";
    
    WHILE (numb <= 10) DO
		BEGIN
			IF (numb % 2 = 0) THEN
				IF (numb = 10) THEN
					SET tmp = numb;
				ELSE
					SET tmp = CONCAT(numb, ',');
				END IF;
                SET result = CONCAT(result, tmp);
			END IF;
            SET numb = numb + 1;
		END;
	END WHILE;
    SELECT result;
END $$
delimiter ;
	
CALL get_even_numbers(2);