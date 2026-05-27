SELECT
    s.student_name,
    ROUND(AVG(g.grade), 2) AS average_grade
FROM grades g
JOIN students s
    ON g.student_id = s.id
GROUP BY s.id
ORDER BY average_grade DESC
LIMIT 5;