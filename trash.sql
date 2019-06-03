--1
SELECT *
FROM invoice
    JOIN invoice_line ON invoice_line.invoice_id = invoice.invoice_id
WHERE invoice_line.unit_price > 0.99;

--2
select invoice.invoice_date, customer.first_name, customer.last_name, invoice.total
from invoice
    join customer on invoice.customer_id = customer.customer_id

--3
select c.first_name, c.last_name, e.first_name, e.last_name
from customer c
    join employee e on c.support_rep_id = e.employee_id

--4
select al.title, ar.name
from album al
    join artist ar on al.artist_id = ar.artist_id


--5
select pt.playlist_track_id
from playlist_track pt
    join playlist p on p.playlist_id = pt.playlist_id
where p.name = 'Music';


--6

select t.name
from track t
    join playlist_track p on p.track_id = t.track_id
where p.playlist_id = 5

--7

SELECT t.name, p.name
FROM track t
    JOIN playlist_track pt ON t.track_id = pt.track_id
    JOIN playlist p ON pt.playlist_id = p.playlist_id;


--8

select t.name, a.title
from track t
    join album a on t.album_id = a.album_id
    join genre g on g.genre_id = t.genre_id
where g.name = 'Alternative & Punk';


-- Black Diamond

select t.name, g.name, a.title, ar.name
from track t
    join album a on t.album_id = a.album_id
    join artist ar on a.artist_id = ar.artist_id
    join genre g on t.genre_id = g.genre_id
    join playlist_track pt on t.track_id = pt.track_id
    join playlist p on pt.playlist_id = p.playlist_id

-- PART II

--1

select *
from invoice
where invoice_id in (select invoice_id
from invoice_line
where unit_price > 0.99)

--2

select *
from playlist_track
where playlist_id in 
(select playlist_id
from playlist
where name = 'Music')




--3

select name
from track
where track_id in 
(select track_id
from playlist_track
where playlist_id = 5)

--4

select name
from track
where genre_id in
(select genre_id
from genre
where name = 'Comedy')

--5

select name
from track
where album_id 
in(select album_id
from album
where title = 'Fireball')

--6


select *
from track
where album_id
in (select album_id
from album
where artist_id in (
select artist_id
from artist
where name = 'Queen') )


--Part III

--1


update customer 
set fax = null
where fax is not null;

select *
from customer

--2

update customer 
set company = 'Self'
where company is null;

select *
from customer

--3
update customer
set last_name = 'Droolia'
where last_name = 'Barnett';

select *
from customer

--4

update customer
set support_rep_id = 4
where email = 'luisrojas@yahoo.cl';

select *
from customer
where email = 'luisrojas@yahoo.cl'

--5
update track
set composer = 'The darkness around us'
where genre_id = 
(select genre_id
    from genre
    where name = 'Metal')
    and composer is not null;

select *
from track
where composer = 'The darkness around us'

--Part IV

--1
select count(*), g.name
from track t
    join genre g on t.genre_id = g.genre_id
group by g.name

--2
--THESE WANTED A RETURNED COUNT first

select count(*), g.name
from track t
    join genre g on t.genre_id = g.genre_id
where g.name = 'Pop' or g.name = 'Rock'
group by g.name

--3
--THESE WANTED THE NAMES first

select ar.name, count(*)
from album al
    join artist ar on al.artist_id = ar.artist_id
group by ar.name

--PART V

--1

select distinct composer
from track

--2
select distinct billing_postal_code
from invoice

--3
select distinct company
from customer

--Part getting too long

--1
delete from practice_delete
where type = 'bronze'

--2
delete from practice_delete 
where type = 'silver'

--3
delete from practice_delete
where value = 150


--Part Something I guess


create table orders
(
    order_id int primary key,
    product_id int references products(product_id)
);



select p.product_name
from products p
    join orders o on p.product_id = o.product_id
where o.order_id = 1;


select *
from orders




select sum(price)
from products
    join orders on products.product_id = orders.product_id
where order_id = 1;



select count(*)
from orders
    join products on (orders.product_id = products.product_id)
where order_id = 1
group by products.price;




alter table users add column order_id integer references orders
(order_id);

select *
from users



select count(*), user_name
from
    users
    join orders on
(
users.user_id = orders.user_id)
group by
users.user_id;















