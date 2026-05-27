SELECT
	s.student_name,
	sub.subject_name,
	t.teacher_name
FROM
	 students s
JOIN grades g
    ON
	 g.student_id = s.id
JOIN subjects sub
    ON
	 sub.id = g.subject_id
JOIN teachers t 
    ON
	 t.id = sub.teacher_id
WHERE
	s.id = 4
	AND t.id = 1