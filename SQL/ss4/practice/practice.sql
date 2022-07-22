use quanlysinhvien;

select address, count(studentid) as 'so luong hoc vien'
from student 
group by address;


-- Tính điểm trung bình các môn học của mỗi học viên
select s.studentid, s.studentname, avg(mark)
from student s
	join mark m on s.studentid = m.studentid
group by s.studentid, s.studentname
	having avg(mark) > 15;
    
-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
select s.studentid, s.studentname, avg(mark)
from student s
	join mark m on s.studentid = m.studentid
group by s.studentid, s.studentname
    having avg(mark) >= all (
		select avg(mark) 
		from mark 
        group by mark.studentid);
        










