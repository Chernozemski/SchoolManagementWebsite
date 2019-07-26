# SchoolManagementWebsite
Management website made using ASP.NET Web Forms. The site is meant to be used by cyrillic speaking users.

The site has many pages for adding,removing and updating different aspects of the school system. In order to do all those actions you need to be logged in, depending on your rank in the system you will be able to do different actions.

SQL Queries description :
1-Add database to the server - Creates the database that is used to store all of the tables + procedures + views.
2-Add tables - Adding all of the needed tables for operation.
3-Create store procedures and views - Creates all of the actions that are used for access to the database, it is uncommon to directly add/update or view tables from direct actions, only through stored procedures or views, on the other hand almost all delete actions are direct.
4-Add Dummy Data - Adding sample data to the tables.

The first step in order to get the site working is to execute all of the SQL queries.
The second step is to insert a teacher record in the database. If you have used the 4-th query that is provided in the folder, then there will be an account that is named "director" and the password for it will be "123".
When the first record is inserted in the database, and the record has the rank of the director (rank 1). From that point there is no need for further access on the database using SQL Management Studio, all can be done using the webiste.

Teacher can view certain information, grade students, mark absent students, enter lesson names and discription, give out lessons from missing teacher as substitute. If the teacher is assigned to a class he/she will be able to see student's information as well as remove student absence on previous dates based on medical papers (if the teacher is assigned to this class).

The assistant director account is able to view most tables, but without adding, removing or updating them.

The director as the authority to make CRUD operations on all tables, but if the director has a class, then he will be only able to remove/update only on his class.
