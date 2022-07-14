DROP DATABASE IF EXISTS case_study;

CREATE DATABASE case_study;

USE case_study;

CREATE TABLE vi_tri (
    ma_vi_tri INT PRIMARY KEY,
    ten_vi_tri VARCHAR(45)
);

CREATE TABLE trinh_do (
    ma_trinh_do INT PRIMARY KEY,
    ten_trinh_do VARCHAR(45)
);

CREATE TABLE bo_phan (
    ma_bo_phan INT PRIMARY KEY,
    ten_bo_phan VARCHAR(45)
);

CREATE TABLE nhan_vien (
    ma_nhan_vien INT PRIMARY KEY,
    ho_ten VARCHAR(45) NOT NULL,
    ngay_sinh DATE NOT NULL,
    so_cmnd VARCHAR(45) NOT NULL,
    luong DOUBLE NOT NULL,
    so_dien_thoai VARCHAR(45) NOT NULL,
    email VARCHAR(45),
    dia_chi VARCHAR(45),
    ma_vi_tri INT NOT NULL,
    ma_trinh_do INT NOT NULL,
    ma_bo_phan INT NOT NULL,
    FOREIGN KEY (ma_vi_tri)
        REFERENCES vi_tri (ma_vi_tri),
    FOREIGN KEY (ma_trinh_do)
        REFERENCES trinh_do (ma_trinh_do),
    FOREIGN KEY (ma_bo_phan)
        REFERENCES bo_phan (ma_bo_phan)
);

CREATE TABLE loai_khach (
    ma_loai_khach INT PRIMARY KEY,
    ten_loai_khach VARCHAR(45)
);

CREATE TABLE loai_dich_vu (
    ma_loai_dich_vu INT PRIMARY KEY,
    ten_loai_dich_vu VARCHAR(45)
);

CREATE TABLE kieu_thue (
    ma_kieu_thue INT PRIMARY KEY,
    ten_kieu_thue VARCHAR(45)
);

CREATE TABLE dich_vu (
    ma_dich_vu INT PRIMARY KEY,
    ten_dich_vu VARCHAR(45) NOT NULL,
    dien_tich INT,
    chi_phi_thue DOUBLE NOT NULL,
    so_nguoi_toi_da INT,
    ma_kieu_thue INT NOT NULL,
    ma_loai_dich_vu INT NOT NULL,
    FOREIGN KEY (ma_kieu_thue)
        REFERENCES kieu_thue (ma_kieu_thue),
    FOREIGN KEY (ma_loai_dich_vu)
        REFERENCES loai_dich_vu (ma_loai_dich_vu),
    tieu_chuan_phong VARCHAR(45),
    mo_ta_tien_nghi_khac VARCHAR(45),
    dien_tich_ho_boi DOUBLE,
    so_tang INT,
    dich_vu_mien_phi_di_kem TEXT
);

CREATE TABLE khach_hang (
    ma_khach_hang INT PRIMARY KEY,
    ma_loai_khach INT NOT NULL,
    FOREIGN KEY (ma_loai_khach)
        REFERENCES loai_khach (ma_loai_khach),
    ho_ten VARCHAR(45) NOT NULL,
    ngay_sinh DATE NOT NULL,
    gioi_tinh BIT(1) NOT NULL,
    so_cmnd VARCHAR(45) NOT NULL,
    so_dien_thoai VARCHAR(45) NOT NULL,
    email VARCHAR(45),
    dia_chi VARCHAR(45)
);

CREATE TABLE hop_dong (
    ma_hop_dong INT PRIMARY KEY,
    ngay_lam_hop_dong DATETIME NOT NULL,
    ngay_ket_thuc DATETIME NOT NULL,
    tien_dat_coc DOUBLE,
    ma_nhan_vien INT NOT NULL,
    ma_khach_hang INT NOT NULL,
    ma_dich_vu INT NOT NULL,
    FOREIGN KEY (ma_nhan_vien)
        REFERENCES nhan_vien (ma_nhan_vien),
    FOREIGN KEY (ma_khach_hang)
        REFERENCES khach_hang (ma_khach_hang),
    FOREIGN KEY (ma_dich_vu)
        REFERENCES dich_vu (ma_dich_vu)
);

CREATE TABLE dich_vu_di_kem (
    ma_dich_vu_di_kem INT PRIMARY KEY,
    ten_dich_vu_di_kem VARCHAR(45) NOT NULL,
    gia DOUBLE NOT NULL,
    don_vi VARCHAR(10) NOT NULL,
    trang_thai VARCHAR(45)
);

