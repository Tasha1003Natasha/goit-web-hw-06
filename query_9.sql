SELECT
	s.student_name,
	sub.subject_name
FROM
	 students s
JOIN grades g
    ON
	 g.student_id = s.id
JOIN subjects sub
    ON
	 sub.id = g.subject_id
	 
WHERE
	s.id = 4
	