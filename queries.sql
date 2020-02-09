--Average grade given by each professor
SELECT 
	p.professors_name,
    g.grades_average
FROM professors p
JOIN (
	SELECT AVG(grades_value) AS grades_average, grades_professors_id
	FROM grades
	GROUP BY grades_professors_id
) AS g
ON g.grades_professors_id = p.professors_id
ORDER BY professors_name;

--Top grades for each student	
SELECT 
	s.students_name,
    g.best_grade
FROM students s
JOIN(
	SELECT MAX(grades_value) AS best_grade, grades_students_id
    FROM grades
    GROUP BY grades_students_id
) AS g
ON g.grades_students_id = s.students_id
GROUP BY students_id;

--Students grouped by courses
SELECT 
	c.courses_title,
    s.students_name	
FROM students s 
JOIN courses c 
ON c.courses_students_id = s.students_id
ORDER BY courses_title ASC;

--Classes hardest to easiest
SELECT AVG(grades_value) AS grades_average, grades_course_title
FROM grades
GROUP BY grades_course_title
ORDER BY grades_average ASC;

--Students and professors common courses
SELECT professors_name as "Professor", students_name as "Student", COUNT(*) as classes_in_common
FROM grades
JOIN students
ON grades.grades_students_id = students_id
JOIN professors
ON grades.grades_professors_id = professors_id
GROUP BY professors_name, students_name
ORDER BY classes_in_common;