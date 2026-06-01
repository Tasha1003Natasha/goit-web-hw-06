SELECT
    s.student_name,
    sub.subject_name,
    ROUND(AVG(g.grade), 2) AS average_grade
FROM grades g

JOIN students s
    ON g.student_id = s.id

JOIN subjects sub
    ON g.subject_id = sub.id
    
WHERE sub.id = 1
GROUP BY s.id, s.student_name, sub.id, sub.subject_name
ORDER BY average_grade DESC;
LIMIT 1;