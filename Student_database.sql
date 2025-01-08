create database StudentDatabase;
use StudentDatabase;

CREATE TABLE Students (
    Student_ID INT PRIMARY KEY NOT NULL,
    FullName VARCHAR(100),
    DateOfBirth DATE NOT NULL,
    Gender varchar(5) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Contact_NO VARCHAR(15)
);

insert into Students(Student_ID,FullName,DateOfBirth, Gender,Email, Contact_NO)
values(1,"Alice Johnson", '2001-05-15', "Male", "alice.johnson@gmail.com", 7687678767),
(2,"Praveen Kumar", '2001-04-13', "Male", "praveenkumar@gmail.com", 7663452898),
(3,"Arun Kumar", '2001-03-15', "Male", "arunkumar@gmail.com", 9817243456),
(4,"Vasnth Kumar", '2001-02-10', "Male", "vasanthkumar@gmail.com", 6574563456),
(5,"Sankar", '2001-04-20', "Male", "sankar@gmail.com", 7626458725),
(6,"Ranjith Kumar", '2002-02-15', "Male", "ranjithkumar@gmail.com", 9687678767),
(7,"Charlie Davis", '2002-04-15', "Male", "charliedavis@gmail.com", 9087678767),
(8,"Jack King", '2002-05-12', "Male", "jackking@gmail.com", 7187678767),
(9,"Tommy Sanchez", '2001-01-11', "Male", "tommysanchez@gmail.com", 7987678767),
(10,"Victor Roberts", '2001-01-01', "Male", "victorroberts@gmail.com", 7487678767),
(11,"David Evans", '2001-03-15', "Male", "davidevans@gmail.com", 7687698767),
(12,"Sanjay Yadav", '2001-05-17', "Male", "sanjayyadav@gmail.com", 7687648767),
(13,"Bob Brown", '2001-05-24', "Male", "bobbrown@gmail.com", 7688678767),
(14,"John Doe", '2001-05-26', "Male", "johndoe@gmail.com", 7687670767),
(15,"Jane Smith", '2001-05-30', "Male", "janesmith@gmail.com", 7687478767),
(16,"Hank Lee", '2001-05-29', "Male", "hanklee@gmail.com", 7607678767),
(17,"Ravi Kumar", '2001-03-15', "Male", "ravikumar@gmail.com", 7687678798),
(18,"Eswar Moorthy", '2001-02-19', "Male", "eswarmoorthy@gmail.com", 9677678767),
(19,"Abivarnan", '2001-05-10', "Male", "abivarnan@gmail.com", 9567678767),
(20,"Santhosh Kumar", '2001-05-11', "Male", "santhoshkumar@gmail.com", 9237678767);

CREATE TABLE Classes (
    Class_ID INT PRIMARY KEY,
    ClassName VARCHAR(50) NOT NULL UNIQUE,
    ClassTeacher VARCHAR(100)
);

insert into Classes(Class_ID,ClassName,ClassTeacher)
values(1,"8th Grade","Mr Anderson"),
(2,"9th Grade","Mr Ashok"),
(3,"10th Grade","Mr Praveen"),
(4,"11th Grade","Mr Dinesh"),
(5,"12th Grade","Mr Arun"),
(6,"7th Grade","Mr Aravinth"),
(7,"3rd Grade","Mr Abishek"),
(8,"5th Grade","Mr Ram"),
(9,"4th Grade","Mr Deepak"),
(10,"6th Grade","Mr Vishnu");

create table Courses(
Course_ID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    CourseCode VARCHAR(10) UNIQUE NOT NULL,
    CreditHours INT NOT NULL,
    Class_ID INT NOT NULL,
    FOREIGN KEY (Class_ID) REFERENCES Classes(Class_ID)
);

insert into Courses(Course_ID,CourseName,CourseCode,CreditHours,Class_ID)
values(20,"Mathematics","MH01",5,1),
(21,"Science","SC02",4,2),
(22,"Social Science","SS03",3,3),
(23,"Physics","PH04",6,4),
(24,"Chemistry","CH05",8,5),
(25,"Biology","BG06",6,6),
(26,"Computer science","CS07",12,7),
(27,"Commerce","CM08",3,8),
(28,"Zology","ZG09",9,9),
(29,"Botany","BY10",9,10);

create table Enrollments(
Enrollment_ID INT PRIMARY KEY,
    Student_ID INT NOT NULL,
    Course_ID INT NOT NULL,
    EnrollmentDate DATE NOT NULL,
    FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID)
       ON UPDATE CASCADE,
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);

insert into Enrollments(Enrollment_ID,Student_ID,Course_ID,EnrollmentDate)
values(11,1,20,'2024-01-01'),
(12,2,21,'2024-02-01'),
(13,3,22,'2024-02-02'),
(14,4,23,'2024-03-03'),
(15,5,24,'2024-01-04'),
(16,6,25,'2024-03-05'),
(17,7,26,'2024-01-06'),
(18,8,27,'2024-03-21'),
(19,9,28,'2024-01-22'),
(20,10,29,'2024-02-21'),
(21,11,24,'2024-02-11'),
(22,12,23,'2024-02-21'),
(23,13,26,'2024-01-10'),
(24,14,27,'2024-03-18'),
(25,15,29,'2024-02-14'),
(26,16,21,'2024-03-12'),
(27,17,23,'2024-01-16'),
(28,18,26,'2024-02-19'),
(29,19,28,'2024-02-12'),
(30,20,20,'2024-02-15');

-----------------------------------------------------------------------------------------------------------------------------------------------

select*from Students;
select*from Classes;
select*from Courses;
select*from Enrollments; 

-----------------------------------------------------------------------------------------------------------------------------------------------

DELIMITER //
create procedure Find_Contact_no()
BEGIN
     select Contact_no
     from Students
     where FullName = 'Praveen Kumar';
END;


DELIMETER //
create procedure Find_kumar()
BEGIN
    select FullName, Email
    from Students
    where FullName like '%Kumar%';
END;


DELIMETER //
create procedure Find_enrollmentDate()
BEGIN
     select*from enrollments
     where EnrollmentDate between '2024-01-01' and '2024-02-11';
END;

DELIMETER //
create procedure Student_deparment()
BEGIN
     select S.FullName, S.Email, E.EnrollmentDate
     from Enrollments E
     inner join Students S on E.Student_ID = S.Student_ID
     inner join Courses C on E.Course_ID = C.Course_ID
     where C.CourseName = 'Computer Science';
END;

DELIMETER //
create procedure Student_detials()
BEGIN
     select s.Student_ID,s.FullName,s.Email,c.CourseName,c.CourseCode,e.EnrollmentDate
     from Students s
	 join Enrollments e on s.Student_ID = e.Student_ID
     join Courses c on e.Course_ID = c.Course_ID
     order by s.Student_ID;
END;

-----------------------------------------------------------------------------------------------------------------------------------------------
//Callbyprocedures
CALL Find_Contact_no()
CALL Find_kumar()
CALL Find_enrollmentDate()
CALL Student_department()
CALL Student_detials()




