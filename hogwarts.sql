CREATE TABLE houses (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    colors VARCHAR(100) NOT NULL,
    founder VARCHAR(100) NOT NULL
);



INSERT INTO houses (name, colors, founder)
VALUES
    ('Gryffindor', 'Red and Gold', 'Godric Gryffindor'),
    ('Slytherin', 'Green and Silver', 'Salazar Slytherin'),
    ('Ravenclaw', 'Blue and Bronze', 'Rowena Ravenclaw'),
    ('Hufflepuff', 'Yellow and Black', 'Helga Hufflepuff');


SELECT * FROM houses;


CREATE TABLE teachers (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    house_id INTEGER NOT NULL REFERENCES houses(id)
);



CREATE TABLE students (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    year INTEGER NOT NULL,
    house_id INTEGER NOT NULL REFERENCES houses(id)
);


CREATE TABLE courses (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    teacher_id INTEGER NOT NULL REFERENCES teachers(id)
);



CREATE TABLE course_students (
    course_id INTEGER NOT NULL
        REFERENCES courses(id)
        ON DELETE CASCADE,

    student_id INTEGER NOT NULL
        REFERENCES students(id)
        ON DELETE CASCADE,

    PRIMARY KEY (course_id, student_id)
);

INSERT INTO teachers (name, house_id)
VALUES
    ('Minerva McGonagall', 1),
    ('Severus Snape', 2),
    ('Filius Flitwick', 3),
    ('Pomona Sprout', 4);

SELECT * FROM teachers;

INSERT INTO students (name, year, house_id)
VALUES
    ('Harry Potter', 1, 1),
    ('Hermione Granger', 1, 1),
    ('Ron Weasley', 1, 1),
    ('Draco Malfoy', 1, 2),
    ('Luna Lovegood', 2, 3),
    ('Cedric Diggory', 3, 4);

SELECT * FROM students;

INSERT INTO courses (name, teacher_id)
VALUES
    ('Transfiguration', 1),
    ('Potions', 2),
    ('Charms', 3),
    ('Herbology', 4);

SELECT * FROM courses;

INSERT INTO course_students (course_id, student_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 4),
    (3, 2),
    (3, 5),
    (4, 6);

SELECT
    students.name AS student,
    courses.name AS course
FROM course_students
JOIN students ON course_students.student_id = students.id
JOIN courses ON course_students.course_id = courses.id
ORDER BY students.name;


SELECT
    students.id,
    students.name AS student,
    students.year,
    houses.name AS house
FROM students
JOIN houses ON students.house_id = houses.id
ORDER BY students.id;


SELECT
    courses.name AS course,
    teachers.name AS teacher
FROM courses
JOIN teachers ON courses.teacher_id = teachers.id
ORDER BY courses.id;

select * from courses
