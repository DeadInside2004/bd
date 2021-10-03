-- Задание 1
SELECT 'Любое сообщение'

DO $$
BEGIN
	RAISE NOTICE 'Любое сообщение';
END $$;

-- Задание 2
SELECT CURRENT_DATE

DO $$
BEGIN
	RAISE NOTICE '%', CURRENT_DATE;
END $$;

-- Задание 3
DO $$
DECLARE
	_a int = 2;
	_b int = 3;
	_c int;
BEGIN
	_c = _a+_b;
	RAISE NOTICE '%', _c;
END $$;

-- Задание 4
-- IF
DO $$
DECLARE
	_number int = 4;
BEGIN
	IF _number = 5 THEN
		RAISE NOTICE 'Отлично';
	ELSEIF _number = 4 THEN
		RAISE NOTICE 'Хорошо';
	ELSEIF _number = 3 THEN
		RAISE NOTICE 'Удовлетворительно';
	ELSEIF _number = 2 THEN
		RAISE NOTICE 'Неуд';
	ELSE
		RAISE NOTICE 'Введённая оценка не верна';
	END IF;
END $$;
-- CASE
DO $$
DECLARE
	_number int = 5;
BEGIN
	CASE _number
		WHEN 5 THEN
			RAISE NOTICE 'Отлично';
		WHEN 4 THEN
			RAISE NOTICE 'Хорошо';
		WHEN 3 THEN
			RAISE NOTICE 'Удовлетворительно';
		WHEN 2 THEN
			RAISE NOTICE 'Неуд';
		ELSE
			RAISE NOTICE 'Введённая оценка не верна';
	END CASE;
END $$;

-- Задание 5
-- LOOP
DO $$
DECLARE
	_number int = 20;
	_square int;
BEGIN
	LOOP
		_square = _number*_number;
		_number = _number + 1;
		RAISE NOTICE '%', _square;
    	IF _number > 30 THEN
        	EXIT;
    	END IF;
	END LOOP;
END $$;
-- WHILE
DO $$
DECLARE
	_number int = 20;
	_square int;
BEGIN
	WHILE _number <= 30
		LOOP
			_square = _number*_number;
			_number = _number + 1;
			RAISE NOTICE '%', _square;
		END LOOP;
END $$;
-- FOR
DO $$
DECLARE
	_number int = 20;
	_square int;
BEGIN
	FOR i IN 20..30
		LOOP
   			_square = _number*_number;
			_number = _number + 1;
			RAISE NOTICE '%', _square;
		END LOOP;
END $$;

-- Задание 6
DO $$
DECLARE
	_number int = 89;
BEGIN
	WHILE _number != 1
		LOOP
			IF _number % 2 = 1 THEN
				_number = _number * 3 +1;
			ELSE
				_number = _number / 2;
			END IF;
			RAISE NOTICE '%', _number;
		END LOOP;
END $$;

-- Задание 7
DO $$
DECLARE
	_count int = 22;
	_ln0 int = 2;
	_ln1 int = 1;
	_number int;
BEGIN
	RAISE NOTICE 'number 1 = 1';
	FOR i IN 2.._count
		LOOP
   			_number = _ln0 + _ln1;
			RAISE NOTICE 'number % = %', i, _number;
			_ln0 = _ln1;
			_ln1 = _number;
		END LOOP;
END $$;

-- Задание 1 процедура
CREATE OR REPLACE PROCEDURE kotlac_procedure(INOUT _number int)
LANGUAGE plpgsql
AS $$
BEGIN
	WHILE _number != 1
		LOOP
			IF _number % 2 = 1 THEN
				_number = _number * 3 +1;
			ELSE
				_number = _number / 2;
			END IF;
			RAISE NOTICE '%', _number;
		END LOOP;
END;
$$;

CALL kotlac_procedure(89)

-- Задание 2 процедура
CREATE OR REPLACE PROCEDURE luc_procedure(INOUT _count int)
LANGUAGE plpgsql
AS $$
DECLARE
	_ln0 int = 2;
	_ln1 int = 1;
	_number int;
BEGIN
	RAISE NOTICE 'number 1 = 1';
	FOR i IN 2.._count
		LOOP
   			_number = _ln0 + _ln1;
			RAISE NOTICE 'number % = %', i, _number;
			_ln0 = _ln1;
			_ln1 = _number;
		END LOOP;
END;
$$;

CALL luc_procedure(22)

-- Задание 1 функция
CREATE OR REPLACE FUNCTION kotlac_function(_number int) RETURNS int
AS $$
DECLARE
	_count int = 0;
BEGIN
	WHILE _number != 1
		LOOP
			IF _number % 2 = 1 THEN
				_number = _number * 3 +1;
			ELSE
				_number = _number / 2;
			END IF;
			RAISE NOTICE '%', _number; -- просто еще и вывожу для проверки
			_count = _count + 1;
		END LOOP;
	RETURN _count;
END
$$ LANGUAGE plpgsql;

SELECT kotlac_function(3)

-- Задание 2 функция
CREATE OR REPLACE FUNCTION luc_function(_count int) RETURNS int
AS $$
DECLARE
	_ln0 int = 2;
	_ln1 int = 1;
	_number int;
BEGIN
	RAISE NOTICE 'number 1 = 1';
	FOR i IN 2.._count
		LOOP
   			_number = _ln0 + _ln1;
			RAISE NOTICE 'number % = %', i, _number; -- и тут
			_ln0 = _ln1;
			_ln1 = _number;
		END LOOP;
	RETURN _number;
END
$$ LANGUAGE plpgsql;

SELECT luc_function(5)
