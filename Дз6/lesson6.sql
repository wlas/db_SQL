/*
	1.	Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
	Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/
delimiter $$
DROP FUNCTION IF EXISTS convert_time;

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