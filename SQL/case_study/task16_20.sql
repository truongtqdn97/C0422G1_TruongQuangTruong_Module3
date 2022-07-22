use case_study;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
select *
from nhan_vien;

set sql_safe_updates = 0;
delete from nhan_vien
	where ma_nhan_vien in (
		select tmp.ma_nhan_vien from (
			select nv.ma_nhan_vien
			from nhan_vien nv
				left join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
			where hd.ma_hop_dong is null)as tmp);
set sql_safe_updates = 1;


-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 1.000.000 VNĐ.
set sql_safe_updates = 0;
update khach_hang 
	set khach_hang.ma_loai_khach = (select temp.ma_loai_khach from(
		select ma_loai_khach
        from loai_khach
        where ten_loai_khach = "Diamond") as temp)
	where ma_khach_hang in (select temp1.ma_khach_hang from (
			select kh.ma_khach_hang, kh.ma_loai_khach
			from khach_hang kh 
				join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
				where lk.ten_loai_khach = "Platinium") as temp1)
		and ma_khach_hang in (select temp2.ma_khach_hang from (
			select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, 
				hd.ma_hop_dong, dv.ten_dich_vu, 
				hd.ngay_lam_hop_dong,
                hd.ngay_ket_thuc, 
				dvdk.ten_dich_vu_di_kem, 
                (ifnull(dv.chi_phi_thue, 0) + ifnull(hdct.so_luong, 0) * ifnull(dvdk.gia, 0)) as tong_tien
			from khach_hang kh
				left join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
				left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
				left join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
				left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
				left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
				where year(hd.ngay_lam_hop_dong) = 2021
				having tong_tien > 1000000
				order by kh.ma_khach_hang) as temp2); 
set sql_safe_updates = 1;

select *
from khach_hang;

-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
set sql_safe_updates = 0;
set foreign_key_checks=0;
delete from khach_hang
	where ma_khach_hang in (
		select temp.ma_khach_hang
        from (
			select hd.ma_khach_hang
			from hop_dong hd
			where year(hd.ngay_lam_hop_dong) < 2021) as temp);
set foreign_key_checks=1;
set sql_safe_updates = 1;

select *
from khach_hang;

-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
set sql_safe_updates = 0;
update dich_vu_di_kem
	set gia = gia * 2
    where ma_dich_vu_di_kem in (
		select tmp.ma_dich_vu_di_kem
        from (
			select hdct.ma_dich_vu_di_kem, sum(hdct.so_luong) as soluong
			from hop_dong_chi_tiet hdct
				join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
				where year(hd.ngay_lam_hop_dong) = 2020
				group by hdct.ma_dich_vu_di_kem
				having sum(hdct.so_luong) >=10)as tmp);
set sql_safe_updates = 1;


-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, 
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select ma_nhan_vien as id,
	ho_ten,
    email,
    so_dien_thoai,
    ngay_sinh,
    dia_chi
from nhan_vien
union all
select ma_khach_hang as id,
	ho_ten,
    email,
    so_dien_thoai,
    ngay_sinh,
    dia_chi
from khach_hang
order by id;















