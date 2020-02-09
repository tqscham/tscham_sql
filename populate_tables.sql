--populate students
INSERT INTO students(students_name, students_email)
VALUE ('Student1', 'student1@test.email')

--populate professors
INSERT INTO professors(professors_name, professors_email)
VALUE ('Professor1', 'professor1@test.email')

--populate courses
INSERT INTO courses(courses_title, courses_students_id, courses_professors_id)
VALUE ('Math', 1, 3)

--populate grades
INSERT INTO grades(grades_value, grades_students_id, grades_professors_id, grades_courses_title)
VALUE (RAND()*100, 4, 2, 'English')