select * from summer_medals;

-- Window Fuction
-- Aggregation 과 다른점 : 행이 사라지지 않고, 연산이 된다.
-- 누적 집계 data, 순위 data 를 사용 할 수 있다.

SELECT
	row_number() over
	(order by year DESC, event ASC)
	AS Row_N, year, Event,Country
From summer_medals

-- PARTITION BY : 테이블을 각 칼럼의 값에 따라서 분할
-- Raw_Number : 파티션에 따라 새롭게 정의 내린다.
-- Ranking :
-- Row_Number : 두 행의 고유한 값이 같으면 동순위로 치고 넘어감

SELECT Row_Number() Over() as Row_Rum
	, *
FROM summer_medals;

-- 올림픽 연도를 오름차순 순번대로 작성을 한다.
-- 중복 값은 제거 (연도)

SELECT DISTINCT year
	FROM summer_medals
	ORDER BY year ASC;

SELECT
	ROW_NUMBER() OVER() as row_num
	, year
FROM
	(SELECT DISTINCT year
	FROM summer_medals
	ORDER BY year ASC) AS years
ORDER BY year ASC

-- 운동선수들의 매달의 갯수 구하기

SELECT DISTINCT athlete, medal
	FROM summer_medals
	Group by athlete
	ORDER BY year ASC;



SELECT
	DISTINCT athlete
	,count(*) as medal_counts
	FROM summer_medals
	Group by athlete
	ORDER BY medal_counts DESC
	limit 5;

--with
WITH athlete_medals AS (
	SELECT
		athlete_medals
		, count(*) as medal_counts
	FROM summer_medals
	Group by athlete
	ORDER BY medal_counts DESC );


SELECT
	athlete
	, medal_counts
	, ROW_NUMBER() over)(Order by medal_counts DESC) as row_num
	FROM summer_medals
order by medal_counts DESC;


-- 남자  69KG 역도 경기에서 금메달 리스트를 뽑아보자.

SELECT DISTINCT discipline
	, Event
	FROM summer_medals
	WHERE
	discipline = 'Weightlifting'


SELECT year
	, country
	, athlete
From
	summer_medals
WHERE
	discipline = 'Weightlifting' AND
	event = '69KG' AND
	gender = 'Men' and
	medal = 'Gold'
Order by year DESC;


--LAG
year, champion, last_champion

with weight_69_Gold as (
	SELECT year
	, country
	, athlete
From
	summer_medals
WHERE
	discipline = 'Weightlifting' AND
	event = '69KG' AND
	gender = 'Men' and
	medal = 'Gold'
);

SELECT
	year
	, champion
	, LAG(champion) OVER(ORDER BY year asc) as last_chmpion
	FROM weight_69_Gold
	ORDER BY year asc

--https://www.postgresql.org/docs/13/functions-window.html




