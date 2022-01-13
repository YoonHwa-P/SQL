CREATE TABLE languages (
  lang_id               INTEGER     PRIMARY KEY,
  code                  VARCHAR,
  name                  VARCHAR,
  percent               REAL,
  official              BOOLEAN
);

CREATE TABLE economies (
  econ_id               INTEGER     PRIMARY KEY,
  code                  VARCHAR,
  year                  INTEGER,
  income_group          VARCHAR,
  gdp_percapita         REAL,
  gross_savings         REAL,
  inflation_rate        REAL,
  total_investment      REAL,
  unemployment_rate     REAL,
  exports               REAL,
  imports               REAL
);



CREATE TABLE languages (
  lang_id               INTEGER     PRIMARY KEY,
  code                  VARCHAR,
  name                  VARCHAR,
  percent               REAL,
  official              BOOLEAN
);

CREATE TABLE economies (
  econ_id               INTEGER     PRIMARY KEY,
  code                  VARCHAR,
  year                  INTEGER,
  income_group          VARCHAR,
  gdp_percapita         REAL,
  gross_savings         REAL,
  inflation_rate        REAL,
  total_investment      REAL,
  unemployment_rate     REAL,
  exports               REAL,
  imports               REAL
);

SELECT * from languages;

SELECT * from economies;

SELECT * FROM countries;

---

SELECT code, count(*) as lang_num from languages
Group by code;


SELECT local_name, subquery.lang_num
from countries, (SELECT code, count(*) as lang_num
				 FROM languages
				 Group by code) as subquery
WHERE countries.code = subquery.code
ORDER by lang_num DESC;


--
SELECT * FROM economies;


SELECT name, continent, inflation_rate
  -- From countries
  FROM countries
    -- INNER JOIN economies
    INNER JOIN economies
    -- ON
    on countries.code = economies.code
  -- Where year is 2015
  WHERE year = 2015
    -- (alias as subquery)
    AND inflation_rate IN (
        SELECT MAX(inflation_rate) AS max_inf
        FROM (
             SELECT name, continent, inflation_rate
             FROM countries
             INNER JOIN economies
             -- Using(code) 대신 ON 쿼리를 작성합니다.
               on countries.code = economies.code
             WHERE year = 2015) AS subquery
      -- Group by continent
        GROUP BY continent);













