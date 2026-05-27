SELECT
	t.teacher_name,
	sub.subject_name
FROM
	teachers t
JOIN subjects sub
    ON
	sub.teacher_id = t.id

WHERE teacher_id = 1