Create database shirts_db;
Use shirts_db;
Create Table shirts(shirt_id int not null auto_increment,
article varchar(50) not null,
color varchar(50) not null,
shirt_size varchar(50) not null,
last_worn varchar(50) not null,
primary key (shirt_id)
);

insert into shirts(article, color, shirt_size, last_worn)
values('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);

insert into shirts(color,article,shirt_size,last_worn)
values('purple','polo shirt','M',50);
SET SQL_SAFE_UPDATES = 0;
select article,color from shirts;
select article,color,shirt_size,last_worn from shirts where shirt_size='M';
Update shirts set size='L'
where article='polo shirt';
Update shirts set last_worn=0
where last_worn=15;
Update shirts set shirt_size='XS',color='off white'
where color='white';
select * from shirts;
Delete from shirts where last_worn=200;
Delete from shirts where article='tank top';
Delete from shirts;
Drop table shirts;