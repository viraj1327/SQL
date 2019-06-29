Create database Final;
Use final;
CREATE TABLE student(
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
email VARCHAR(60) NULL,
street VARCHAR(50) NOT NULL,
city VARCHAR(40) NOT NULL,
state CHAR(2) NOT NULL DEFAULT "PA",
zip MEDIUMINT UNSIGNED NOT NULL,
phone VARCHAR(20) NOT NULL,
birth_date DATE NOT NULL,
sex ENUM('M', 'F') NOT NULL,
date_entered TIMESTAMP,
lunch_cost FLOAT NULL,
student_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
);

/* Inserting values*/
INSERT INTO student VALUES('Dale', 'Cooper', 'dcooper@aol.com',
    '123 Main St', 'Yakima', 'WA', 98901, '792-223-8901', "1959-2-22",
    'M', NOW(), 3.50, NULL);

INSERT INTO student VALUES('Harry', 'Truman', 'htruman@aol.com',
    '202 South St', 'Vancouver', 'WA', 98660, '792-223-9810', "1946-1-24",
    'M', NOW(), 3.50, NULL);

    INSERT INTO student VALUES('Shelly', 'Johnson', 'sjohnson@aol.com',
    '9 Pond Rd', 'Sparks', 'NV', 89431, '792-223-6734', "1970-12-12",
    'F', NOW(), 3.50, NULL);

    INSERT INTO student VALUES('Bobby', 'Briggs', 'bbriggs@aol.com',
    '14 12th St', 'San Diego', 'CA', 92101, '792-223-6178', "1967-5-24",
    'M', NOW(), 3.50, NULL);

    INSERT INTO student VALUES('Donna', 'Hayward', 'dhayward@aol.com',
    '120 16th St', 'Davenport', 'IA', 52801, '792-223-2001', "1970-3-24",
    'F', NOW(), 3.50, NULL);

    INSERT INTO student VALUES('Audrey', 'Horne', 'ahorne@aol.com',
    '342 19th St', 'Detroit', 'MI', 48222, '792-223-2001', "1965-2-1",
    'F', NOW(), 3.50, NULL);

    INSERT INTO student VALUES('James', 'Hurley', 'jhurley@aol.com',
    '2578 Cliff St', 'Queens', 'NY', 11427, '792-223-1890', "1967-1-2",
    'M', NOW(), 3.50, NULL);

    INSERT INTO student VALUES('Lucy', 'Moran', 'lmoran@aol.com',
    '178 Dover St', 'Hollywood', 'CA', 90078, '792-223-9678', "1954-11-27",
    'F', NOW(), 3.50, NULL);

    INSERT INTO student VALUES('Tommy', 'Hill', 'thill@aol.com',
    '672 High Plains', 'Tucson', 'AZ', 85701, '792-223-1115', "1951-12-21",
    'M', NOW(), 3.50, NULL);

    INSERT INTO student VALUES('Andy', 'Brennan', 'abrennan@aol.com',
    '281 4th St', 'Jacksonville', 'NC', 28540, '792-223-8902', "1960-12-27",
    'M', NOW(), 3.50, NULL);

SELECT * FROM student;


/* CLASS TABLE*/
Use final;
CREATE TABLE class(
    name VARCHAR(30) NOT NULL,
    class_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY);

INSERT INTO class VALUES
('English', NULL), ('Speech', NULL), ('Literature', NULL),
('Algebra', NULL), ('Geometry', NULL), ('Trigonometry', NULL),
('Calculus', NULL), ('Earth Science', NULL), ('Biology', NULL),
('Chemistry', NULL), ('Physics', NULL), ('History', NULL),
('Art', NULL), ('Gym', NULL);

select * from class;


/* TEST TABLE*/
CREATE TABLE test(
    date DATE NOT NULL,
    type ENUM('T', 'Q') NOT NULL,
    class_id INT UNSIGNED NOT NULL,
    test_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY);


INSERT INTO test VALUES
    ('2014-8-25', 'Q', '15', '55'),
    ('2014-8-27', 'Q', '15', '63'),
    ('2014-8-29', 'T', '30', '77'),
    ('2014-8-29', 'T', '30', '82'),
    ('2014-8-27', 'Q', '15', '94'),
    ('2014-8-29', 'T', '30', '49');

select * from test;


/*SCORE TABLE*/
CREATE TABLE score(
    student_id INT UNSIGNED NOT NULL,
    event_id INT UNSIGNED NOT NULL,
    score INT NOT NULL,
    PRIMARY KEY(event_id, student_id));

INSERT INTO score VALUES
    ('1', '1', '15'),
    ('1', '2', '14'),
    ('1', '3', '28'),
    ('1', '4', '29'),
    ('1', '5', '15'),
    ('1', '6', '27'),
    ('2', '1', '15'),
    ('2', '2', '14'),
    ('2', '3', '26'),
    ('2', '4', '28');

Select * from score;

  # Absence TABLE
CREATE TABLE absence(
student_id INT UNSIGNED NOT NULL,
date_1 DATE NOT NULL,
PRIMARY KEY(student_id, date_1));

INSERT INTO absence VALUES
    ('6', '2014-08-29'),
    ('7', '2014-08-29'),
    ('8', '2014-08-27');

select * from absence;

# CLASS LAB 3

#RENAME TABLEs    absence to absences    class to classes    score to scores    student to students    test to tests;

RENAME TABLE
    absence to absences,
    class to classes,
    score to scores,
    student to students,
    test to tests;

#Show every student born in the state of Washington
SELECT first_name, last_name, state
    FROM students
    WHERE state="WA";

#Show students born after a date
SELECT first_name, last_name, birth_date
    FROM students
    WHERE YEAR(birth_date) >= '1965';

#Show students born after a date and born in a specific state
SELECT first_name, last_name, birth_date
    FROM students
    WHERE MONTH(birth_date) = 2 OR state="CA";

#Show students born after a date or born in a specific state
SELECT last_name, state, birth_date
    FROM students
    WHERE DAY(birth_date) >= 12 && (state="CA" || state="NV");

#Check for any students who dont  have a last name in the database
SELECT last_name
    FROM students
    WHERE last_name IS NULL;
    SELECT last_name
    FROM students
    WHERE last_name IS NOT NULL;


#Show all the students in your database in alphabetical order by last name and reverse alphabetical order by first name
SELECT first_name, last_name
    FROM students
    ORDER BY last_name;



#RENAME TABLEs    absences to absence    classes to class    scores to score    students to student    tests to test;

RENAME TABLE
    absences to absence,
    classes to class,
    scores to score,
    students to student,
    tests to test;



Select first_name, last_name from student
where birth_date between '1945-12-10' and '1960-12-10';

select birth_date as DOB
from student;

select absence.date_1, score.event_id
from absence
left join score on score.student_id = absence.student_id;

Select * from student;
