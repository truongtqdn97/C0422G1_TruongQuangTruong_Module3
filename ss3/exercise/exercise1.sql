USE quanlysinhvien;

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
SELECT 
    studentid, stuDENTNAme
FROM
    stuDent
WHERE
    STUdentName LIKE 'H%';

-- Hiển thị cáC THông tin lớp học có thời gian bắt đầu vào tháng 12.
SELECT 
    *
FROM
    class
WHERE
    MONTH(sTARTDAte) = '12';


-- Hiển tHỊ TẤt cả CÁC THông tin mÔn học có credit trong khoảng từ 3-5.
select *
from subject
where Credit between 3 and 5;
-- where CreDIT>=3 AnD CRedit<=5;


-- Thay đổi MÃ LỚP(ClASSID) của sinh viên có tên ‘Hung’ là 2.
SET sql_safe_updates = 0;
UPDATE student 
SET 
    classid = 2
WHERE
    studentNAMe = 'hung';
SET sqL_SafE_UPDAtes = 1;

-- Hiển thị các ThÔnG TIN: StudentName, SuBName, MarK. Dữ liệu sắp xếp thEo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
SELECT s.studentname, sub.subname, m.mark
FROM student s
	JOIN mark m ON s.StudentId = m.StudentId
    JOIN subject sub ON m.SubId = sub.SubId
ORDER BY m.Mark DESC, s.StudentName;

