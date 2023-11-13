-- 1. Hiện thị danh sách các lớp có học viên theo học và 
-- số lượng học viên của mỗi lớp 

select c.*, count(c.id) as so_luong_hs
from class c
inner join student s on c.id=s.class_id
group by c.id;

-- 2. Tính điểm lớn nhất của mỗi các lớp
select c.*, max(s.`point`) as max_point
from class c
inner join student s on c.id= s.class_id
group by id;

-- 3. Tình điểm trung bình  của từng lớp 
select c.*, avg(s.`point`) as max_point
from class c
inner join student s where c.id= s.class_id
group by c.id;

-- 4. Lấy ra toàn bộ tên và ngày sinh các instructor và student ở CodeGym. 
-- Sử dụng union 
select `name`, birthday
from student
union
select `name`, birthday
from instructor;
-- 5. Lấy ra top 3 học viên có điểm cao nhất của trung tâm.
select  `name`,`point`
from student
order by `point` desc
limit 3;

-- 6. Lấy ra các học viên có điểm số là cao nhất của trung tâm. 
select *
from student
where `point` in
(select max(`point`) from student);







