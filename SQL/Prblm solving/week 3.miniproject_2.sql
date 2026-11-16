-- Project 2: Build a Student Management Dashboard using SQL: Average scores, top performers, pass/fail stats.

CREATE DATABASE StudentManagementDB;
GO;

USE StudentManagementDB;
GO;

-- creating tables

CREATE TABLE Students
(
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL,
    Gender VARCHAR(10),
    Department VARCHAR(50),
    YearOfStudy INT
);

CREATE TABLE Subjects
(
    SubjectID INT PRIMARY KEY,
    SubjectName VARCHAR(100) NOT NULL
);

CREATE TABLE Marks
(
    MarkID INT PRIMARY KEY,
    StudentID INT,
    SubjectID INT,
    Score INT,
    
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID)
);

-- Inserting values

INSERT INTO Students
(StudentID, StudentName, Gender, Department, YearOfStudy)
VALUES
(1, 'Rahul', 'Male', 'CSE', 3),
(2, 'Priya', 'Female', 'CSE', 3),
(3, 'Ananya', 'Female', 'ECE', 2),
(4, 'Arjun', 'Male', 'CSE', 4),
(5, 'Sneha', 'Female', 'IT', 3),
(6, 'Kiran', 'Male', 'ECE', 2),
(7, 'Divya', 'Female', 'IT', 4),
(8, 'Rohit', 'Male', 'CSE', 3),
(9, 'Meera', 'Female', 'ECE', 3),
(10, 'Vikram', 'Male', 'IT', 4);

INSERT INTO Subjects
(SubjectID, SubjectName)
VALUES
    (101, 'Python'),
    (102, 'SQL'),
    (103, 'Data Structures'),
    (104, 'Mathematics'),
    (105, 'DBMS');

INSERT INTO Marks
(MarkID, StudentID, SubjectID, Score)
VALUES
(1, 1, 101, 85),
(2, 1, 102, 78),
(3, 1, 103, 91),
(4, 1, 104, 74),
(5, 1, 105, 88),

(6, 2, 101, 92),
(7, 2, 102, 89),
(8, 2, 103, 95),
(9, 2, 104, 90),
(10, 2, 105, 94),

(11, 3, 101, 76),
(12, 3, 102, 81),
(13, 3, 103, 79),
(14, 3, 104, 72),
(15, 3, 105, 85),

(16, 4, 101, 88),
(17, 4, 102, 91),
(18, 4, 103, 84),
(19, 4, 104, 86),
(20, 4, 105, 90),

(21, 5, 101, 79),
(22, 5, 102, 85),
(23, 5, 103, 82),
(24, 5, 104, 77),
(25, 5, 105, 80),

(26, 6, 101, 68),
(27, 6, 102, 74),
(28, 6, 103, 71),
(29, 6, 104, 65),
(30, 6, 105, 73),

(31, 7, 101, 90),
(32, 7, 102, 94),
(33, 7, 103, 92),
(34, 7, 104, 88),
(35, 7, 105, 95),

(36, 8, 101, 55),
(37, 8, 102, 62),
(38, 8, 103, 58),
(39, 8, 104, 64),
(40, 8, 105, 60),

(41, 9, 101, 83),
(42, 9, 102, 79),
(43, 9, 103, 87),
(44, 9, 104, 81),
(45, 9, 105, 85),

(46, 10, 101, 72),
(47, 10, 102, 69),
(48, 10, 103, 75),
(49, 10, 104, 70),
(50, 10, 105, 78);

-- Joining  tables

SELECT
    s.StudentID,
    s.StudentName,
    s.Department,
    sub.SubjectName,
    m.Score
FROM Students s
JOIN Marks m
    ON s.StudentID = m.StudentID
JOIN Subjects sub
    ON m.SubjectID = sub.SubjectID;

-- avg score of each student
SELECT
    s.StudentID,
    s.StudentName,
    s.Department,
    AVG(m.Score) AS AverageScore
FROM Students s
JOIN Marks m
    ON s.StudentID = m.StudentID
GROUP BY
    s.StudentID,
    s.StudentName,
    s.Department
ORDER BY AverageScore DESC;

-- top performers
SELECT
    s.StudentID,
    s.StudentName,
    s.Department,
    AVG(m.Score) AS AverageScore,
    RANK() OVER (
        ORDER BY AVG(m.Score) DESC
    ) AS StudentRank
FROM Students s
JOIN Marks m
    ON s.StudentID = m.StudentID
GROUP BY
    s.StudentID,
    s.StudentName,
    s.Department;

-- pass/fail status

SELECT
    s.StudentName,
    sub.SubjectName,
    m.Score,
    CASE
        WHEN m.Score >= 50 THEN 'Pass'
        ELSE 'Fail'
    END AS Result
