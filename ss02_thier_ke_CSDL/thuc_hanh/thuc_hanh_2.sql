create database QuanLyDiemThi;
use quanlydiemthi;
CREATE TABLE hoc_sinh (
    ma_hs VARCHAR(20) PRIMARY KEY,
    ten_hs VARCHAR(20),
    ngay_sinh DATETIME,
    lop VARCHAR(20),
    gt VARCHAR(20)
);
CREATE TABLE mon_hoc (
    ma_mon_hoc VARCHAR(45) PRIMARY KEY,
    ten_mon_hoc VARCHAR(45)
);
CREATE TABLE bang_diem (
    ma_hs VARCHAR(45),
    ma_MH VARCHAR(45),
    diemthi FLOAT,
    ngay_KT DATETIME,
    PRIMARY KEY (ma_hs , ma_MH),
    FOREIGN KEY (ma_hs)
        REFERENCES hoc_sinh (ma_hs),
    FOREIGN KEY (ma_MH)
        REFERENCES mon_hoc (ma_mon_hoc)
);
CREATE TABLE giao_vien (
    ma_GV VARCHAR(20) PRIMARY KEY,
    ten_GV VARCHAR(45),
    sdt VARCHAR(10)
);
alter table mon_hoc add MaGV varchar(20);
alter table mon_hoc add constraint FK_MaGV foreign key( MaGV) references giao_vien(ma_GV);