CREATE TABLE hop_dong_chi_tiet (
    ma_hop_dong_chi_tiet INT PRIMARY KEY,
    ma_hop_dong INT NOT NULL,
    ma_dich_vu_di_kem INT NOT NULL,
    so_luong INT NOT NULL,
    FOREIGN KEY (ma_hop_dong)
        REFERENCES hop_dong (ma_hop_dong),
    FOREIGN KEY (ma_dich_vu_di_kem)
        REFERENCES dich_vu_di_kem (ma_dich_vu_di_kem)
);

INSERT INTO `case_study`.`vi_tri` (`ma_vi_tri`, `ten_vi_tri`) 
VALUES ('1', 'Quản Lý');
INSERT INTO `Case_study`.`vI_tri` (`mA_vi_tri`, `Ten_vi_tri`) 
VALUES ('2', 'Nhân Viên');

INSERT INTO `CASe_study`.`triNh_do` (`ma_Trinh_do`, `teN_trinh_do`) 
VALUES ('1', 'TrUng Cấp');
INSERT INTO `cASE_study`.`trinh_do` (`ma_trInh_do`, `ten_Trinh_do`) 
VALUES ('2', 'Cao Đẳng');
INSERT INTO `CASe_STUdy`.`trinh_do` (`ma_trinh_do`, `ten_triNh_do`) 
VALUES ('3', 'ĐẠi Học');
INSERT INTO `caSE_STUdY`.`trinh_do` (`mA_trinh_do`, `ten_trinh_do`) 
VALUES ('4', 'SAU ĐẠI Học');

INSERT INTO `casE_stUDY`.`bO_PHan` (`ma_bo_pHan`, `ten_Bo_phan`) 
VALUES ('1', 'Sale-MARKETInG');
INSERT INTO `case_stUDY`.`bO_PHan` (`ma_bo_pHan`, `ten_Bo_phan`) 
VALUES ('2', 'Hành cHÍNH');
INSERT INTO `case_sTudY`.`BO_PHAN` (`ma_bo_phaN`, `ten_bo_phan`) 
VALUES ('3', 'Phục vỤ');
INSERT INTO `case_study`.`BO_PHAn` (`ma_bo_phan`, `ten_bo_phaN`) 
VALUES ('4', 'Quản lý');

