-- 고양이와 개는 몇 마리 있을까
SELECT ANIMAL_TYPE, COUNT(*) AS count FROM ANIMAL_INS GROUP BY ANIMAL_TYPE ORDER BY ANIMAL_TYPE;

-- 동명 동물 수 찾기
SELECT NAME, COUNT(NAME) AS COUNT FROM ANIMAL_INS GROUP BY NAME HAVING COUNT>1 ORDER BY NAME;

-- 입양 시각 구하기(1)
SELECT DATE_FORMAT(DATETIME, '%H') AS HOUR, COUNT(*) FROM ANIMAL_OUTS GROUP BY HOUR HAVING 9<= HOUR AND HOUR<=19 ORDER BY HOUR;

-- 입약 시각 구하기(2)
SET @HOUR = -1;
SELECT (@HOUR := @HOUR+1) AS HOUR, (SELECT COUNT(*) FROM ANIMAL_OUTS WHERE HOUR(DATETIME) = @HOUR) AS COUNT 
FROM ANIMAL_OUTS 
WHERE @HOUR < 23;