SELECT ROUND(AVG(LAT_N), 4) AS median
FROM (
    SELECT LAT_N, ROW_NUMBER() OVER (ORDER BY LAT_N) AS row_num, COUNT(*) OVER () AS total_count
    FROM STATION
) t
WHERE row_num IN (FLOOR((total_count + 1)/2), CEIL((total_count + 1)/2));