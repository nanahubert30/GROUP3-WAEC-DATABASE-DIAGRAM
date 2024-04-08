
--RDMS DIAGAM FOR WAEC DATABASE

-- Create Students table
CREATE TABLE Student (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255) NULL, 
    date_of_birth DATE NULL,
    gender ENUM('Male', 'Female'), 
    address VARCHAR(255), 
    school_id INT, 
    FOREIGN KEY (school_id) REFERENCES Schools (school_id) -- Added comma here
);

-- Create Schools table
CREATE TABLE Schools (
    school_id INT PRIMARY KEY, 
    school_name VARCHAR(100), 
    location VARCHAR(255)
);

-- Create Subjects table
CREATE TABLE Subjects (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(100)
);

-- Create Exams table
CREATE TABLE Exams (
    exam_id INT PRIMARY KEY,
    exam_name VARCHAR(100),
    exam_date DATE,
    subject_id INT, 
    duration TIME, 
    total_marks INT, 
    FOREIGN KEY (subject_id) REFERENCES Subjects (subject_id)
);
-- Create ExamResults table
CREATE TABLE ExamResults (
    result_id INT PRIMARY KEY, 
    student_id INT, 
    exam_id INT, 
    marks_obtained INT,
    FOREIGN KEY (student_id) REFERENCES Students (id),
    FOREIGN KEY (exam_id) REFERENCES Exams (exam_id)
);

-- Create Teachers table
CREATE TABLE Teachers (
    teacher_id INT PRIMARY KEY, 
    teacher_name VARCHAR(100), 
    subject_id INT,
    FOREIGN KEY (subject_id) REFERENCES Subjects (subject_id)
);
-- Create Administrators table
CREATE TABLE Administrators (
    admin_id INT PRIMARY KEY,
    admin_name VARCHAR(100),
    role VARCHAR(100)
);

-- Inserting data into Schools table
INSERT INTO
    Schools (
        school_id, school_name, location
    )
VALUES (
        1, 'Example High School', 'City A'
    ) (
        2, 'Sample Secondary School', 'City B'
    );

-- Inserting data into Subjects table
INSERT INTO
    Subjects (subject_id, subject_name)
VALUES (1, 'Mathematics'),
    (2, 'English'),
    (3, 'Science');

-- Inserting data into Students table
INSERT INTO
    Student (
        id, full_name, data_to_birth, gender, school_id
    )
VALUES (
        1, 'John Doe', '2005-05-10', 'Male', '123 Main St, City A', 1
    ),
    (
        2, 'Jane Smith', '2006-08-15', 'Female', '456 Elm St, City B', 2
    );

-- Inserting data into Exams table
INSERT INTO
    Exams (
        exam_id, exam_name, exam_date, subject_id, duration, total_marks
    )
VALUES (
        1, 'Math Exam 1', '2024-05-20', 1, '02:00:00', 100
    ),
    (
        2, 'English Exam 1', '2024-05-21', 2, '01:30:00', 80
    ),
    (
        3, 'Science Exam 1', '2024-05-22', 3, '01:45:00', 90
    );

-- Inserting data into ExamResults table
INSERT INTO
    ExamResults (
        result_id, student_id, exam_id, marks_obtained
    )
VALUES (1, 1, 1, 85),
    (2, 1, 2, 75),
    (3, 2, 1, 90),
    (4, 2, 2, 80),
    (5, 1, 3, 88),
    (6, 2, 3, 92);

-- Inserting data into Teachers table
INSERT INTO
    Teachers (
        teacher_id, teacher_name, subject_id
    )
VALUES (1, 'Mr. Brown', 1),
    (2, 'Ms. Johnson', 2),
    (3, 'Dr. White', 3);
-- Inserting data into Administrators table
INSERT INTO
    Administrators (admin_id, admin_name, role)
VALUES (1, 'Admin1', 'Principal'),
    (2, 'Admin2', 'Vice Principal');

-- Selecting all students and their school
SELECT s.full_name, s.date_of_birth, s.gender, s.address, sc.school_name
FROM Student s
    JOIN Schools sc ON s.school_id = sc.school_id;

-- Selecting exam results for a specific student
SELECT s.full_name, e.exam_name, er.marks_obtained
FROM
    ExamResults er
    JOIN Student s ON er.student_id = s.student_id
    JOIN Exams e ON er.exam_id = e.exam_id
WHERE
    s.full_name = 'John Doe';

-- Selecting all teachers and the subjects they teach
SELECT t.teacher_name, sub.subject_name
FROM Teachers t
    JOIN Subjects sub ON t.subject_id = sub.subject_id;

-- Selecting all exams and their subjects
SELECT e.exam_name, sub.subject_name
FROM Exams e
    JOIN Subjects sub ON e.subject_id = sub.subject_id;


--GROUP3 NAMES

/*Takyi Hubert: 052241360040
Owusu Benjamin Pinamang: 052241360137
Pavarotti Owusu Antwi: 052241360140
Derrick Antwi-Agyei: 052341360197
Morrison Isaac Kofi: 052241360136
Amankwaa Mordecai: 052241360156
Emmanuel Gyasi Yeboah: 052241360133
Derrick Antwi-Agyei: 052341360197
Baah Elijah Amponsem: 052241360160
Obbo Cleopas Kwame: 052241360117
Opoku Tutu Pascal: 052241360108
Nehemiah Kwame Afriyie Frimpong: 052241360141
Offei-Ntow Emmanuel: 052241360115
Adzaby Solomon Atsu: 052341360028
Charles Nana osei: 052241360134*/