FROM Students s
JOIN Marks m
    ON s.StudentID = m.StudentID
JOIN Subjects sub
    ON m.SubjectID = sub.SubjectID;

-- overall pass/fail statistics

WITH StudentResults AS
(
    SELECT
        s.StudentID,
        s.StudentName,
        MIN(m.Score) AS LowestScore,
        AVG(m.Score) AS AverageScore
    FROM Students s
    JOIN Marks m
        ON s.StudentID = m.StudentID
    GROUP BY
        s.StudentID,
        s.StudentName
)
SELECT
    StudentID,
    StudentName,
    AverageScore,
    LowestScore,
    CASE
        WHEN LowestScore >= 50 THEN 'Pass'
        ELSE 'Fail'
    END AS FinalResult
FROM StudentResults;

-- pass/fail count
WITH StudentResults AS
(
    SELECT
        s.StudentID,
        s.StudentName,
        MIN(m.Score) AS LowestScore
    FROM Students s
    JOIN Marks m
        ON s.StudentID = m.StudentID
    GROUP BY
        s.StudentID,
        s.StudentName
)
SELECT
    SUM(CASE WHEN LowestScore >= 50 THEN 1 ELSE 0 END) AS PassCount,
    SUM(CASE WHEN LowestScore < 50 THEN 1 ELSE 0 END) AS FailCount
FROM StudentResults;

-- pass percentage
WITH StudentResults AS
(
    SELECT
        s.StudentID,
        MIN(m.Score) AS LowestScore
    FROM Students s
    JOIN Marks m
        ON s.StudentID = m.StudentID
    GROUP BY s.StudentID
)
SELECT
    COUNT(*) AS TotalStudents,

    SUM(
        CASE
            WHEN LowestScore >= 50 THEN 1
            ELSE 0
        END
    ) AS PassedStudents,

    SUM(
        CASE
            WHEN LowestScore < 50 THEN 1
            ELSE 0
        END
    ) AS FailedStudents,

    CAST(
        100.0 *
        SUM(
            CASE
                WHEN LowestScore >= 50 THEN 1
                ELSE 0
            END
        ) / COUNT(*)
        AS DECIMAL(5,2)
    ) AS PassPercentage

FROM StudentResults;

-- subject  wise avg score
SELECT
    sub.SubjectName,
    AVG(m.Score) AS AverageScore,
    MAX(m.Score) AS HighestScore,
    MIN(m.Score) AS LowestScore
FROM Marks m
JOIN Subjects sub
    ON m.SubjectID = sub.SubjectID
GROUP BY
    sub.SubjectName
ORDER BY AverageScore DESC;

-- Department wise performance
SELECT
    s.Department,
    COUNT(DISTINCT s.StudentID) AS TotalStudents,
    AVG(m.Score) AS AverageScore
FROM Students s
JOIN Marks m
    ON s.StudentID = m.StudentID
GROUP BY
    s.Department
ORDER BY AverageScore DESC;

-- Highest scorer in each subject
WITH SubjectScores AS
(
    SELECT
        sub.SubjectName,
        s.StudentName,
        m.Score,
        RANK() OVER
        (
            PARTITION BY sub.SubjectID
            ORDER BY m.Score DESC
        ) AS SubjectRank
    FROM Marks m
    JOIN Students s
        ON m.StudentID = s.StudentID
    JOIN Subjects sub
        ON m.SubjectID = sub.SubjectID
)
SELECT
    SubjectName,
    StudentName,
    Score,
    SubjectRank
FROM SubjectScores
WHERE SubjectRank = 1;

-- Complete student management analysis query

WITH StudentPerformance AS
(
    SELECT
        s.StudentID,
        s.StudentName,
        s.Gender,
        s.Department,
        s.YearOfStudy,

        AVG(m.Score) AS AverageScore,
        MIN(m.Score) AS LowestScore,
        MAX(m.Score) AS HighestScore,

        COUNT(m.SubjectID) AS SubjectsAttempted,

        CASE
            WHEN MIN(m.Score) >= 50 THEN 'Pass'
            ELSE 'Fail'
        END AS FinalResult

    FROM Students s
    JOIN Marks m
        ON s.StudentID = m.StudentID

    GROUP BY
        s.StudentID,
        s.StudentName,
        s.Gender,
        s.Department,
        s.YearOfStudy
),

RankedStudents AS
(
    SELECT
        *,
        RANK() OVER
        (
            ORDER BY AverageScore DESC
        ) AS StudentRank
    FROM StudentPerformance
)

SELECT
    StudentID,
    StudentName,
    Gender,
    Department,
    YearOfStudy,
    SubjectsAttempted,
    AverageScore,
    HighestScore,
    LowestScore,
    FinalResult,
    StudentRank
FROM RankedStudents
ORDER BY StudentRank;