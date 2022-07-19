use case_study;

-- 6.Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ 
-- chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select dv.ma_dich_vu, 
	dv.ten_dich_vu, 
    dv.dien_tich, 
    dv.chi_phi_thue, 
    ldv.ten_loai_dich_vu
from dich_vu dv
	join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
    join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where not dv.ma_dich_vu in (
	select dv.ma_dich_vu
	from dich_vu dv
		join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
	where month(hd.ngay_lam_hop_dong) in (1,2,3))
group by dv.ma_dich_vu;


-- 7.Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select dv.ma_dich_vu, 
	dv.ten_dich_vu, 
    dv.dien_tich, 
    dv.so_nguoi_toi_da,
    dv.chi_phi_thue, 
    ldv.ten_loai_dich_vu
from dich_vu dv
	join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
    join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where not dv.ma_dich_vu in (
	select dv.ma_dich_vu
	from dich_vu dv
		join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
	where year(hd.ngay_lam_hop_dong) = 2021
	) and (year(hd.ngay_lam_hop_dong) = 2020)
group by dv.ma_dich_vu;

-- 8.Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
-- cach 1
select kh.ho_ten
from khach_hang kh
having count(ho_ten)>1;

-- cach 2
select distinct ho_ten
from khach_hang
having count(ho_ten)>1;

-- cach 3
select ho_ten
from khach_hang kh1
where exists(
	select *
    from khach_hang kh2
	where kh1.ho_ten = kh2.ho_ten
    limit 1,1)
group by ho_ten;

-- cach 4
select kh1.ho_ten
from khach_hang kh1, khach_hang kh2
where kh1.ho_ten = kh2.ho_ten
	and kh1.ma_khach_hang <> kh2.ma_khach_hang
group by kh1.ho_ten;


-- 9.Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 
-- thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(hd.ngay_lam_hop_dong) as thang, 
	count(hd.ngay_lam_hop_dong) as so_luong
from hop_dong hd
	join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
    where year(hd.ngay_lam_hop_dong) = 2021
    group by month(hd.ngay_lam_hop_dong)
    order by thang;

-- 10.Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select hd.ma_hop_dong, 
	hd.ngay_lam_hop_dong, 
    hd.ngay_ket_thuc,
    hd.tien_dat_coc,
    sum(hdct.so_luong) as so_luong_dich_vu_di_kem
from hop_dong hd
	left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
    left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
    group by hd.ma_hop_dong
    order by hd.ma_hop_dong;

















