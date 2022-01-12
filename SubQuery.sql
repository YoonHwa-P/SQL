SELECT * FROM populations;

-- 기본적인 집계함수
--avg(*) NULL 값이 아닌 모든 입력 값의 평균

SELECT avg(life_expectancy) FROM populations;


--count(*) 입력한 행의 총 갯수
--count(column name) : NOT NULL인 colu,m 행의 갯수
SELECT count(*) FROM populations;  --434
SELECT count(life_expectancy) FROM populations;  --398

-- 약 40개의 행이 NULL인 것을 알 수 있다.

-- MAX, MIN, SUM : null 값이 아닌것
SELECT MAX(life_expectancy) FROM populations;  --398
SELECT MIN(life_expectancy) FROM populations;  --398
SELECT SUM(life_expectancy) FROM populations;  --28250.42


SELECT * from populations;


-- 기대 수명이 가장 높은 COUNTRY code
SELECT country_code FROM populations
WHERE life_expectancy = max(life_expectancy);
-- 오류:  집계 함수는 WHERE 절에서 사용할 수 없습니다.
-- 그래서  subQuery를 사용 해야 한다.
SELECT country_code FROM populations
WHERE life_expectancy = (
	SELECT max(life_expectancy) FROM populations);


SELECT * FROM countries
WHERE code ='LSO';


-- 서브 쿼리의 서부쿼리의 메인쿼리
SELECT * FROM countries
WHERE code = (
		SELECT country_code
		FROM populations
	WHERE life_expectancy = (
		SELECT min(life_expectancy)
		FROM populations
	)
);


--1. Question: 2015 전체 국가의 평균수명 :in populations
SELECT avg(life_expectancy) FROM populations
WHERE year = 2015;

--2. Question: 2015 기대수명의 1.15배 보다 높은 table 불러오기
SELECT * FROM populations
where life_expectancy > (
	SELECT avg(life_expectancy) FROM populations
WHERE year = 2015
)*1.15  and year = 2015;


--## Main Query : city table에서 name, country)code, urban_pop (urban Decrs, head())
--### sub Query : city table에 name과  contries matching이 되는 table 조회
SELECT * FROM cities; --236
SELECT * FROM countries; --266


SELECT name, country_code, urbanarea_pop FROM cities
where name in (SELECT capital FROM countries)
	Order By urbanarea_pop DESC
	limit 5
	;

SELECT capital FROM countries;



-- ## Table 2개를  join 하여 만드는 SQL
SELECT countries.name AS country, COUNT(*) AS cities_num
  FROM cities
      INNER JOIN countries
      ON countries.code = cities.country_code
GROUP BY country
ORDER BY cities_num DESC, country
LIMIT 9;


--서브쿼리
--WHERE --> SELECT
SELECT
	countries.name AS country
	, (SELECT count(*) FROM cities
	   	WHERE countries.code = cities.country_code)
		AS cities_num
FROM countries
ORDER BY cities_num DESC, country
LIMIT 10;
