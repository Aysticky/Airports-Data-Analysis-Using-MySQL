SELECT * FROM airports;

-- Get count of all airport entries ('name' is the airports)
 SELECT COUNT(*) AS total_entries FROM airports;
 
 -- Get distinct count of all airport entries
 SELECT COUNT(DISTINCT name) AS distinct_entries FROM airports;
 
 -- Calculate the difference
 SELECT COUNT(*) - COUNT(DISTINCT name) AS difference FROM airports;
 
 -- Shortest airport name with its length
SELECT name, LENGTH(name) AS length
FROM airports
ORDER BY length, name
LIMIT 1;

-- Longest airport name with its length
SELECT name, LENGTH(name) AS length
FROM airports
ORDER BY length DESC, name
LIMIT 1; 

-- Query for airport names starting with vowels without duplicates
SELECT DISTINCT name
FROM airports
WHERE LOWER(SUBSTRING(name FROM 1 FOR 1)) IN ('a', 'e', 'i', 'o', 'u');

-- Calculate average distance between airports
SELECT AVG(calculate_distance(a.latitude_deg, a.longitude_deg, b.latitude_deg, b.longitude_deg)) AS average_distance
FROM airports a
CROSS JOIN airports b
WHERE a.id < b.id;