SELECT
	s.student_name,
	gr.group_name,
	sub.subject_name,
	g.grade,
	g.grade_date_of
FROM
	students s
JOIN groups gr ON
	gr.id = s.group_id
JOIN grades g ON
	g.student_id = s.id
JOIN subjects sub ON
	sub.id = g.subject_id
WHERE
	gr.id = 1
	AND sub.id = 4
	AND g.grade_date_of = (
	SELECT
		MAX(g2.grade_date_of)
	FROM
		grades g2
	JOIN students s2 ON
		s2.id = g2.student_id
	WHERE
		s2.group_id = 1
		AND g2.subject_id = 4
  )



