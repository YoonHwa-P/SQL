-- 서브쿼리
-- 실제 보유하고 있는 과일 data
select * from real_amount;

--counter: computer가 예측한
select * from assumption_amount;

select * from exception;

--Working flow : main query 확인, sub query 확인
--WHERE Exists (data = True) : main query 실행
--faulse : subquery 실행


SELECT * from real_amount
WHERE EXISTS(
	SELECT * FROM assumption_amount);

SELECT * from real_amount
WHERE EXISTS(
	SELECT * FROM exception);


-- 서브 쿼리가 .WHERE, FROM, SELECT, 어디에 있느냐에 따라 다르다.
-- In 연산자 Not In 연산자
--반드시 하나의 값이 도출 되어야한다.

--SELECT * FROM TABLE
--	WHERE amoun = 값


-- in : 해당하는 값의 table만 호출
SELECT * FROM real_amount
where amount in( 10, 20, 30);

-- ANY 연산자
-- Matching이 되는 어떤 table을 다 호출
SELECT * FROM real_amount
where 10 = ANY(
	SELECT amount FROM assumption_amount);



