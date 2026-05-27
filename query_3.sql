SELECT
    gr.group_name,
    sub.subject_name,
    ROUND(AVG(g.grade), 2) AS average_grade

FROM groups gr

JOIN students s
    ON s.group_id = gr.id

JOIN grades g
    ON g.student_id = s.id

JOIN subjects sub
    ON sub.id = g.subject_id


WHERE sub.id = 1

GROUP BY
gr.id,
sub.id

ORDER BY average_grade DESC