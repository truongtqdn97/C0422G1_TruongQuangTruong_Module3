DROP DATABASE IF EXISTS bt1;

CREATE DATABASE bt1;

USE bt1;

CREATE TABLE phieu_xuat (
    so_phieu_xuat VARCHAR(20) PRIMARY KEY,
    ngay_xuat DATETIME
);

CREATE TABLE vat_tu (
    ma_vat_tu VARCHAR(20) PRIMARY KEY,
    ten_vat_tu VARCHAR(45)
);

CREATE TABLE chi_tiet_phieu_xuat (
    so_phieu_xuat VARCHAR(20),
    ma_vat_tu VARCHAR(20),
    don_gia_xuat INT NOT NULL,
    so_luong_xuat INT NOT NULL,
    PRIMARY KEY (so_phieu_xuat , ma_vat_tu),
    FOREIGN KEY (so_phieu_xuat)
        REFERENCES phieu_xuat (so_phieu_xuat),
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu)
);

CREATE TABLE phieu_nhap (
    so_phieu_nhap VARCHAR(20) PRIMARY KEY,
    ngay_nhap DATETIME NOT NULL
);

CREATE TABLE chi_tiet_phieu_nhap (
    so_phieu_nhap VARCHAR(20),
    ma_vat_tu VARCHAR(20),
    don_gia_nhap INT NOT NULL,
    so_luong_nhap INT NOT NULL,
    PRIMARY KEY (so_phieu_nhap , ma_vat_tu),
    FOREIGN KEY (so_phieu_nhap)
        REFERENCES phieu_nhap (so_phieu_nhap),
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu)
);

CREATE TABLE nha_cung_cap (
    ma_nha_cung_cap VARCHAR(20) PRIMARY KEY,
    ten_nha_cung_cap VARCHAR(50) NOT NULL,
    dia_chi VARCHAR(50),
    so_dien_thoai VARCHAR(10)
);

CREATE TABLE so_dien_thoai (
    so_dien_thoai VARCHAR(10) PRIMARY KEY,
    ma_nha_cung_cap VARCHAR(20),
    FOREIGN KEY (ma_nha_cung_cap)
        REFERENCES nha_cung_cap (ma_nha_cung_cap)
);

CREATE TABLE don_dat_hang (
    so_dat_hang VARCHAR(20) PRIMARY KEY,
    ngay_dat_hang DATETIME NOT NULL,
    ma_nha_cung_cap VARCHAR(20) NOT NULL,
    FOREIGN KEY (ma_nha_cung_cap)
        REFERENCES nha_cung_cap (ma_nha_cung_cap)
);

CREATE TABLE chi_tiet_don_dat_hang (
    so_dat_hang VARCHAR(20),
    ma_vat_tu VARCHAR(20),
    ma_nha_cung_cap VARCHAR(20) NOT NULL,
    PRIMARY KEY (so_dat_hang , ma_vat_tu),
    FOREIGN KEY (so_dat_hang)
        REFERENCES don_dat_hang (so_dat_hang),
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu),
    FOREIGN KEY (ma_nha_cung_cap)
        REFERENCES nha_cung_cap (ma_nha_cung_cap)
);
