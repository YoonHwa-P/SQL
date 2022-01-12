-- 테이블 생성
CREATE TABLE develop_book(
    book_id INTEGER,
    date DATE,
    name VARCHAR(80)
);

-- 등록된 테이블 리스트 조회
-- CMD 창에서는 \dt 실행하면 확인 가능
SELECT * FROM pg_catalog.pg_tables
WHERE schemaname != 'pg_catalog' AND
    schemaname != 'information_schema';

-- 테이블 삭제
DROP TABLE develop_book;

-- 데이터 생성 및 추가
CREATE TABLE develop_book(
    book_id INTEGER,
    date DATE,
    name VARCHAR(80)
);

-- 데이터 자료 추가하기
INSERT INTO develop_book VALUES(1, '2021-12-22', 'SQL 레시피');

-- 큰 따옴표 입력
INSERT INTO develop_book VALUES(2, '2021-12-23', '"자바의 정석"');

-- 작은 따옴표 입력
INSERT INTO develop_book values(3, '2021-12-24', '''자바의 정석''');

-- Let's go 입력
INSERT INTO develop_book values(4, '2021-12-25', 'I''am book');

-- 조회 하기
SELECT * FROM develop_book;

-- 테이블에 자료 여러 개 추가하기
INSERT INTO develop_book values
(5, '2021-12-30', '책1'),
(6, '2021-12-30', '책2'),
(7, '2021-12-30', '책3'),
(8, '2021-12-30', '책4');

-- 조회하기
SELECT * FROM develop_book;

-- 컬럼 선택 조회
SELECT book_id, name FROM develop_book;

-- Limit 명령어
SELECT * FROM develop_book LIMIT 3;

-- OFFSET 명령어 추가
-- 시작 인덱스
-- 시작 인덱스가 0번째 부터 시작
SELECT * FROM develop_book LIMIT 5 OFFSET 2;

-- ORDER BY
-- 오름차순
SELECT * FROM develop_book
ORDER BY name ASC;

-- 내림차순
SELECT * FROM develop_book
ORDER BY name DESC;

-- WHERE 조건문
SELECT * FROm develop_book
WHERE book_id = 5;

SELECT * FROm develop_book
WHERE book_id <> 5;

-- AS 명령어
SELECT name AS 책제목 from develop_book;