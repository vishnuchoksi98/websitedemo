SELECT * FROM student.orderdata;
select sum(productprice) from student.orderdata;

select avg(productprice) from student.orderdata;

select fullname,sum(price),count(price),c.customerid  from student.orderdata o
inner join  student.productdetail p  on p.proid=o.productid
inner join student.customer c on o.customerid=c.customerid where usertype="user" group by fullname ;

select fullname,price,c.customerid,p.name from student.orderdata o
inner join  student.productdetail p  on p.proid=o.productid
inner join student.customer c on o.customerid=c.customerid limit 10;

#delete from student.orderdata where orderid=15;
use student;
#select productprice from student.orderdata where ordertime	;
select * from student.orderdata where  `ordertime` >= DATE_SUB(CURDATE(), INTERVAL 2 MONTH);           #get the data of last two months
select * from student.orderdata where  `ordertime` >= DATEADD(month, -1, CURDATE()) ;

select sum(price)  from student.orderdata o
inner join  student.productdetail p  on p.proid=o.productid
inner join student.customer c on o.customerid=c.customerid    ;


select * from student.orderdata where customerid in (select customerid from student.customer where customerid=1);
use student;
create or replace view oreders as select * from student.orderdata where productprice>3000;
select * from oreders;


