/*Working with Instagram database clone*/
CREATE database ig_clone;
use ig_clone;
select database();

/*User Table*/
create table users(
	id int auto_increment primary key,
    username varchar(255) unique not null,
    created_at TIMESTAMP default NOW()
);

/*Photos Table*/
create table photos(
	id int auto_increment primary key,
    image_url varchar(255) not null,
    user_id int not null,
    created_at timestamp default now(),
    foreign key (user_id) references users(id)
);

/*Comments Table*/
create table comments(
	id int auto_increment primary key,
    comment_text varchar(255) not null,
    user_id int not null,
    photo_id int not null,
    created_at timestamp default now(),
    foreign key (user_id) references users(id),
    foreign key (photo_id) references photos(id)
);

/*Likes Table*/
create table likes(
	user_id int not null,
    photo_id int not null,
    created_at timestamp default now(),
    foreign key (user_id) references users(id),
    foreign key (photo_id) references photos(id),
    primary key (user_id,photo_id) /*Will make sure only one user_id
    liked a photo*/
);

/*Followers Table*/
create table follows(
	follower_id int not null,
    followee_id int not null,
    created_at timestamp default now(),
    foreign key (follower_id) references users(id),
    foreign key (followee_id) references users(id),
    primary key (follower_id, followee_id)
);

/*Hash Tags Table*/
create table tags(
	id integer auto_increment primary key,
    tag_name varchar(255) unique,
    created_at timestamp default now()
);

create table photo_tags(
	photo_id int not null,
    tag_id int not null,
	foreign key (photo_id) references photos(id),
    foreign key (tag_id) references tags(id),
    primary key (photo_id, tag_id)
);
show tables;
/*Inserting Data*/
