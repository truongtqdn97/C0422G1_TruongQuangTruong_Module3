drop database if exists case_study;

create database case_study;

use case_study;

create table vi_tri (
    ma_vi_tri int primary key,
    ten_vi_tri varchar(45)
);

create table trinh_do (
    ma_trinh_do int primary key,
    ten_trinh_do varchar(45)
);

create table bo_phan (
    ma_bo_phan int primary key,
    ten_bo_phan varchar(45)
);

create table nhan_vien (
    ma_nhan_vien int primary key,
    ho_ten varchar(45) not null,
    ngay_sinh date not null,
    so_cmnd varchar(45) not null,
    luong double not null,
    so_dien_thoai varchar(45) not null,
    email varchar(45),
    dia_chi varchar(45),
    ma_vi_tri int not null,
    ma_trinh_do int not null,
    ma_bo_phan int not null,
    foreign key (ma_vi_tri)
        references vi_tri (ma_vi_tri),
    foreign key (ma_trinh_do)
        references trinh_do (ma_trinh_do),
    foreign key (ma_bo_phan)
        references bo_phan (ma_bo_phan)
);

create table loai_khach (
    ma_loai_khach int primary key,
    ten_loai_khach varchar(45)
);

create table loai_dich_vu (
    ma_loai_dich_vu int primary key,
    ten_loai_dich_vu varchar(45)
);

create table kieu_thue (
    ma_kieu_thue int primary key,
    ten_kieu_thue varchar(45)
);

create table dich_vu (
    ma_dich_vu int primary key,
    ten_dich_vu varchar(45) not null,
    dien_tich int,
    chi_phi_thue double not null,
    so_nguoi_toi_da int,
    ma_kieu_thue int not null,
    ma_loai_dich_vu int not null,
    foreign key (ma_kieu_thue)
        references kieu_thue (ma_kieu_thue),
    foreign key (ma_loai_dich_vu)
        references loai_dich_vu (ma_loai_dich_vu),
    tieu_chuan_phong varchar(45),
    mo_ta_tien_nghi_khac varchar(45),
    dien_tich_ho_boi double,
    so_tang int,
    dich_vu_mien_phi_di_kem text
);

create table khach_hang (
    ma_khach_hang int primary key,
    ma_loai_khach int not null,
    foreign key (ma_loai_khach)
        references loai_khach (ma_loai_khach),
    ho_ten varchar(45) not null,
    ngay_sinh date not null,
    gioi_tinh bit(1) not null,
    so_cmnd varchar(45) not null,
    so_dien_thoai varchar(45) not null,
    email varchar(45),
    dia_chi varchar(45),
    `status` bit(1) default 1
);

create table hop_dong (
    ma_hop_dong int primary key,
    ngay_lam_hop_dong datetime not null,
    ngay_ket_thuc datetime not null,
    tien_dat_coc double,
    ma_nhan_vien int not null,
    ma_khach_hang int not null,
    ma_dich_vu int not null,
    foreign key (ma_nhan_vien)
        references nhan_vien (ma_nhan_vien),
    foreign key (ma_khach_hang)
        references khach_hang (ma_khach_hang),
    foreign key (ma_dich_vu)
        references dich_vu (ma_dich_vu)
);

create table dich_vu_di_kem (
    ma_dich_vu_di_kem int primary key,
    ten_dich_vu_di_kem varchar(45) not null,
    gia double not null,
    don_vi varchar(10) not null,
    trang_thai varchar(45)
);

create table hop_dong_chi_tiet (
    ma_hop_dong_chi_tiet int primary key,
    ma_hop_dong int not null,
    ma_dich_vu_di_kem int not null,
    so_luong int not null,
    foreign key (ma_hop_dong)
        references hop_dong (ma_hop_dong),
    foreign key (ma_dich_vu_di_kem)
        references dich_vu_di_kem (ma_dich_vu_di_kem)
);

