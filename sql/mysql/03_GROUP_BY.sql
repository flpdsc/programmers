-- 고양이와 개는 몇 마리 있을까
SELECT ANIMAL_TYPE, COUNT(*) AS count FROM ANIMAL_INS GROUP BY ANIMAL_TYPE ORDER BY ANIMAL_TYPE;

-- 동명 동물 수 찾기
SELECT NAME, COUNT(NAME) AS COUNT FROM ANIMAL_INS GROUP BY NAME HAVING COUNT>1 ORDER BY NAME;

-- 입양 시각 구하기(1)
SELECT DATE_FORMAT(DATETIME, '%H') AS HOUR, COUNT(*) FROM ANIMAL_OUTS GROUP BY HOUR HAVING 9<= HOUR AND HOUR<=19 ORDER BY HOUR;

-- 입양 시각 구하기(2)
SET @HOUR = -1;
SELECT (@HOUR := @HOUR+1) AS HOUR, (SELECT COUNT(*) FROM ANIMAL_OUTS WHERE HOUR(DATETIME) = @HOUR) AS COUNT 
FROM ANIMAL_OUTS 
WHERE @HOUR < 23;

-- 가격대 별 상품 개수 구하기
SELECT TRUNCATE(PRICE, -4) AS PRICE_GROUP, COUNT(*) AS PRODCUTS
FROM PRODUCT
GROUP BY PRICE_GROUP
ORDER BY PRICE_GROUP;

-- 진료과별 총 예약 횟수 출력하기
SELECT MCDP_CD AS 진료과코드, COUNT(*) AS 5월예약건수
FROM APPOINTMENT
WHERE MONTH(APNT_YMD) = 5
GROUP BY MCDP_CD
ORDER BY COUNT(MCDP_CD), MCDP_CD;

-- 성분으로 구분한 아이스크림 총 주문량
SELECT ICECREAM_INFO.INGREDIENT_TYPE, SUM(FIRST_HALF.TOTAL_ORDER) AS TOTAL_ORDER
FROM ICECREAM_INFO JOIN FIRST_HALF ON FIRST_HALF.FLAVOR = ICECREAM_INFO.FLAVOR
GROUP BY ICECREAM_INFO.INGREDIENT_TYPE
ORDER BY COUNT(ICECREAM_INFO.INGREDIENT_TYPE);

-- 즐겨찾기가 가장 많은 식당 정보 출력하기
SELECT A.FOOD_TYPE, REST_ID, REST_NAME, A.FAVORITES
FROM REST_INFO AS A 
     JOIN (SELECT FOOD_TYPE, MAX(FAVORITES) AS FAVORITES FROM REST_INFO GROUP BY FOOD_TYPE) AS B 
     ON A.FOOD_TYPE = B.FOOD_TYPE AND A.FAVORITES = B.FAVORITES
ORDER BY A.FOOD_TYPE DESC;