# SchoolManagementWebsite
--WORK IN PROGRESS--Management website made using ASP.NET Web Forms. The site and the queries are meant to be used by cyrillic speaking users.

The site has a home page, enter page, register account page, register teacher record page. The teacher record page can be accessed only by authenticated users (logged in).

SQL Queries description :
1-Add database to the server
2-Add tables + populate dummy data
3-Create store procedures + views for getting and setting values.

In order to register account you need to know one of the teacher's "EGN", the data about the teachers is contained in "tblTeacherInfo".
There is separation between director and teacher. They have different functions. 

The director has the authority to make CRUD operations about the teachers, classes, subjects, students.

Teacher can view certain information, grade students, mark absent students, enter lesson names and discription, give out lessons from missing teacher as substitute. If the teacher is assigned to a class he/she will be able to see student's information as well as remove student absence on previous dates based on medical papers. The teacher can also send warnings about students based on how much they're absent from the lessons and/or if they don't provide medical papers to back up their absence.
