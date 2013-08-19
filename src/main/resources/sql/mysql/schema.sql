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
-- insert into tbl_user values(1,'jpm','admin','49b3e77fbb1e579fc9f18d3d83b864eebba6b746','5820c6d1ab128d2c','2013-07-05 10:04:08');

ALTER TABLE `sys_user`DROP PRIMARY KEY;
ALTER TABLE `employee`DROP PRIMARY KEY;
ALTER TABLE `department`DROP PRIMARY KEY;
ALTER TABLE `title`DROP PRIMARY KEY;
ALTER TABLE `record`DROP PRIMARY KEY;
ALTER TABLE `education`DROP PRIMARY KEY;
ALTER TABLE `overtime_info`DROP PRIMARY KEY;
ALTER TABLE `vacation_info`DROP PRIMARY KEY;
ALTER TABLE `news_info`DROP PRIMARY KEY;
ALTER TABLE `work_plan_day`DROP PRIMARY KEY;
ALTER TABLE `work_plan_monthly`DROP PRIMARY KEY;
ALTER TABLE `work_plan_weekly`DROP PRIMARY KEY;
ALTER TABLE `work_plan_monthly`DROP PRIMARY KEY;
ALTER TABLE `work_experience_comment`DROP PRIMARY KEY;
ALTER TABLE `work_experience`DROP PRIMARY KEY;
ALTER TABLE `sign_in_log`DROP PRIMARY KEY;
ALTER TABLE `sys_module`DROP PRIMARY KEY;
ALTER TABLE `sys_user_permission`DROP PRIMARY KEY;

DROP TABLE `sys_user`;
DROP TABLE `employee`;
DROP TABLE `department`;
DROP TABLE `title`;
DROP TABLE `record`;
DROP TABLE `education`;
DROP TABLE `overtime_info`;
DROP TABLE `vacation_info`;
DROP TABLE `news_info`;
DROP TABLE `work_plan_day`;
DROP TABLE `work_plan_monthly`;
DROP TABLE `work_plan_weekly`;
DROP TABLE `work_plan_weekly`;
DROP TABLE `work_plan_monthly`;
DROP TABLE `work_experience_comment`;
DROP TABLE `work_experience`;
DROP TABLE `sign_in_log`;
DROP TABLE `sys_module`;
DROP TABLE `sys_user_permission`;

