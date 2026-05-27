SELECT
    s.student_name,
    sub.subject_name,
    ROUND(AVG(g.grade), 2) AS average_grade
FROM grades g

JOIN students s
    ON g.student_id = s.id

JOIN subjects sub
    ON g.subject_id = sub.id

GROUP BY s.id, sub.id
ORDER BY average_grade DESC;