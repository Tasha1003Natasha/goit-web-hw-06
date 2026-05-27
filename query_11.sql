SELECT
	s.student_name,
	t.teacher_name,
	ROUND(AVG(g.grade), 2) AS average_grade
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
	s.id = 12
	AND t.id = 1
	
