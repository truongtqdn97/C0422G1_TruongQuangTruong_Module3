use quanlysinhvien;

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select 
    studentid, studentname
from
    student
where
	studentname LIKE 'H%';

-- Hiển thị cáC THông tin lớp học có thời gian bắt đầu vào tháng 12.
select 
    *
from
    class
where
    month(startdate) = '12';


-- Hiển tHỊ TẤt cả CÁC THông tin mÔn học có credit trong khoảng từ 3-5.
select *
from `subject`
where Credit between 3 and 5;
-- where CreDIT>=3 and CRedit<=5;


-- Thay đổi MÃ LỚP(ClASSID) của sinh viên có tên ‘Hung’ là 2.
set sql_safe_updates = 0;
update student 
set 
    classid = 2
where
    studentname = 'hung';
set sqL_Safe_updates = 1;

-- Hiển thị các ThÔnG TIN: StudentName, SuBName, MarK. Dữ liệu sắp xếp thEo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select s.studentname, sub.subname, m.mark
from student s
	join mark m on s.StudentId = m.StudentId
    join `subject` sub on m.SubId = sub.SubId
order by m.Mark desc, s.StudentName;

