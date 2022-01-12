-- coalesce 함수
-- data조회시 null 값을 기본값으로 차환하는 함수

INSERT INTO student_score(name, score)
Values ('Hello', null), ('hi', null)


SELECT
	id
	, name
	, score
	, case
		when score <= 100 AND score>=90 THEN 'A'
		when score < 90 AND score>=80 THEN 'B'
		when score < 80 AND score>=70 THEN 'C'
		when COALESCE(score, 0) <70 THEN 'F'
	END
From student_score;


--Null if(같으면 Null, 다르면 첫번재인수)
SELECT NULLIF(10, 10) as column1;
SELECT NULLIF(11, 12) as column2;


-- SELECT 사칙연산

SELECT 100+1 as column3;

SELECT * from division_by_zero;
SELECT
	students
	, COALESCE((12/NULLIF(students, 0)):: char, '나눌 수 없음' )
			  as column7
from division_by_zero;


-- psql -U postgres -d postgres -f student_grade.sql -o grade.csv -F ',' -A -t
