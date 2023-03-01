/*
1. Используя операторы языка SQL, 
создайте таблицу “sales”. Заполните ее данными. Справа располагается рисунок к первому заданию.
*/

CREATE DATABASE IF NOT EXISTS lesson2;
USE lesson2;

CREATE TABLE IF NOT EXISTS sales
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    count_product INT NOT NULL
);

INSERT sales(order_date, count_product)
VALUES 
	('2022-01-01', 156),
    ('2022-01-02', 180),
    ('2022-01-03', 21),
    ('2022-01-04', 124),
    ('2022-01-05', 341);    

/*
2. Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва : 
меньше 100  -    Маленький заказ
от 100 до 300 - Средний заказ
больше 300  -     Большой заказ
*/
SELECT 
	id "id заказа",
    IF(count_product < 100, "Маленький заказ",
		IF(count_product BETWEEN 100 AND 300, "Средний заказ", "Большой заказ")) as "Тип заказа"
FROM sales;
