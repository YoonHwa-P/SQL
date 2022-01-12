-- 조건문
-- 성적표 만들기
SELECT
	id
	, name
	, score
	, case
		when score <= 100 AND score>=90 THEN 'A'
		when score < 90 AND score>=80 THEN 'B'
		when score < 80 AND score>=70 THEN 'C'
		when score < 70  THEN 'F'
	END
From student_score;
