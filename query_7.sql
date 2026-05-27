SELECT
	s.student_name,
	sub.subject_name,
	g.grade

FROM
	 students s 
	 
JOIN groups gr
    ON
	 gr.id = s.group_id

JOIN grades g
    ON g.student_id = s.id
    
JOIN subjects sub
    ON sub.id = g.subject_id


WHERE gr.id = 1  AND sub.id = 2