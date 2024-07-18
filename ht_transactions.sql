/*
Задача 1. 
Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/

delimiter $$
create function second_to_date(sec int)
returns varchar(100)
deterministic
begin
	declare days int default 0;
    declare hours int default 0;
    declare minutes int default 0;
    
    set days = floor(sec / 86400);
    set sec = sec % 86400;
    set hours = floor(sec / 3600);
    set sec = sec % 3600;
    set minutes = floor(sec / 60);
    set sec = sec % 60;
    
    return concat(days, ' days ', hours, ' hours ', minutes, ' minutes ', sec, ' seconds');
 
end $$
delimiter ;

select second_to_date(123456) as perion;


/*
Задача 2. 
Выведите только чётные числа от 1 до 10.
Пример: 2,4,6,8,10
*/

-- Вариант 1. Начинаем перебор чисел с 1
drop procedure even;

DELIMITER $$ -- //
CREATE PROCEDURE even()
BEGIN
	declare num int default 1;
	declare res varchar(100) default '';
    
    while num <= 10 do
		if num % 2 = 0 then
			if num != 2 then
				set res = concat(res, ', ', num);
			else
				set res = concat(res, '', num);
			end if;
		end if;
        set num = num + 1;
	end while;
    select res;
END $$ -- //
DELIMITER ;

CALL even();

-- Вариант 2. Начинаем перебор чисел с 3, установив по умолчанию первое четное число равное 2.  
drop procedure even2;
 
DELIMITER $$ -- //
CREATE PROCEDURE even2()
BEGIN
	declare num int default 3;
	declare res varchar(100) default '2';
    
    while num <= 10 do
		if num % 2 = 0 then
			set res = concat(res, ', ', num);
		end if;
        set num = num + 1;
	end while;
    select res;
END $$ -- //
DELIMITER ;

CALL even2();

-- Вариант 3. Выводит четные числа до числа n, где n целое положительное число 
drop procedure even3;

DELIMITER $$ -- //
CREATE PROCEDURE even3(n int)
BEGIN
	declare num int default 3;
	declare res varchar(100) default '2';
    
    while num <= n do
        if num % 2 = 0 then
			set res = concat(res, ', ', num);
		end if;
        set num = num + 1;
	end while;
    select res;
END $$ -- //
DELIMITER ;

CALL even3(15);