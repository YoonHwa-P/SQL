-- 조건문
-- 성적표 만들기
-- SELECT * FROM student_score;

SELECT
	id
	, name
	, score
	, CASE
		WHEN score <= 100 AND score >= 90 THEN 'A'
		WHEN score <= 89 AND score >= 80 THEN 'B'
		WHEN score <= 79 AND score >= 70 THEN 'C'
		WHEN score <= 69 THEN 'F'
	  END
FROM student_score;