insert into `case_study`.`vi_tri` (`ma_vi_tri`, `ten_vi_tri`) 
values ('1', 'Quản Lý');
iNSert inTo `case_study`.`vi_tri` (`ma_vi_tri`, `ten_vi_tri`) 
vALues ('2', 'nhân Viên');

InSERt into `case_study`.`trinh_do` (`ma_trinh_do`, `ten_trinh_do`) 
VAlUEs ('1', 'Trung Cấp');
INSErT into `case_study`.`trinh_do` (`ma_trinh_do`, `ten_trinh_do`) 
VALUeS ('2', 'cao đẳng');
INSERT iNTo `case_study`.`trinh_do` (`ma_trinh_do`, `ten_trinh_do`) 
VALUES ('3', 'đại Học');
INSERT INTO `case_study`.`trinh_do` (`ma_trinh_do`, `ten_trinh_do`) 
VALUES ('4', 'Sau đại học');

INSERT INTO `case_study`.`bo_phan` (`ma_bo_phan`, `ten_bo_phan`) 
VAlUES ('1', 'Sale-Marketing');
INSERT INTO `case_study`.`bo_phan` (`ma_bo_phan`, `ten_bo_phan`) 
VAlUES ('2', 'Hành chính');
INSeRT INTO `case_study`.`bo_phan` (`ma_bo_phan`, `ten_bo_phan`) 
VALUeS ('3', 'Phục vỤ');
insErT InTO `case_study`.`bo_phan` (`ma_bo_phan`, `ten_bo_phan`) 
VALUES ('4', 'Quản lý');

insert iNTO `case_study`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) 
VALUES ('1', 'Nguyễn Văn An', '1970-11-07', '456231786', '10000000', '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', '1', '3', '1');
INSERT INTO `case_study`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) 
VALUES ('2', 'Lê Văn Bình', '1997-04-09', '654231234', '7000000', '0934212314', 'binhlv@gmail.com', '22 Yên bái, Đà Nẵng', '1', '2', '2');
INSeRT INTO `case_study`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) 
VALUEs ('3', 'Hồ ThỊ Yến', '1995-12-12', '999231723', '14000000', '0412352315', 'thiyen@gmail.com', 'K234/11 Điện Biên Phủ, Gia Lai', '1', '3', '2');
INSErT INTO `case_study`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) 
VALUES ('4', 'Võ cÔng Toản', '1980-04-04', '123231365', '17000000', '0374443232', 'toan0404@gmail.com', '77 Hoàng Diệu, quảng Trị', '1', '4', '4');
INSERT INTO `case_study`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) 
VALUES ('5', 'NguyỄn Bỉnh PháT', '1999-12-09', '454363232', '6000000', '0902341231', 'phatphat@gmail.com', '43 Yên Bái, Đà nẵng', '2', '1', '1');
InSERT INTO `case_study`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) 
VAlUES ('6', 'Khúc nGuyễn An Nghi', '2000-11-08', '964542311', '7000000', '0978653213', 'annghi20@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng', '2', '2', '3');
iNSERT INTO `case_study`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) 
VALUEs ('7', 'nGuyễn Hữu Hà', '1993-01-01', '534323231', '8000000', '0941234553', 'nhh0101@gmaIl.com', '4 Nguyễn Chí Thanh, Huế', '2', '3', '2');
INSERT INTo `case_study`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) 
VALUeS ('8', 'NgUyễn Hà đÔng', '1989-09-03', '234414123', '9000000', '0642123111', 'donghaNguyen@gmail.cOm', '111 Hùng Vương, Hà Nội', '2', '4', '4');
INSeRT INTO `case_study`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) 
VAlUES ('9', 'TòNg Hoang', '1982-09-03', '256781231', '6000000', '0245144444', 'hoangtOng@gmail.com', '213 Hàm Nghi, đà nẵng', '2', '4', '4');
iNSERT INTO `case_study`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) 
VALUES ('10', 'Nguyễn Công Đạo', '1994-01-08', '755434343', '8000000', '0988767111', 'nguyenCongdao12@gmail.com', '6 Hoà Khánh, đồng Nai', '2', '3', '2');

