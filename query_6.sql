SELECT
     s.student_name

FROM
	 students s 
	 
JOIN groups gr
    ON
	 gr.id = s.group_id

WHERE gr.id = 1
