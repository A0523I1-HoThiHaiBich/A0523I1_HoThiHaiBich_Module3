-- 2. Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
SELECT 
    *
FROM
    nhan_vien
WHERE
    ho_ten LIKE 'H%' OR ho_ten LIKE 't%'
        OR ho_ten LIKE 'k%'
        AND LENGTH(ho_ten) <= 15;
  -- 3.       
 select *, (year(now())-year(ngay_sinh)) as age
 from khach_hang
 where dia_chi like '% Đà Nẵng' or dia_chi like '% Quảng Trị'
 having age between 18 and 50;
 
 -- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
 -- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
 -- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
 select khach_hang.ma_khach_hang,khach_hang.ho_ten, count(hop_dong.ma_hop_dong) as so_lan_dat_phong
 from loai_khach inner join khach_hang  on loai_khach.ma_loai_khach= khach_hang.ma_loai_khach 
				inner join hop_dong on khach_hang.ma_khach_hang= hop_dong.ma_khach_hang
where loai_khach.ten_loai_khach= 'Diamond'
group by khach_hang.ma_khach_hang
order by so_lan_dat_phong;

-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
-- cho tất cả các khách hàng đã từng đặt phòng. 
-- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra). 
select kh.ma_khach_hang, kh.ho_ten, lkhach.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong,hd.ngay_ket_thuc, (dv.chi_phi_thue+ dvdkem.gia* hd_detail.so_luong ) as tong_tien
from loai_khach lkhach 
		inner join khach_hang kh on lkhach.ma_loai_khach=kh.ma_loai_khach
		left join hop_dong hd on kh.ma_khach_hang= hd.ma_khach_hang
        left join dich_vu dv on hd.ma_dich_vu= dv.ma_dich_vu 
        left join hop_dong_chi_tiet hd_detail on hd.ma_hop_dong= hd_detail.ma_hop_dong
        left join dich_vu_di_kem dvdkem on hd_detail.ma_dich_vu_di_kem= dvdkem.ma_dich_vu_di_kem
order by ma_khach_hang;

-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu)
--  của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

select dich_vu.ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu
from dich_vu 
inner join loai_dich_vu on dich_vu.ma_loai_dich_vu= loai_dich_vu.ma_loai_dich_vu
inner join hop_dong on hop_dong.ma_dich_vu= dich_vu.ma_dich_vu
where (year(ngay_lam_hop_dong))= '2021' and (month(ngay_lam_hop_dong)) not in('1','2','3')
group by dich_vu.ma_dich_vu;
        
-- 7.Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
 -- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020
-- nhưng chưa từng được khách hàng đặt phòng trong năm 2021.        
select dich_vu.ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
from dich_vu
inner join loai_dich_vu on dich_vu.ma_loai_dich_vu= loai_dich_vu.ma_loai_dich_vu
inner join hop_dong on hop_dong.ma_dich_vu= dich_vu.ma_dich_vu
where (year(ngay_lam_hop_dong)) in ('2020') and (year(ngay_lam_hop_dong)) not in ('2021')
group by dich_vu.ma_dich_vu;
-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên
-- Cach 1: 
select distinct ho_ten
from khach_hang;

-- Cach 2: 
select ho_ten
from khach_hang
union 
select ho_ten
from khach_hang;

-- Cach 3: 
select ho_ten
from khach_hang
group by ho_ten;
-- 9.Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 
-- thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

select month(ngay_lam_hop_dong) as thang, count(ma_khach_hang) as so_luong_KH
from hop_dong 
where year(ngay_lam_hop_dong) in ('2021')
group by thang
order by thang;