INSErT INTO `case_study`.`loai_khach` (`ma_loai_khach`, `ten_loai_khach`) 
VALUES ('1', 'Diamond');
INSERT INTO `casE_stuDy`.`Loai_Khach` (`Ma_loAi_khach`, `teN_loai_khach`) 
VALUES ('2', 'PLatinium');
INSErT into `CaSe_sTudy`.`loai_khach` (`ma_Loai_khach`, `Ten_loai_khach`) 
VALUES ('3', 'Gold');
INSERT iNTo `casE_StudY`.`loai_khacH` (`ma_Loai_Khach`, `ten_lOai_khach`) 
vALUES ('4', 'SilvEr');
INSERT INTo `case_sTuDy`.`loai_khAch` (`mA_loaI_khach`, `ten_loai_khach`) 
VALUES ('5', 'meMber');

INSERT iNTo `casE_StudY`.`khach_Hang` (`Ma_khAch_hang`, `ma_loai_khach`, `ho_ten`, `ngay_Sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) 
vALUES ('1', '5', 'Nguyễn Thị hÀo', '1970-11-07', 0, '643431213', '0945423362', 'thiHao07@gmail.com', '23 Nguyễn Hoàng, đÀ Nẵng');
iNSert inTo `case_study`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) 
VALUES ('2', '3', 'Phạm XuâN Diệu', '1992-08-08', 1, '865342123', '0954333333', 'xuAndieu92@gmaiL.com', 'K77/22 Thái Phiên, Quảng Trị');
INSERT INto `case_study`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) 
valueS ('3', '1', 'TrươnG Đình Nghệ', '1990-02-27', 1, '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 ôNg Ích Khiêm, VinH');
INSeRT INTO `caSe_study`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) 
VALUEs ('4', '1', 'Dương Văn Quan', '1981-07-08', 1, '543432111', '0490039241', 'duongquan@gmail.com', 'K453/12 Lê lỢi, Đà Nẵng');
INSERT INTO `Case_studY`.`khach_hAng` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) 
VALUES ('5', '4', 'hoàng trần Nhi Nhi', '1995-12-09', 0, '795453345', '0312345678', 'nhinhI123@gmail.com', '224 lÝ Thái Tổ, GiA Lai');
InSERT INTO `case_sTudy`.`khAch_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) 
VALUES ('6', '4', 'Tôn Nữ mộc cHâu', '2005-12-06', 0, '732434215', '0988888844', 'tonnuchau@gmail.com', '37 Yên Thế, Đà Nẵng');
INSErT INTO `casE_study`.`khach_hAng` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) 
VALUEs ('7', '1', 'Nguyễn Mỹ Kim', '1984-04-08', 0, '856453123', '0912345698', 'kimcuong84@gmAil.com', 'K123/45 Lê Lợi, Hồ Chí Minh');
INSERT INTo `case_studY`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) 
VALUES ('8', '3', 'Nguyễn Thị Hào', '1999-04-08', 0, '965656433', '0763212345', 'haohao99@gmail.com', '55 Nguyễn Văn LinH, Kon Tum');
INSERT InTO `case_studY`.`khach_hAng` (`ma_khach_hAng`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) 
VALUES ('9', '1', 'tRần Đại Danh', '1994-07-01', 1, '432341235', '0643343433', 'dAnhhai99@gmail.com', '24 Lý ThƯờng Kiệt, Quảng Ngãi');
InSERT INTO `caSe_study`.`khAch_hang` (`ma_khach_hang`, `ma_loai_Khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) 
VAlUES ('10', '2', 'Nguyễn Tâm Đắc', '1989-07-01', 1, '344343432', '0987654321', 'dactam@gmail.Com', '22 Ngô Quyền, Đà Nẵng');

INSERT INTO `cAse_study`.`kieu_thue` (`ma_kieu_thuE`, `ten_kiEu_thue`) 
VALUEs (1, 'year');
INSERt Into `cAsE_stuDy`.`Kieu_thue` (`ma_kieu_thuE`, `ten_kieu_ThuE`) 
VALUES (2, 'month');
iNSERT INTO `case_studY`.`kieu_thue` (`ma_kieu_thue`, `ten_kieU_thuE`) 
VALUES (3, 'day');
INsERT INTO `case_stUdy`.`kieu_thue` (`ma_kIeu_THue`, `tEn_kieu_thue`) 
VALUES (4, 'Hour');

InSERT INTO `case_sTudy`.`loai_dich_vu` (`Ma_lOAi_dich_vU`, `teN_loaI_dich_vu`) 
vALUES (1, 'VillA');
INSERT iNTO `case_study`.`loai_diCh_vU` (`ma_Loai_diCh_vu`, `ten_loai_diCh_vu`) 
VAlUES (2, 'House');
INSERT INTO `case_studY`.`LOai_dich_vu` (`mA_loaI_dich_vu`, `teN_loai_dich_vu`) 
VALUES (3, 'Room');

INSERT INTO `case_studY`.`DIch_vu` (`ma_dicH_vu`, `ten_dich_vu`, `dien_tich`, `Chi_phi_thue`, `so_nguoi_toi_da`, `ma_Kieu_thUe`, `ma_loai_dich_vu`, `tIeu_chuan_phonG`, `mo_ta_tien_Nghi_khac`, `dien_Tich_ho_boi`, `so_taNg`, `dich_vu_mien_phi_di_kem`) vaLUES ('1', 'Villa Beach front', '25000', '1000000', '10', '3', '1', 'vip', 'Có hồ bơi', '500', '4', 'null');
INSERT iNTO `case_study`.`dich_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `ma_kieu_thue`, `ma_loai_dich_vu`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `dien_tich_ho_boi`, `so_tang`, `dich_vu_mien_phi_di_kem`) vAlues ('2', 'House Princess 01', '14000', '5000000', '7', '2', '2', 'vip', 'Có thêm bếp nướng', null, '3', null);
INSERT iNTO `case_study`.`dich_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `ma_kieu_thue`, `ma_loai_dich_vu`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `dien_tich_ho_boi`, `so_tang`, `dich_vu_mien_phi_di_kem`) VAlues ('3', 'Room Twin 01', '5000', '1000000', '2', '4', '3', 'normal', 'Có tivi', null, null, '1 Xe máy, 1 Xe đạp');
INSERT INTo `case_study`.`dich_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `ma_kieu_thue`, `ma_loai_dich_vu`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `dien_tich_ho_boi`, `so_tang`, `dich_vu_mien_phi_di_kem`) VALUeS ('4', 'villa No Beach Front', '22000', '9000000', '8', '3', '1', 'normal', 'có hồ bơi', '300', '3', null);
INSErT INTO `case_study`.`dich_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `ma_kieu_thue`, `ma_loai_dich_vu`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `dien_tich_ho_boi`, `so_tang`, `dich_vu_mien_phi_di_kem`) VAlUes ('5', 'house princess 02', '10000', '4000000', '5', '3', '2', 'normal', 'Có thêm bếp nướng', null, '2', null);
INSErT INTO `case_study`.`dich_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `ma_kieu_thue`, `ma_loai_dich_vu`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `dien_tich_ho_boi`, `so_tang`, `dich_vu_mien_phi_di_kem`) valueS ('6', 'room twin 02', '3000', '900000', '2', '4', '3', 'normal', 'Có tivi', null, null, '1 Xe máy');