CREATE TABLE `sys_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `loginName` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `states` int(255) NOT NULL DEFAULT 0 COMMENT '用户状态。',
  `empID` int NULL COMMENT '关联员工',
  `salt` varchar(64) NULL,
  `roles` varchar(255) NULL,
  `register_date` timestamp NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `employee` (

  `id` int NOT NULL AUTO_INCREMENT,
  `empID` longtext NOT NULL COMMENT '工号',
  `states` int(255) NULL COMMENT '状态：在职、离职、休假',
  `name` varchar(255) NOT NULL,
  `sex` int NOT NULL,
  `dateOfBirth` date NOT NULL COMMENT '出生日期',
  `nationality` varchar(255) NULL COMMENT '国籍',
  `address` varchar(255) NULL,
  `phone` varchar(255) NULL,
  `email` varchar(255) NULL,
  `idNumber` varchar(60) NULL COMMENT '身份证编号',
  `salary` varchar(255) NULL COMMENT '薪水',
  `dateEmployed` date NULL COMMENT '入职时间',
  `departmentID` int NULL COMMENT '当前职务',
  `titleID` int NULL COMMENT '当前职务',
  PRIMARY KEY (`id`)
);

CREATE TABLE `department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `title` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `record` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stateDate` date NOT NULL COMMENT '起始日期',
  `endDate` date NULL COMMENT '结束日期。如为“null”，则表示“至今”',
  `company` varchar(255) NULL COMMENT '公司',
  `department` varchar(255) NULL COMMENT '部门',
  `title` varchar(255) NULL COMMENT '职务',
  `salary` int(10) NULL COMMENT '薪水',
  `empID` int NOT NULL COMMENT '关联员工',
  PRIMARY KEY (`id`)
);

CREATE TABLE `education` (
  `id` int NOT NULL AUTO_INCREMENT,
  `startDate` date NOT NULL COMMENT '起始日期',
  `endDate` date NULL COMMENT '结束日期。如为“null”，则表示“至今”',
  `school` varchar(255) NULL COMMENT '学校',
  `major` varchar(255) NULL COMMENT '专业',
  `degree` varchar(255) NULL COMMENT '学历',
  `description` text NULL COMMENT '描述',
  `overseas` char(255) NULL COMMENT '是否海外经历',
  `empID` int NOT NULL COMMENT '关联员工',
  PRIMARY KEY (`id`)
);

CREATE TABLE `overtime_info` (
  `id` int NULL AUTO_INCREMENT,
  `empID` int NOT NULL COMMENT '加班员工',
  `startTime` date NOT NULL,
  `endTime` date NOT NULL,
  `description` text NULL COMMENT '加班描述',
  `type` int(255) NULL COMMENT '加班类型。日常加班、周末加班、法定节假日加班',
  PRIMARY KEY (`id`)
);

CREATE TABLE `vacation_info` (
  `id` int NULL AUTO_INCREMENT,
  `empID` int NOT NULL COMMENT '加班员工',
  `startTime` date NOT NULL,
  `endTime` date NOT NULL,
  `description` text NULL COMMENT '加班描述',
  `type` int(255) NULL DEFAULT 0 COMMENT '休假类型。事假、病假、年假、调休等',
  `states` int(255) NULL DEFAULT 0 COMMENT '状态。申请中、休假中、结束',
  PRIMARY KEY (`id`)
);

CREATE TABLE `news_info` (
  `id` int NULL AUTO_INCREMENT,
  `empID` int NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `subTitle` varchar(255) NULL,
  `content` text NULL,
  `type` int NOT NULL,
  `releaseTime` date NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
);

CREATE TABLE `work_plan_day` (
  `id` int NULL AUTO_INCREMENT,
  `emp_id` int NOT NULL COMMENT 'emp_id',
  `title` varchar(255) NOT NULL,
  `content` text NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  `date` date NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `work_plan_monthly` (
  `id` int NULL AUTO_INCREMENT,
  `empID` int NOT NULL,
  `title` varchar(255) NULL,
  `content` text NULL,
  `startDate` date NULL,
  `endDate` date NULL,
  `month` date NOT NULL COMMENT '标示哪一年哪一月的计划',
  PRIMARY KEY (`id`)
);

CREATE TABLE `work_plan_weekly` (
);

CREATE TABLE `work_plan_weekly` (
  `id` int NULL AUTO_INCREMENT,
  `emp_id` int NOT NULL COMMENT 'emp_id',
  `title` varchar(255) NOT NULL,
  `content` text NULL,
  `startTime` datetime NOT NULL,
  `endTime` datetime NOT NULL,
  `date` date NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `work_plan_monthly` (
  `id` int NULL AUTO_INCREMENT,
  `emp_id` int NOT NULL COMMENT 'emp_id',
  `title` varchar(255) NOT NULL,
  `content` text NULL,
  `startTime` datetime NOT NULL,
  `endTime` datetime NOT NULL,
  `date` date NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `work_experience_comment` (
  `id` int NULL AUTO_INCREMENT,
  `workExperienceID` int NOT NULL,
  `empID` int NOT NULL,
  `title` varchar(255) NULL,
  `content` text NULL,
  ``  NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `work_experience` (
  `id` int NULL AUTO_INCREMENT,
  `empID` int NOT NULL,
  `title` varchar(255) NULL,
  `content` text NULL,
  `createTime` datetime NULL COMMENT '心得创建时间',
  `changeTime` datetime NULL COMMENT '心得修改时间',
  `atID` int NULL COMMENT '表示该评论是针对哪一条的ID，如为null，则表示自己独立发表的心得',
  PRIMARY KEY (`id`)
);

CREATE TABLE `sign_in_log` (
  `id` int NULL AUTO_INCREMENT,
  `empID` int NULL,
  `signInTime` datetime NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `sys_module` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `sys_user_permission` (
  `id` int NULL AUTO_INCREMENT,
  `userID` int NOT NULL,
  `moduleID` int NOT NULL,
  `permission` int(255) NULL COMMENT '权限值。二进制数表示，从最低位往最高位顺序表示“增、删、改、查”的权限',
  PRIMARY KEY (`id`)
);