-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
 select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, sum(hdct.so_luong) as so_luong_dich_vu_di_kem
 from hop_dong hd
 left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
 group by hd.ma_hop_dong
 order by ma_hop_dong;
 
 -- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
 select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem 
 from dich_vu_di_kem dvdk
 join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem= hdct.ma_dich_vu_di_kem
 join hop_dong hd on hdct.ma_hop_dong= hd.ma_hop_dong
 join khach_hang kh on hd.ma_khach_hang= kh.ma_khach_hang
 join loai_khach lk on kh.ma_loai_khach= lk.ma_loai_khach
 where lk.ten_loai_khach= 'Diamond' and (kh.dia_chi like '%, Vinh' or kh.dia_chi= '%, Quãng Ngãi');
 
 -- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu,
 -- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách 
 -- hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
 select hd.ma_hop_dong, nv.ho_ten as nv_ho_ten, kh.ho_ten as kh_ho_ten, kh.so_dien_thoai as sdt_khach_hang, dv.ten_dich_vu,sum(hdct.so_luong) as so_luong_dich_vu_di_kem, hd.tien_dat_coc
from khach_hang kh
join hop_dong hd on  kh.ma_khach_hang = hd.ma_khach_hang
left join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien 
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
left join dich_vu dv on hd.ma_dich_vu= dv.ma_dich_vu
where (year(hd.ngay_lam_hop_dong) in ('2020') and quarter(hd.ngay_lam_hop_dong) in ('4')) and 
	  (year(hd.ngay_lam_hop_dong) not in ('2021') or (quarter(hd.ngay_lam_hop_dong)  not in ('1') and quarter(hd.ngay_lam_hop_dong) not in ('2')))
group by hd.ma_hop_dong
order by hd.ma_hop_dong ;


-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, sum(hdct.so_luong) as so_lan_su_dung
from dich_vu_di_kem dvdk 
join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem= hdct.ma_dich_vu_di_kem
 group by hdct.ma_dich_vu_di_kem
 having so_lan_su_dung in (select max(hdct.so_luong) 
 from hop_dong_chi_tiet hdct);
 
 -- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
 -- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
select hd.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, count(hdct.ma_dich_vu_di_kem) as so_lan_su_dung
from dich_vu_di_kem dvdk 
join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem= hdct.ma_dich_vu_di_kem
join hop_dong hd on hdct.ma_hop_dong= hd.ma_hop_dong
join dich_vu dv on hd.ma_dich_vu= dv.ma_dich_vu
join loai_dich_vu ldv on dv.ma_loai_dich_vu= ldv.ma_loai_dich_vu
group by hdct.ma_dich_vu_di_kem
having so_lan_su_dung in 
 (select hdct.so_luong
 from hop_dong_chi_tiet hdct
 where hdct.so_luong='1');
 
 --  15.	Hiển thi thông tin của tất cả nhân viên bao gồm 
 -- ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi
 -- mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
 select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi, count(hd.ma_hop_dong) as so_luong_HD
 from hop_dong hd 
 join nhan_vien nv on hd.ma_nhan_vien= nv.ma_nhan_vien
 join trinh_do td on nv.ma_trinh_do= td.ma_trinh_do
 join bo_phan bp on nv.ma_bo_phan= bp.ma_bo_phan
 where ((year(ngay_lam_hop_dong) in ('2020')) or (year(ngay_lam_hop_dong) in ('2021')))
 group by nv.ma_nhan_vien
 having so_luong_HD < '3';
 
 
-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021. 

-- cach 1
set sql_safe_updates=0;
delete
from nhan_vien 
where ma_nhan_vien not in (
select ma_nhan_vien
from hop_dong 
where ((year(ngay_lam_hop_dong) >= '2019' and year(ngay_lam_hop_dong) <= '2021'))
);
set sql_safe_updates=1;

-- cach 2
delete
from nhan_vien
where ma_nhan_vien not in (
select t.ma_nhan_vien from (
select nv.ma_nhan_vien
from nhan_vien nv
join hop_dong hd on nv.ma_nhan_vien= hd.ma_nhan_vien
where ((year(hd.ngay_lam_hop_dong) >= '2019' and year(hd.ngay_lam_hop_dong) <= '2021'))) as t
);

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.

update loai_khach
set ten_loai_khach=' Diamond'
where ten_loai_khach=' Platinum';