InSERT INTO `case_study`.`dich_vu_di_kem` (`ma_dich_vu_di_kem`, `ten_dich_vu_di_kem`, `gia`, `don_vi`, `trang_thai`) 
VaLUES ('1', 'Karaoke', '10000', 'giờ', 'tiện nGhI, hIện tại');
INSErT INTO `Case_study`.`diCh_vu_di_kEm` (`ma_dIch_vu_di_keM`, `tEn_dicH_vu_di_kem`, `gia`, `Don_vI`, `trang_thaI`) 
VALUES ('2', 'Thuê xe máy', '10000', 'chiếc', 'hỏng 1 xe');
InSERT INTO `Case_study`.`dIch_vu_Di_kem` (`ma_dich_vu_di_keM`, `ten_Dich_vu_di_kem`, `gia`, `don_Vi`, `trAng_tHai`) 
VALUES ('3', 'Thuê xe đạp', '20000', 'chiếc', 'tốt');
INSERT INTO `cAse_stuDy`.`dich_Vu_di_kem` (`mA_dich_Vu_di_Kem`, `ten_dich_vU_di_kem`, `gia`, `dOn_vi`, `trang_Thai`) 
ValueS ('4', 'Buffet buổi sáng', '15000', 'suất', 'đầy đủ Đồ ăn, tráng miệng');
INSERt INTO `case_study`.`dich_Vu_di_kEm` (`Ma_dich_vu_di_kem`, `ten_dicH_vu_di_kem`, `gia`, `don_vi`, `tRang_thai`) 
vALUES ('5', 'Buffet buổi trưa', '90000', 'suất', 'đầy đủ đồ ăN, tránG miệng');
INSERT INTO `Case_stUdY`.`Dich_vu_di_kem` (`ma_diCh_vu_di_Kem`, `ten_dich_vu_di_kem`, `gia`, `don_vi`, `trang_Thai`) 
ValueS ('6', 'Buffet buổi tối', '16000', 'suất', 'đầy đủ đỒ ăn, tráng miệng');

