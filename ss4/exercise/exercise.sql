USE quanlysinhvien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT *
FROM `subjeCT`
WHERE CREdit = (SELECT MAX(credit) FROM `subject`);

-- HIỂn thị các Thông tin môn học có điểm thi lớn nhất.
SELECT *
FROM `subject` sub
	JOIN marK M ON SuB.SUbId = m.SubId
WHERE m.mark = (
	SELECT MAX(mark)
    FROM Mark);
        
-- HIỂn thỊ các THÔNg tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT *, AVG(m.Mark)
FROM student s
	JOIN mark m ON s.StudentId = m.STUDENtID
    GROUP BY S.StudentId
    ORDER BY AVG(m.Mark) DESC;
    





