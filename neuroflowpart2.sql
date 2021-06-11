--Question 1
SELECT YEAR(exercise_completion_date) AS YEAR, MONTH(exercise_completion_date) AS MONTH, user_id,exercise_completion_date FROM exercises a 
LEFT JOIN (SELECT user_id,created_at, COUNT(*) * 100.0 / SUM(COUNT(*)) over() AS percentage 
FROM users GROUP BY user_id )  b   ON a.user_id= b.user_id AND ON a.exercise_completion_date=b.created_at GROUP BY YEAR(exercise_completion_date),
 MONTH(exercise_completion_date);
 
 --Question 2
 SELECT COUNT(users.user_id) AS cnt,exercises.exercise_completion_date FROM users LEFT JOIN exercises
 ON users.user_id=exercises.user_id WHERE exercise_completion_date!='' GROUP BY users.user_id  ORDER BY exercises.exercise_completion_date;
 
 --Question 3
 SELECT providers.provider_id, providers.organization_name, AVG(phq9.score) AS score FROM Providers LEFT JOIN phq9 ON Providers.provider_id=phq9.provider_id
 ORDER BY score DESC LIMIT 5;