INSERt INTO `case_study`.`hop_dOng` (`Ma_hop_dong`, `ngay_lam_hop_dOng`, `ngAy_ket_thuC`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khAch_hang`, `mA_dich_vu`) 
vALUES ('1', '2020-12-08', '2020-12-08', '0', '3', '1', '3');
INSERt INTO `case_study`.`hop_dOng` (`Ma_hop_dong`, `ngay_lam_hop_dOng`, `ngAy_ket_thuC`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khAch_hang`, `ma_dich_vu`) 
VaLUES ('2', '2020-07-14', '2020-07-21', '200000', '7', '3', '1');
INSERT INTO `casE_study`.`hop_doNg` (`ma_hop_dong`, `ngay_lam_hOp_dong`, `ngAy_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `mA_khach_Hang`, `ma_dich_vu`) 
VALUES ('3', '2021-03-15', '2021-03-17', '50000', '3', '4', '2');
INSERT INTo `case_study`.`hoP_dong` (`ma_hop_Dong`, `ngay_lAm_hop_DoNg`, `ngay_ket_thuC`, `tien_dat_Coc`, `ma_Nhan_Vien`, `ma_khach_hAng`, `ma_dich_vu`) 
VALUES ('4', '2021-01-14', '2021-01-18', '100000', '7', '5', '5');
INSERT INTo `case_study`.`hoP_dong` (`ma_hop_Dong`, `ngay_lAm_hop_DoNg`, `ngay_ket_thuC`, `tien_dat_Coc`, `ma_nhan_vien`, `mA_khach_Hang`, `ma_dich_vu`) 
VALUES ('5', '2021-07-14', '2021-07-15', '0', '7', '2', '6');
INSERT INTO `casE_study`.`hop_doNg` (`ma_hop_dong`, `ngay_lam_hOp_dong`, `ngAy_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `mA_khaCh_hang`, `ma_dich_vu`) 
VaLUES ('6', '2021-06-01', '2021-06-03', '0', '7', '7', '6');
INSeRT INTO `case_stuDy`.`hop_dong` (`ma_hop_dong`, `nGay_lam_hop_doNg`, `nGaY_keT_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `mA_khaCh_hang`, `ma_dich_vu`) 
VaLUES ('7', '2021-09-02', '2021-09-05', '100000', '7', '4', '4');
INSERT INTO `casE_study`.`hop_doNg` (`ma_hop_dong`, `ngay_lam_hOp_dong`, `ngAy_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `mA_khach_Hang`, `ma_dich_vu`) 
VALUES ('8', '2021-06-17', '2021-06-18', '150000', '3', '4', '1');
INSERT INtO `case_study`.`hOp_dong` (`ma_hop_dong`, `ngay_Lam_hop_dOng`, `ngay_ket_thUc`, `tien_dat_coc`, `ma_nhan_vien`, `mA_khach_Hang`, `ma_dich_vu`) 
VALUES ('9', '2020-11-19', '2020-11-19', '0', '3', '4', '3');
INSERT INTO `casE_study`.`hop_doNg` (`ma_hop_dong`, `ngay_lam_hOp_dong`, `ngAy_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `mA_khaCh_hang`, `ma_dich_vu`) 
VaLUES ('10', '2021-04-12', '2021-04-14', '0', '10', '3', '5');
InSERT INTO `case_sTudy`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_Dong`, `nGay_Ket_thuc`, `tiEn_dat_coc`, `Ma_nhAn_viEn`, `ma_kHach_hanG`, `Ma_dich_vu`) 
VALUES ('11', '2021-04-25', '2021-04-25', '0', '2', '2', '1');
iNSERT INTO `case_Study`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `Ngay_Ket_thuc`, `tiEn_dat_coc`, `Ma_nhAn_vieN`, `Ma_khAch_hang`, `mA_dich_vu`) 
vALUES ('12', '2021-05-25', '2021-05-27', '0', '7', '10', '1');

