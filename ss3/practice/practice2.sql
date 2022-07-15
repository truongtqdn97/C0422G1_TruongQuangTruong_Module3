use quanlysinhvien;

SELECT 
    *
FROM
    student;

SELECT 
    *
FROM
    student
WHERE
    `status` = TRUE;

-- Hiển thị danh sách các môn học có thời gian học nhỏ hơn 10 giờ.
SELECT 
    *
FROM
    `subject`
WHERE
    credit < 10;
SELECT s.studentid, s.studentname, c.classname
FROM student s JOIN class c ON s.classid = c.classid
WHERE c.classname = 'A1';

-- Hiển thị điểm môn CF của các học viên.
SELECT s.studentid, s.studentname, sub.subname, m.mark
FROM student s 
	JOIN mark m ON s.studentid = m.studentid
	JOIN `subject` sub ON m.subid = sub.subid
WHERE sub.subname = 'CF';