INSERT INTO `case_study`.`nhaN_VIEN` (`Ma_nhan_vien`, `ho_ten`, `nGay_sinh`, `so_Cmnd`, `luOng`, `so_dieN_thoai`, `Email`, `Dia_chi`, `ma_vi_Tri`, `ma_trinh_do`, `ma_bo_phan`) 
VALUES ('1', 'Nguyễn Văn An', '1970-11-07', '456231786', '10000000', '0901234121', 'annGuyen@gmail.Com', '295 NguYễn Tất Thành, Đà Nẵng', '1', '3', '1');
INSERT INTO `case_study`.`nhAn_viEn` (`ma_NHAN_vIEN`, `ho_ten`, `Ngay_sinh`, `So_cmnd`, `luonG`, `so_diEn_thoai`, `eMail`, `dia_chi`, `mA_vi_tri`, `ma_trInh_do`, `ma_bo_phan`) 
VALUES ('2', 'Lê Văn Bình', '1997-04-09', '654231234', '7000000', '0934212314', 'binHlv@gmail.com', '22 Yên Bái, Đà Nẵng', '1', '2', '2');
INSERT INTO `case_study`.`nhan_vIen` (`ma_Nhan_VieN`, `Ho_TEN`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dIen_thoai`, `email`, `dIa_chi`, `mA_vi_tri`, `ma_trinh_do`, `ma_bo_phAn`) 
VALUES ('3', 'Hồ ThỊ Yến', '1995-12-12', '999231723', '14000000', '0412352315', 'Thiyen@gmail.cOm', 'K234/11 Điện Biên PHủ, Gia Lai', '1', '3', '2');
INSERT INTO `case_study`.`nhan_vien` (`ma_nhAn_viEn`, `ho_tEn`, `NGAy_SINh`, `so_cmnd`, `luong`, `sO_dien_thoai`, `email`, `Dia_chi`, `ma_vi_tri`, `Ma_trinh_Do`, `ma_bo_phan`) 
VALUES ('4', 'Võ CÔng Toản', '1980-04-04', '123231365', '17000000', '0374443232', 'toan0404@gMail.com', '77 Hoàng Diệu, Quảng Trị', '1', '4', '4');
INSERT INTO `case_stUdy`.`nhan_vien` (`ma_nhan_vien`, `Ho_teN`, `Ngay_SinH`, `So_CMNd`, `luong`, `so_dien_thoaI`, `email`, `dIa_chi`, `Ma_vi_tri`, `Ma_trinh_do`, `ma_bo_phan`) 
VALUES ('5', 'NguyỄn Bỉnh PháT', '1999-12-09', '454363232', '6000000', '0902341231', 'phatphat@gmail.com', '43 Yên Bái, Đà Nẵng', '2', '1', '1');
INSERT INTO `caSe_study`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `nGay_sInh`, `so_CmnD`, `LuONG`, `so_dien_thOai`, `email`, `dia_chi`, `mA_vi_tri`, `ma_trinh_do`, `ma_bo_pHan`) 
VALUES ('6', 'Khúc NGuyễn An Nghi', '2000-11-08', '964542311', '7000000', '0978653213', 'AnNghi20@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng', '2', '2', '3');
INSERT INTO `cAse_study`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `So_cmNd`, `luonG`, `SO_DiEN_Thoai`, `email`, `dia_chi`, `ma_vi_tri`, `Ma_trinh_dO`, `ma_bo_phAn`) 
VALUES ('7', 'NGuyễn Hữu Hà', '1993-01-01', '534323231', '8000000', '0941234553', 'nhh0101@gmaIl.COM', '4 NGuyễn Chí Thanh, Huế', '2', '3', '2');
INSERT INTO `case_stuDy`.`nhan_vien` (`ma_nhan_vien`, `hO_ten`, `ngay_sinh`, `so_cmnd`, `luonG`, `So_diEn_THOAI`, `EMail`, `dia_chI`, `ma_vi_trI`, `ma_trinh_dO`, `ma_bo_phan`) 
VALUES ('8', 'NgUyễn Hà ĐÔng', '1989-09-03', '234414123', '9000000', '0642123111', 'donghaNguyen@gmail.cOm', '111 HùnG Vương, Hà Nội', '2', '4', '4');
INSERT INTO `casE_study`.`nHan_vien` (`ma_nhan_vien`, `ho_ten`, `ngAy_sinh`, `so_cmnd`, `luong`, `sO_dieN_thoAi`, `emAIL`, `DIA_chi`, `ma_vi_Tri`, `ma_triNh_do`, `ma_bo_Phan`) 
VALUES ('9', 'TòNg Hoang', '1982-09-03', '256781231', '6000000', '0245144444', 'hoangtOng@gmail.com', '213 Hàm Nghi, ĐÀ NẴNg', '2', '4', '4');
INSERT INTO `cAse_study`.`nHan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoaI`, `Email`, `DIA_ChI`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) 
VALUES ('10', 'Nguyễn Công Đạo', '1994-01-08', '755434343', '8000000', '0988767111', 'nguyenCongdao12@gmail.com', '6 Hoà KhÁNH, ĐồNg NaI', '2', '3', '2');

INSERT INTO `case_Study`.`loai_Khach` (`ma_loai_khach`, `ten_loai_khach`) 
VALUES ('1', 'Diamond');
INSERT INTO `casE_stuDy`.`Loai_KhacH` (`Ma_LOAi_khach`, `teN_loai_khach`) 
VALUES ('2', 'PLatinium');
INSERT INTO `CaSe_sTudy`.`loai_khACH` (`MA_Loai_khach`, `Ten_loai_khach`) 
VALUES ('3', 'Gold');
INSERT INTO `CASE_StudY`.`loai_khacH` (`MA_LoAI_Khach`, `ten_lOai_khach`) 
VALUES ('4', 'SilvEr');
INSERT INTO `cASE_STuDy`.`loai_khAch` (`MA_LOAI_khach`, `ten_loai_khach`) 
VALUES ('5', 'MeMber');

INSERT INTO `CASE_StudY`.`khach_HanG` (`Ma_KHAch_hang`, `ma_loai_khach`, `ho_ten`, `ngay_Sinh`, `gioi_tinh`, `SO_CMnD`, `so_dien_tHoai`, `EMaIL`, `dia_chi`) 
VALUES ('1', '5', 'Nguyễn Thị HÀo', '1970-11-07', 0, '643431213', '0945423362', 'thiHao07@gmail.com', '23 Nguyễn Hoàng, ĐÀ Nẵng');
INSERT INTO `cAse_sTudy`.`khach_hang` (`ma_khach_hang`, `mA_loai_khach`, `ho_ten`, `ngAy_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `DIA_ChI`) 
VALUES ('2', '3', 'Phạm XuâN Diệu', '1992-08-08', 1, '865342123', '0954333333', 'xuAndieu92@gmaiL.com', 'K77/22 Thái Phiên, Quảng Trị');
INSERT INTO `CAsE_stUdy`.`khach_hang` (`ma_khach_hang`, `ma_loAi_Khach`, `ho_tEn`, `ngay_sinH`, `gioi_tinh`, `so_cmnD`, `so_dien_thoai`, `email`, `dia_chi`) 
VALUES ('3', '1', 'TrươnG Đình Nghệ', '1990-02-27', 1, '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 ÔNg Ích Khiêm, VinH');
INSERT INTO `caSe_STUDY`.`khAch_hAng` (`ma_khach_hang`, `ma_loai_khach`, `hO_ten`, `ngay_Sinh`, `gioi_tInh`, `so_cmnd`, `so_dien_Thoai`, `email`, `dia_chi`) 
VALUES ('4', '1', 'Dương Văn Quan', '1981-07-08', 1, '543432111', '0490039241', 'duongquan@gmail.com', 'K453/12 Lê LỢi, Đà Nẵng');
INSERT INTO `Case_studY`.`khach_hAnG` (`Ma_khaCh_haNg`, `ma_loai_khach`, `ho_ten`, `ngAy_Sinh`, `gioi_Tinh`, `so_cmnD`, `so_dien_thoai`, `eMail`, `dia_chi`) 
VALUES ('5', '4', 'HOÀNG TRẦN Nhi Nhi', '1995-12-09', 0, '795453345', '0312345678', 'nhinhI123@gmail.com', '224 LÝ Thái Tổ, GiA Lai');
INSERT INTO `case_sTudy`.`khAch_hang` (`mA_KHACh_hanG`, `Ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gIOi_tinh`, `so_cmnd`, `so_diEn_thoai`, `email`, `diA_chi`) 
VALUES ('6', '4', 'Tôn Nữ MỘC CHâU', '2005-12-06', 0, '732434215', '0988888844', 'tonnuchau@gmail.com', '37 Yên Thế, Đà Nẵng');
INSERT INTO `casE_study`.`khach_hAng` (`ma_khach_hang`, `MA_LoAi_kHach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `So_Cmnd`, `so_diEn_thoai`, `emAil`, `dia_chi`) 
VALUES ('7', '1', 'Nguyễn Mỹ Kim', '1984-04-08', 0, '856453123', '0912345698', 'kimcuong84@gmAil.com', 'K123/45 Lê Lợi, Hồ Chí Minh');
INSERT INTO `case_studY`.`khach_hang` (`ma_khach_hang`, `ma_lOAI_KHaCh`, `ho_Ten`, `ngay_sinh`, `gIoi_tinh`, `so_cMNd`, `so_dien_thoai`, `emaiL`, `dia_chi`) 
VALUES ('8', '3', 'Nguyễn Thị Hào', '1999-04-08', 0, '965656433', '0763212345', 'haohao99@gmail.com', '55 Nguyễn Văn LinH, Kon Tum');
INSERT INTO `case_studY`.`khach_hAng` (`ma_khach_hAng`, `ma_loai_khach`, `HO_TeN`, `ngay_sinh`, `gioi_tinh`, `sO_cmnd`, `so_dIeN_thoai`, `emaIl`, `dia_chi`) 
VALUES ('9', '1', 'TRần Đại Danh', '1994-07-01', 1, '432341235', '0643343433', 'dAnhhai99@gmail.com', '24 Lý ThƯờng Kiệt, Quảng Ngãi');
INSERT INTO `caSe_study`.`khAch_hang` (`ma_khach_hang`, `ma_loai_Khach`, `ho_tEN`, `nGay_Sinh`, `gioi_tinh`, `so_cmnD`, `so_dien_tHoAI`, `email`, `dia_chi`) 
VALUES ('10', '2', 'Nguyễn Tâm Đắc', '1989-07-01', 1, '344343432', '0987654321', 'dactam@gmail.Com', '22 Ngô Quyền, Đà Nẵng');

INSERT INTO `cAse_study`.`kieu_thue` (`ma_kieu_thuE`, `ten_kiEu_thue`) 
VALUES (1, 'year');
INSERT INTO `CAsE_stuDy`.`Kieu_thue` (`ma_kieu_thuE`, `ten_kieu_ThUE`) 
VALUES (2, 'month');
INSERT INTO `case_studY`.`kieu_thue` (`ma_kieu_thue`, `ten_KIEU_tHUE`) 
VALUES (3, 'day');
INSERT INTO `case_stUdy`.`kieu_thue` (`MA_KIEu_THue`, `tEn_KIEU_ThUE`) 
VALUES (4, 'Hour');

INSERT INTO `case_sTudy`.`loai_dich_Vu` (`MA_LOAi_dich_vU`, `TEN_lOAI_dich_vu`) 
VALUES (1, 'VillA');
INSERT INTO `case_study`.`lOaI_DICH_VU` (`ma_LoaI_DICH_VU`, `ten_loai_diCh_vu`) 
VALUES (2, 'House');
INSERT INTO `casE_STUDY`.`LOai_dich_vu` (`MA_lOAI_dich_vu`, `teN_loai_dich_vu`) 
VALUES (3, 'Room');

INSERT INTO `casE_STUDY`.`DIch_vu` (`ma_DICH_vU`, `ten_dich_vu`, `dien_tich`, `Chi_phi_thue`, `so_nguoi_toi_da`, `ma_KiEU_THUe`, `ma_loai_diCH_VU`, `TIeu_chuan_phonG`, `mo_ta_tien_Nghi_khac`, `dien_Tich_ho_boi`, `so_taNg`, `DIcH_Vu_mien_Phi_DI_KEM`) VALUES ('1', 'VIlla Beach Front', '25000', '1000000', '10', '3', '1', 'vip', 'Có hồ bơi', '500', '4', 'null');
INSERT INTO `case_study`.`Dich_vu` (`ma_dich_vU`, `ten_dich_vu`, `dien_tich`, `chi_phi_thuE`, `so_nguOi_toi_da`, `ma_kieu_thue`, `MA_LOAi_dicH_vu`, `tieu_chuan_phOng`, `mo_ta_tien_ngHi_khaC`, `Dien_Tich_ho_boi`, `so_tang`, `dich_Vu_miEn_phi_dI_kEM`) VALUES ('2', 'House Princess 01', '14000', '5000000', '7', '2', '2', 'vIp', 'Có thêm bếP nướng', null, '3', null);
INSERT INTO `case_study`.`Dich_vu` (`ma_dich_vU`, `ten_dich_vu`, `dien_tich`, `chi_phi_thuE`, `so_nguOi_toi_da`, `ma_kieu_thue`, `MA_LOAi_dicH_vu`, `tieu_chuan_phOng`, `mo_ta_tien_ngHi_khAc`, `dien_tich_hO_boi`, `so_tang`, `dich_vu_MiEN_PHi_di_kEM`) VALUES ('3', 'Room Twin 01', '5000', '1000000', '2', '4', '3', 'nOrmal', 'Có tIvi', null, null, '1 Xe máy, 1 Xe đẠp');
INSERT INTO `case_study`.`dicH_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tiCh`, `chi_phi_thue`, `so_nguoi_Toi_da`, `ma_kieu_thue`, `mA_LOAI_DiCh_vU`, `tieu_chuan_Phong`, `mo_ta_tien_nghi_khac`, `dIen_tich_hO_boi`, `so_TaNG`, `DICH_vu_mien_phi_di_kem`) VALUES ('4', 'VILLa No Beach FrOnt', '22000', '9000000', '8', '3', '1', 'normal', 'Có hồ bơi', '300', '3', null);
INSERT INTO `case_stUdy`.`dich_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_Phi_thue`, `so_nguoi_toi_da`, `Ma_kieu_thue`, `ma_loai_dicH_VU`, `tIeu_Chuan_phong`, `mo_ta_tieN_nghi_khAc`, `dien_Tich_Ho_boI`, `So_tang`, `dich_vu_mien_phi_di_kem`) VALUES ('5', 'HOUsE PRincess 02', '10000', '4000000', '5', '3', '2', 'normAl', 'Có thêm bếp nướng', nulL, '2', null);
INSERT INTO `case_stUdy`.`dich_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_Phi_thue`, `so_nguoi_toi_da`, `Ma_kieu_thue`, `ma_loai_dicH_VU`, `tIeu_Chuan_phong`, `mo_ta_Tien_nghi_khac`, `diEn_tiCh_ho_boi`, `so_tang`, `dich_vu_mien_phi_di_kem`) VALUES ('6', 'ROom TWIN 02', '3000', '900000', '2', '4', '3', 'norMal', 'Có tivi', null, null, '1 Xe máy');

INSERT INTO `case_stUdy`.`dich_vu_di_kem` (`ma_dich_vu_Di_kem`, `ten_dich_vU_di_kem`, `gia`, `don_vI`, `trang_thai`) 
VALUES ('1', 'Karaoke', '10000', 'giờ', 'tIỆN NGhI, hIện tại');
INSERT INTO `Case_study`.`diCh_vu_di_kEm` (`ma_dIch_vu_di_keM`, `TEn_DICH_vu_di_kem`, `giA`, `DoN_VI`, `trang_thaI`) 
VALUES ('2', 'Thuê xe máy', '10000', 'chiếc', 'hỏng 1 xe');
INSERT INTO `Case_study`.`dIcH_VU_Di_kem` (`ma_dich_vu_di_keM`, `ten_Dich_vu_di_kem`, `gia`, `don_Vi`, `TRAnG_THai`) 
VALUES ('3', 'Thuê xe đạp', '20000', 'chiếc', 'tốt');
INSERT INTO `cAse_stuDy`.`dich_Vu_di_kem` (`mA_DICH_Vu_di_Kem`, `ten_dich_vU_di_kem`, `gia`, `dOn_vi`, `trang_ThaI`) 
VALUES ('4', 'Buffet buổi sáng', '15000', 'suất', 'đầy đủ Đồ ăn, tráng miệng');
INSERT INTO `case_study`.`dich_Vu_DI_KEm` (`Ma_dich_vu_di_kem`, `ten_dicH_vu_di_kem`, `gia`, `dON_VI`, `TRang_thai`) 
VALUES ('5', 'Buffet buổi trưa', '90000', 'suất', 'đầy đủ đồ ăN, tránG miệng');
INSERT INTO `CaSE_STUdY`.`Dich_vu_di_kem` (`ma_diCh_vu_di_Kem`, `ten_dich_vu_di_kem`, `gia`, `don_vi`, `trang_ThaI`) 
VALUES ('6', 'Buffet buổi tối', '16000', 'suất', 'đầy đủ đỒ ăn, tráng miệng');

INSERT INTO `case_study`.`hop_dOnG` (`Ma_hop_dong`, `ngay_lam_hop_dOng`, `ngAy_ket_thuC`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khAch_HANG`, `MA_dich_vu`) 
VALUES ('1', '2020-12-08', '2020-12-08', '0', '3', '1', '3');
INSERT INTO `case_study`.`hop_dOnG` (`Ma_hop_dong`, `ngay_lam_hop_dOng`, `ngAy_ket_thuC`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khAch_HANG`, `MA_dich_vu`) 
VALUES ('2', '2020-07-14', '2020-07-21', '200000', '7', '3', '1');
INSERT INTO `casE_study`.`hop_doNg` (`ma_hop_dong`, `ngay_lam_hOp_DONG`, `ngAy_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `mA_kHACH_HaNG`, `ma_dich_vu`) 
VALUES ('3', '2021-03-15', '2021-03-17', '50000', '3', '4', '2');
INSERT INTO `case_study`.`hoP_dong` (`ma_hop_Dong`, `ngay_lAm_HOP_DoNg`, `ngay_ket_thuC`, `tien_dat_Coc`, `ma_Nhan_Vien`, `ma_khACH_HAnG`, `ma_dich_vu`) 
VALUES ('4', '2021-01-14', '2021-01-18', '100000', '7', '5', '5');
INSERT INTO `case_study`.`hoP_dong` (`ma_hop_Dong`, `ngay_lAm_HOP_DoNg`, `ngay_ket_thuC`, `tien_dat_Coc`, `ma_nhan_vien`, `mA_kHACH_HaNG`, `ma_dich_vu`) 
VALUES ('5', '2021-07-14', '2021-07-15', '0', '7', '2', '6');
INSERT INTO `casE_study`.`hop_doNg` (`ma_hop_dong`, `ngay_lam_hOp_DONG`, `ngAy_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `mA_khaCh_HANG`, `MA_dich_vu`) 
VALUES ('6', '2021-06-01', '2021-06-03', '0', '7', '7', '6');
INSERT INTO `case_stuDy`.`hop_dong` (`ma_hop_dong`, `nGay_lam_hop_doNg`, `NGaY_keT_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `mA_khaCh_HANG`, `MA_dich_vu`) 
VALUES ('7', '2021-09-02', '2021-09-05', '100000', '7', '4', '4');
INSERT INTO `casE_study`.`hop_doNg` (`ma_hop_dong`, `ngay_lam_hOp_DONG`, `ngAy_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `mA_kHACH_HaNG`, `ma_dich_vu`) 
VALUES ('8', '2021-06-17', '2021-06-18', '150000', '3', '4', '1');
INSERT INTO `case_study`.`hOp_dong` (`ma_hop_dong`, `ngay_LaM_HOP_dOng`, `ngay_ket_thUc`, `tien_dat_coc`, `ma_nhan_vien`, `mA_kHACH_HaNG`, `ma_dich_vu`) 
VALUES ('9', '2020-11-19', '2020-11-19', '0', '3', '4', '3');
INSERT INTO `casE_study`.`hop_doNg` (`ma_hop_dong`, `ngay_lam_hOp_DONG`, `ngAy_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `mA_khaCh_HANG`, `MA_dich_vu`) 
VALUES ('10', '2021-04-12', '2021-04-14', '0', '10', '3', '5');
INSERT INTO `case_sTudy`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_DoNG`, `nGay_Ket_thuc`, `tiEn_dat_coc`, `Ma_nhAn_viEn`, `ma_kHacH_HANG`, `Ma_dich_vu`) 
VALUES ('11', '2021-04-25', '2021-04-25', '0', '2', '2', '1');
INSERT INTO `case_Study`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dONG`, `Ngay_Ket_thuc`, `tiEn_dat_coc`, `Ma_nhAn_vieN`, `Ma_khAch_HANG`, `MA_dich_vu`) 
VALUES ('12', '2021-05-25', '2021-05-27', '0', '7', '10', '1');