INSERT INTO `case_study`.`hop_donG_chi_tiet` (`ma_Hop_dong_chi_tIet`, `Ma_hop_Dong`, `ma_dicH_vu_di_kem`, `so_lUong`) 
VaLUES ('1', '2', '4', '5');
INSErT INTO `case_Study`.`hop_doNg_chi_tiet` (`ma_hop_dong_chi_tiet`, `ma_hop_dong`, `Ma_dich_vu_di_keM`, `so_luong`) 
VALUES ('2', '2', '5', '8');
INSERT INTO `cAse_study`.`hoP_donG_chi_tiet` (`ma_hop_donG_chi_Tiet`, `ma_hop_dong`, `ma_dich_vu_dI_kem`, `so_luong`) 
vALUES ('3', '2', '6', '15');
INSERT INTO `case_study`.`hOp_Dong_chi_Tiet` (`ma_hop_doNg_chI_tiet`, `ma_hoP_dong`, `ma_dich_vu_Di_kem`, `so_luong`) 
VALUES ('4', '3', '1', '1');
INSERT INTO `case_study`.`hOp_Dong_chi_Tiet` (`ma_hop_doNg_chI_tiet`, `ma_hoP_dong`, `ma_dich_vu_Di_kem`, `so_luong`) 
VALUES ('5', '3', '2', '11');
INSERt INTO `case_study`.`Hop_donG_chi_tiet` (`ma_hop_doNg_chI_tiet`, `ma_hoP_dong`, `ma_dich_vu_Di_kem`, `so_luong`) 
VALUES ('6', '1', '3', '1');
INSERT INTO `case_study`.`hOp_Dong_chi_Tiet` (`ma_hop_doNg_chI_tiet`, `ma_hoP_dong`, `ma_dich_vu_Di_kem`, `so_luong`) 
VALUES ('7', '1', '2', '2');
INSERT INTO `case_study`.`hOp_Dong_chi_Tiet` (`ma_Hop_donG_chi_Tiet`, `ma_hop_dong`, `ma_dich_vu_dI_kem`, `so_luong`) 
vALUES ('8', '12', '2', '2');


