drop database if exists bt1;

create database bt1;

use bt1;

create table phieu_xuat(
	so_phieu_xuat varchar(20) primary key,
    ngay_xuat datetime
);

create table vat_tu(
	ma_vat_tu varchar(20) primary key,
    ten_vat_tu varchar(45)
);

create table chi_tiet_phieu_xuat(
	so_phieu_xuat varchar(20),
    ma_vat_tu varchar(20),
    don_gia_xuat int not null,
    so_luong_xuat int not null,
    primary key (so_phieu_xuat, ma_vat_tu),
    foreign key (so_phieu_xuat) references phieu_xuat (so_phieu_xuat),
    foreign key (ma_vat_tu) references vat_tu (ma_vat_tu)
);

create table phieu_nhap(
	so_phieu_nhap varchar(20) primary key,
    ngay_nhap datetime not null
);

create table chi_tiet_phieu_nhap(
	so_phieu_nhap varchar(20),
    ma_vat_tu varchar(20),
    don_gia_nhap int not null,
    so_luong_nhap int not null,
    primary key (so_phieu_nhap, ma_vat_tu),
    foreign key (so_phieu_nhap) references phieu_nhap(so_phieu_nhap),
    foreign key (ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table nha_cung_cap(
	ma_nha_cung_cap varchar(20) primary key,
    ten_nha_cung_cap varchar(50) not null,
    dia_chi varchar(50),
    so_dien_thoai varchar(10)
);

create table so_dien_thoai(
	so_dien_thoai varchar(10) primary key,
    ma_nha_cung_cap varchar(20),
    foreign key (ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);

create table don_dat_hang(
	so_dat_hang varchar(20) primary key,
    ngay_dat_hang datetime not null,
    ma_nha_cung_cap varchar(20) not null,
    foreign key (ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);

create table chi_tiet_don_dat_hang(
	so_dat_hang varchar(20),
	ma_vat_tu varchar(20),
    ma_nha_cung_cap varchar(20) not null,
	primary key (so_dat_hang, ma_vat_tu),
    foreign key (so_dat_hang) references don_dat_hang(so_dat_hang),
    foreign key (ma_vat_tu) references vat_tu(ma_vat_tu),
    foreign key (ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);

















