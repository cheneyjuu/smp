drop table if exists tbl_task;
drop table if exists tbl_user;

create table tbl_task (
	id bigint auto_increment,
	title varchar(128) not null,
	description varchar(255),
	user_id bigint not null,
    primary key (id)
) engine=InnoDB;

create table tbl_user (
	id bigint auto_increment,
	login_name varchar(64) not null unique,
	name varchar(64) not null,
	password varchar(255) not null,
	salt varchar(64) not null,
	roles varchar(255) not null,
	register_date timestamp not null default 0,
	primary key (id)
) engine=InnoDB;

-- 用户名：admin  密码：1
insert into tbl_user values(1,'admin','admin','49b3e77fbb1e579fc9f18d3d83b864eebba6b746','5820c6d1ab128d2c','2013-07-05 10:04:08');
insert into tbl_user values(1,'jpm','admin','49b3e77fbb1e579fc9f18d3d83b864eebba6b746','5820c6d1ab128d2c','2013-07-05 10:04:08');