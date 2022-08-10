drop database if exists thi_module;

create database thi_module;

use thi_module;

create table loai_khach (
    ma_loai_khach int primary key,
    ten_loai_khach varchar(45)
);

create table khach_hang (
    ma_khach_hang int primary key auto_increment,
    ma_loai_khach int not null,
    foreign key (ma_loai_khach)
        references loai_khach (ma_loai_khach),
    ho_ten varchar(45) not null,
    ngay_sinh date not null,
    so_cmnd varchar(45) not null,
    `status` bit(1) default 1
);

INSErT INTO `loai_khach` (`ma_loai_khach`, `ten_loai_khach`) 
VALUES ('1', 'Diamond');
INSERT INTO `Loai_Khach` (`Ma_loAi_khach`, `teN_loai_khach`) 
VALUES ('2', 'PLatinium');
INSErT into `loai_khach` (`ma_Loai_khach`, `Ten_loai_khach`) 
VALUES ('3', 'Gold');

INSERT iNTo `khach_Hang` (`ma_loai_khach`, `ho_ten`, `ngay_Sinh`, `so_cmnd`) 
vALUES ('2', 'Nguyễn Thị hÀo', '1970-11-07', '643431213');
INSERT iNTo `khach_Hang` (`ma_loai_khach`, `ho_ten`, `ngay_Sinh`, `so_cmnd`) 
VALUES ('3', 'Phạm XuâN Diệu', '1992-08-08', '865342123');
INSERT iNTo `khach_Hang` (`ma_loai_khach`, `ho_ten`, `ngay_Sinh`, `so_cmnd`) 
valueS ('1', 'TrươnG Đình Nghệ', '1990-02-27', '488645199');