INSERT INTO `case_study`.`hop_donG_chi_tiet` (`ma_Hop_dong_chi_tIeT`, `Ma_hop_Dong`, `ma_dicH_vu_di_kem`, `so_lUong`) 
VALUES ('1', '2', '4', '5');
INSERT INTO `case_Study`.`hop_doNg_chi_tiet` (`ma_hop_dong_chi_tiet`, `ma_hop_dong`, `Ma_dich_vu_di_keM`, `so_luong`) 
VALUES ('2', '2', '5', '8');
INSERT INTO `cAse_study`.`hoP_donG_chi_tiet` (`ma_hop_DONG_cHI_Tiet`, `ma_hop_dong`, `ma_dich_vu_dI_kem`, `so_luong`) 
VALUES ('3', '2', '6', '15');
INSERT INTO `case_stuDy`.`HOP_Dong_chi_Tiet` (`ma_hoP_DONG_CHI_tiet`, `ma_hoP_dong`, `ma_dich_vu_Di_kem`, `so_luong`) 
VALUES ('4', '3', '1', '1');
INSERT INTO `case_stuDy`.`HOP_Dong_chi_Tiet` (`ma_hoP_DONG_CHI_tiet`, `ma_hoP_dong`, `ma_dich_vu_Di_kem`, `so_luong`) 
VALUES ('5', '3', '2', '11');
INSERT INTO `case_stUdY`.`HOp_donG_chi_tiet` (`ma_hoP_DONG_CHI_tiet`, `ma_hoP_dong`, `ma_dich_vu_Di_kem`, `so_luong`) 
VALUES ('6', '1', '3', '1');
INSERT INTO `case_stuDy`.`HOP_Dong_chi_Tiet` (`ma_hoP_DONG_CHI_tiet`, `ma_hoP_dong`, `ma_dich_vu_Di_kem`, `so_luong`) 
VALUES ('7', '1', '2', '2');
INSERT INTO `case_stuDy`.`HOP_Dong_chi_Tiet` (`ma_Hop_DONG_cHI_Tiet`, `ma_hop_dong`, `ma_dich_vu_dI_kem`, `so_luong`) 
VALUES ('8', '12', '2', '2');

