
-- Table create

CREATE TABLE develop_book(
	book_id INTEGER
	, date DATE
	, name VARCHAR(80)
);


-- config Table : cmd 창에서 table list 조회, \dt랑 같은 방법
SELECT * FROM pg_catalog.pg_tables
WHERE schemaname != 'pg_catalog' AND
    schemaname != 'information_schema';


-- table delete
DROP TABLE develop_book;


-- insert data
INSERT INTO develop_book VALUES(1, '2021-12-22', 'SQL recipe');

-- 큰따옴표 입력
INSERT INTO develop_book VALUES(2, '2021-12-23', '"Java의 정석"');

-- 작은따옴표 입력
INSERT INTO develop_book VALUES(3, '2021-12-24', '''공부하시긿''');

-- I'm, Let's go
INSERT INTO develop_book VALUES(4, '2021-12-25', 'I''m book');

-- 조회하기
select * from develop_book

--Table에 Insert 여러개
insert into develop_book values
(5,'2021-12-27','book one'),
(6,'2021-12-27','book tow'),
(7,'2021-12-27','book Three'),
(8,'2021-12-27','book four');

--column select and find
select book_id, name from develop_book;

--limit query
SELECT * FROM develop_book Limit 3;

-- offset query
-- 원하는 index 부터 시작 (0~)
SELECT * FROM develop_book Limit 5 OFFSET 1;

-- order by
-- 오름차순(ASC, 내림차순 DESC)
select * from develop_book
Order By name ASC;


-- where 조건문
-- 해당 : = , 제외 : <>,
SELECT * FROM develop_book
where book_id = 4;


-- as query
SELECT name as 책체목 from develop_book;


--------------------------------------------

CREATE TABLE populations (
  pop_id                INTEGER     PRIMARY KEY,
  country_code          VARCHAR,
  year                  INTEGER,
  fertility_rate        REAL,
  life_expectancy       REAL,
  size                  REAL
);

CREATE TABLE cities (
  name                    VARCHAR   PRIMARY KEY,
  country_code            VARCHAR,
  city_proper_pop         REAL,
  metroarea_pop           REAL,
  urbanarea_pop           REAL
);

CREATE TABLE countries (
  code                  VARCHAR     PRIMARY KEY,
  name                  VARCHAR,
  continent             VARCHAR,
  region                VARCHAR,
  surface_area          REAL,
  indep_year            INTEGER,
  local_name            VARCHAR,
  gov_form              VARCHAR,
  capital               VARCHAR,
  cap_long              REAL,
  cap_lat               REAL
);

SELECT * FROM pg_catalog.pg_tables
WHERE schemaname != 'pg_catalog' AND
    schemaname != 'information_schema';











