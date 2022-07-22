use case_study;


-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K”
--  và có tối đa 15 kí tự.
select *
from nhan_vien
where ho_ten regexp "^[HTK]" 
	and char_length(ho_ten) <= 15;

-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select *
from khach_hang
where timestampdiff(year, ngay_sinh, curdate()) between 18 and 50
	-- and (dia_chi like "%Đà Nẵng" or dia_chi like "%Quảng Trị");
    and dia_chi regexp "[(Đà Nẵng)(Quảng Trị)]$";

-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select kh.ma_khach_hang, kh.ho_ten, count(kh.ma_khach_hang) as so_lan_thue
from khach_hang kh
	join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
    join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
where lk.ten_loai_khach = "Diamond"
    group by kh.ma_khach_hang
    order by count(kh.ma_khach_hang);

-- 5.Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: 
-- Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
-- cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, 
	hd.ma_hop_dong, dv.ten_dich_vu, 
	hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, 
    dvdk.ten_dich_vu_di_kem, ( ifnull(dv.chi_phi_thue, 0) + ifnull(hdct.so_luong, 0) * ifnull(dvdk.gia, 0)) as tong_tien
from khach_hang kh
	left join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
    left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
    left join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
    left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
    left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
    order by kh.ma_khach_hang;



