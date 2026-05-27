SELECT
	t.teacher_name,
	ROUND(AVG(g.grade), 2) AS average_grade
FROM
	 grades g
JOIN subjects sub
    ON
	 sub.id = g.subject_id
JOIN teachers t
    ON
	 t.id = sub.teacher_id
WHERE
	t.id = 1
	