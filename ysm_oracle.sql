???prompt PL/SQL Developer import file
prompt Created on 2018年1月12日, 星期五 by my
set feedback off
set define off
prompt Dropping CHANNEL_USER...
drop table CHANNEL_USER cascade constraints;
prompt Dropping STUDENT...
drop table STUDENT cascade constraints;
prompt Dropping SYS_DEPT...
drop table SYS_DEPT cascade constraints;
prompt Dropping SYS_MENU...
drop table SYS_MENU cascade constraints;
prompt Dropping SYS_OSS...
drop table SYS_OSS cascade constraints;
prompt Dropping SYS_ROLE...
drop table SYS_ROLE cascade constraints;
prompt Dropping SYS_ROLE_DEPT...
drop table SYS_ROLE_DEPT cascade constraints;
prompt Dropping SYS_ROLE_MENU...
drop table SYS_ROLE_MENU cascade constraints;
prompt Dropping SYS_STUDENT...
drop table SYS_STUDENT cascade constraints;
prompt Dropping SYS_USER...
drop table SYS_USER cascade constraints;
prompt Dropping SYS_USER_ROLE...
drop table SYS_USER_ROLE cascade constraints;
prompt Creating CHANNEL_USER...
create table CHANNEL_USER
(
  id       NUMBER(20) not null,
  name     NVARCHAR2(100),
  phonenum NVARCHAR2(100),
  address  NVARCHAR2(200)
)
;
comment on column CHANNEL_USER.id
  is '用户ID';
comment on column CHANNEL_USER.name
  is '用户名';
comment on column CHANNEL_USER.phonenum
  is '手机号';
comment on column CHANNEL_USER.address
  is '用户地址';
alter table CHANNEL_USER
  add primary key (ID);

prompt Creating STUDENT...
create table STUDENT
(
  id       NUMBER(20) not null,
  code     NVARCHAR2(100),
  name     NVARCHAR2(100),
  class_id NUMBER(20)
)
;
comment on table STUDENT
  is '学生信息表';
comment on column STUDENT.id
  is '学生ID';
comment on column STUDENT.code
  is '学号';
comment on column STUDENT.name
  is '姓名';
comment on column STUDENT.class_id
  is '班级号';
alter table STUDENT
  add primary key (ID)
;

prompt Creating SYS_DEPT...
create table SYS_DEPT
(
  dept_id   NUMBER(20) not null,
  parent_id NUMBER(20),
  name      NVARCHAR2(50),
  order_num NUMBER(11),
  del_flag  NUMBER(4)
)
;
comment on table SYS_DEPT
  is '部门管理';
comment on column SYS_DEPT.parent_id
  is '上级部门ID，一级部门为0';
comment on column SYS_DEPT.name
  is '部门名称';
comment on column SYS_DEPT.order_num
  is '排序';
comment on column SYS_DEPT.del_flag
  is '是否删除  -1：已删除  0：正常';
alter table SYS_DEPT
  add primary key (DEPT_ID)
;

prompt Creating SYS_MENU...
create table SYS_MENU
(
  menu_id   NUMBER(20) not null,
  parent_id NUMBER(20),
  name      NVARCHAR2(50),
  url       NVARCHAR2(200),
  perms     NVARCHAR2(500),
  type      NUMBER(11),
  icon      NVARCHAR2(50),
  order_num NUMBER(11),
  state     NUMBER(2)
)
;
comment on table SYS_MENU
  is '菜单管理';
comment on column SYS_MENU.parent_id
  is '父菜单ID，一级菜单为0';
comment on column SYS_MENU.name
  is '菜单名称';
comment on column SYS_MENU.url
  is '菜单URL';
comment on column SYS_MENU.perms
  is '授权(多个用逗号分隔，如：user:list,user:create)';
comment on column SYS_MENU.type
  is '类型   0：目录   1：菜单   2：按钮';
comment on column SYS_MENU.icon
  is '菜单图标';
comment on column SYS_MENU.order_num
  is '排序';
comment on column SYS_MENU.state
  is '状态（1：可用 0：不可用）';
alter table SYS_MENU
  add primary key (MENU_ID)
;

prompt Creating SYS_OSS...
create table SYS_OSS
(
  id          NUMBER(20) not null,
  url         NVARCHAR2(200),
  create_date DATE
);
comment on table SYS_OSS
  is '文件上传';
comment on column SYS_OSS.url
  is 'URL地址';
comment on column SYS_OSS.create_date
  is '创建时间';
alter table SYS_OSS
  add primary key (ID);

prompt Creating SYS_ROLE...
create table SYS_ROLE
(
  role_id     NUMBER(20) not null,
  role_name   NVARCHAR2(100),
  remark      NVARCHAR2(100),
  dept_id     NUMBER(20),
  create_time DATE
)
;
comment on table SYS_ROLE
  is '角色';
comment on column SYS_ROLE.role_name
  is '角色名称';
comment on column SYS_ROLE.remark
  is '备注';
comment on column SYS_ROLE.dept_id
  is '部门ID';
comment on column SYS_ROLE.create_time
  is '创建时间';
alter table SYS_ROLE
  add primary key (ROLE_ID)
;

prompt Creating SYS_ROLE_DEPT...
create table SYS_ROLE_DEPT
(
  id      NUMBER(20) not null,
  role_id NUMBER(20),
  dept_id NUMBER(20)
)
;
comment on table SYS_ROLE_DEPT
  is '角色与部门对应关系';
comment on column SYS_ROLE_DEPT.role_id
  is '角色ID';
comment on column SYS_ROLE_DEPT.dept_id
  is '部门ID';
alter table SYS_ROLE_DEPT
  add primary key (ID)
;

prompt Creating SYS_ROLE_MENU...
create table SYS_ROLE_MENU
(
  id      NUMBER(20) not null,
  role_id NUMBER(20),
  menu_id NUMBER(20)
)
;
comment on table SYS_ROLE_MENU
  is '角色与菜单对应关系';
comment on column SYS_ROLE_MENU.role_id
  is '角色ID';
comment on column SYS_ROLE_MENU.menu_id
  is '菜单ID';
alter table SYS_ROLE_MENU
  add primary key (ID)
;

prompt Creating SYS_STUDENT...
create table SYS_STUDENT
(
  id       NUMBER(20) not null,
  code     NVARCHAR2(100),
  name     NVARCHAR2(100),
  class_id NUMBER(20)
)
;
comment on table SYS_STUDENT
  is '学生信息表';
comment on column SYS_STUDENT.id
  is '学生ID';
comment on column SYS_STUDENT.code
  is '学号';
comment on column SYS_STUDENT.name
  is '姓名';
comment on column SYS_STUDENT.class_id
  is '班级号';
alter table SYS_STUDENT
  add primary key (ID)
;

prompt Creating SYS_USER...
create table SYS_USER
(
  user_id     NUMBER(20) not null,
  username    NVARCHAR2(50) not null,
  password    NVARCHAR2(100),
  salt        NVARCHAR2(20),
  email       NVARCHAR2(100),
  mobile      NVARCHAR2(100),
  status      NUMBER(4),
  dept_id     NUMBER(20),
  create_time DATE
)
;
comment on table SYS_USER
  is '系统用户';
comment on column SYS_USER.username
  is '用户名';
comment on column SYS_USER.password
  is '密码';
comment on column SYS_USER.salt
  is '盐';
comment on column SYS_USER.email
  is '邮箱';
comment on column SYS_USER.mobile
  is '手机号';
comment on column SYS_USER.status
  is '状态  0：禁用   1：正常';
comment on column SYS_USER.dept_id
  is '部门ID';
comment on column SYS_USER.create_time
  is '创建时间';
alter table SYS_USER
  add primary key (USER_ID)
;

prompt Creating SYS_USER_ROLE...
create table SYS_USER_ROLE
(
  id      NUMBER(20) not null,
  user_id NUMBER(20),
  role_id NUMBER(20)
)
;
comment on table SYS_USER_ROLE
  is '用户与角色对应关系';
comment on column SYS_USER_ROLE.user_id
  is '用户ID';
comment on column SYS_USER_ROLE.role_id
  is '角色ID';
alter table SYS_USER_ROLE
  add primary key (ID)
;

prompt Loading CHANNEL_USER...
insert into CHANNEL_USER (id, name, phonenum, address)
values (1, '张飞', '15112341234', '北京市东城区1号');
insert into CHANNEL_USER (id, name, phonenum, address)
values (2, '李四', '135', '北京');
commit;
prompt 2 records loaded
prompt Loading STUDENT...
insert into STUDENT (id, code, name, class_id)
values (100, 'S100', '学生：张三', 100);
insert into STUDENT (id, code, name, class_id)
values (200, 'S200', '学生：李四', 100);
insert into STUDENT (id, code, name, class_id)
values (300, 'S300', '学生：王五', 200);
insert into STUDENT (id, code, name, class_id)
values (400, 'S400', '学生：赵六', 200);
insert into STUDENT (id, code, name, class_id)
values (500, 'S500', '学生：钱七', 300);
insert into STUDENT (id, code, name, class_id)
values (600, 'S600', '学生：魏九', 300);
insert into STUDENT (id, code, name, class_id)
values (700, 'S700', '学生：潘十', 300);
insert into STUDENT (id, code, name, class_id)
values (1000000000, 'S800', '学生：孙二', 100);
commit;
prompt 8 records loaded
prompt Loading SYS_DEPT...
insert into SYS_DEPT (dept_id, parent_id, name, order_num, del_flag)
values (1000000003, 2, 'test', 0, -1);
insert into SYS_DEPT (dept_id, parent_id, name, order_num, del_flag)
values (1, 0, 'admin', 0, 0);
insert into SYS_DEPT (dept_id, parent_id, name, order_num, del_flag)
values (2, 1, '长沙分公司', 1, 0);
insert into SYS_DEPT (dept_id, parent_id, name, order_num, del_flag)
values (3, 1, '上海分公司', 2, 0);
insert into SYS_DEPT (dept_id, parent_id, name, order_num, del_flag)
values (4, 3, '技术部', 0, 0);
insert into SYS_DEPT (dept_id, parent_id, name, order_num, del_flag)
values (5, 3, '销售部', 1, 0);
insert into SYS_DEPT (dept_id, parent_id, name, order_num, del_flag)
values (6, 2, '长沙分公司-大客户部', 0, 0);
insert into SYS_DEPT (dept_id, parent_id, name, order_num, del_flag)
values (1000000005, 3, '123123', 0, -1);
insert into SYS_DEPT (dept_id, parent_id, name, order_num, del_flag)
values (1000000006, 6, '1111', 0, -1);
commit;
prompt 9 records loaded
prompt Loading SYS_MENU...
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (1, 0, '系统管理', null, null, 0, 'fa fa-cog', 0, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (2, 1, '管理员管理', 'modules/sys/user.html', null, 1, 'fa fa-user', 1, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (3, 1, '角色管理', 'modules/sys/role.html', null, 1, 'fa fa-user-secret', 2, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (4, 1, '菜单管理', 'modules/sys/menu.html', null, 1, 'fa fa-th-list', 3, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (5, 1, 'SQL监控', 'druid/sql.html', null, 1, 'fa fa-bug', 4, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (6, 1, '定时任务', 'modules/job/schedule.html', null, 1, 'fa fa-tasks', 5, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (7, 6, '查看', null, 'sys:schedule:list,sys:schedule:info', 2, null, 0, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (8, 6, '新增', null, 'sys:schedule:save', 2, null, 0, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (9, 6, '修改', null, 'sys:schedule:update', 2, null, 0, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (10, 6, '删除', null, 'sys:schedule:delete', 2, null, 0, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (11, 6, '暂停', null, 'sys:schedule:pause', 2, null, 0, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (12, 6, '恢复', null, 'sys:schedule:resume', 2, null, 0, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (13, 6, '立即执行', null, 'sys:schedule:run', 2, null, 0, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (14, 6, '日志列表', null, 'sys:schedule:log', 2, null, 0, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (15, 2, '查看', null, 'sys:user:list,sys:user:info', 2, null, 0, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (16, 2, '新增', null, 'sys:user:save,sys:role:select', 2, null, 0, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (17, 2, '修改', null, 'sys:user:update,sys:role:select', 2, null, 0, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (18, 2, '删除', null, 'sys:user:delete', 2, null, 0, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (19, 3, '查看', null, 'sys:role:list,sys:role:info', 2, null, 0, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (20, 3, '新增', null, 'sys:role:save,sys:menu:perms', 2, null, 0, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (21, 3, '修改', null, 'sys:role:update,sys:menu:perms', 2, null, 0, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (22, 3, '删除', null, 'sys:role:delete', 2, null, 0, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (23, 4, '查看', null, 'sys:menu:list,sys:menu:info', 2, null, 0, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (24, 4, '新增', null, 'sys:menu:save,sys:menu:select', 2, null, 0, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (25, 4, '修改', null, 'sys:menu:update,sys:menu:select', 2, null, 0, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (26, 4, '删除', null, 'sys:menu:delete', 2, null, 0, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (27, 1, '参数管理', 'modules/sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'fa fa-sun-o', 6, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (28, 1, '代码生成器', 'modules/gen/generator.html', 'sys:generator:list,sys:generator:code', 1, 'fa fa-rocket', 8, 0);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (29, 1, '系统日志', 'modules/sys/log.html', 'sys:log:list', 1, 'fa fa-file-text-o', 7, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (30, 1, '文件上传', 'modules/oss/oss.html', 'sys:oss:all', 1, 'fa fa-file-image-o', 6, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (31, 1, '部门管理', 'modules/sys/dept.html', null, 1, 'fa fa-file-code-o', 1, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (32, 31, '查看', null, 'sys:dept:list,sys:dept:info', 2, null, 0, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (33, 31, '新增', null, 'sys:dept:save,sys:dept:select', 2, null, 0, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (34, 31, '修改', null, 'sys:dept:update,sys:dept:select', 2, null, 0, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (35, 31, '删除', null, 'sys:dept:delete', 2, null, 0, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (36, 0, '订单管理', null, null, 0, null, 1, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (37, 1, '渠道用户管理', 'modules/generator/channeluser.html', null, 1, 'fa fa-file-code-o', 6, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (38, 37, '查看', null, 'channeluser:list,channeluser:info', 2, null, 6, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (39, 37, '新增', null, 'channeluser:save', 2, null, 6, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (40, 37, '修改', null, 'channeluser:update', 2, null, 6, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (41, 37, '删除', null, 'channeluser:delete', 2, null, 6, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (42, 1, '学生管理', 'modules/generator/student.html', null, 1, 'fa fa-file-code-o', 7, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (43, 42, '查看', null, 'student:list,student:info', 2, null, 7, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (44, 42, '新增', null, 'student:save', 2, null, 7, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (45, 42, '修改', null, 'student:update', 2, null, 7, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (46, 42, '删除', null, 'student:delete', 2, null, 7, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (47, 1, '系统学生管理', 'modules/generator/sysStudent.html', null, 1, 'fa fa-file-code-o', 6, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (48, 47, '查看', null, 'sysStudent:list,sysStudent:info', 2, null, 6, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (49, 47, '新增', null, 'sysStudent:save', 2, null, 6, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (50, 47, '修改', null, 'sysStudent:update', 2, null, 6, 1);
insert into SYS_MENU (menu_id, parent_id, name, url, perms, type, icon, order_num, state)
values (51, 47, '删除', null, 'sysStudent:delete', 2, null, 6, 1);
commit;
prompt 51 records loaded
prompt Loading SYS_OSS...
prompt Table is empty
prompt Loading SYS_ROLE...
insert into SYS_ROLE (role_id, role_name, remark, dept_id, create_time)
values (1000000007, 'test', 'Test', 2, to_date('11-01-2018 15:36:58', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ROLE (role_id, role_name, remark, dept_id, create_time)
values (1, '管理员', null, 3, to_date('29-12-2017 11:16:41', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 2 records loaded
prompt Loading SYS_ROLE_DEPT...
insert into SYS_ROLE_DEPT (id, role_id, dept_id)
values (1000000020, 1000000007, 1);
insert into SYS_ROLE_DEPT (id, role_id, dept_id)
values (1, 1, 1);
commit;
prompt 2 records loaded
prompt Loading SYS_ROLE_MENU...
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000070, 1000000007, 1);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000071, 1000000007, 2);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000072, 1000000007, 15);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000073, 1000000007, 16);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000074, 1000000007, 17);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000075, 1000000007, 18);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000076, 1000000007, 31);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000077, 1000000007, 34);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000078, 1000000007, 33);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000079, 1000000007, 32);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000080, 1000000007, 35);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000081, 1000000007, 3);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000082, 1000000007, 19);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000083, 1000000007, 20);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000084, 1000000007, 21);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000085, 1000000007, 22);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000086, 1000000007, 4);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000087, 1000000007, 25);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000088, 1000000007, 26);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000089, 1000000007, 23);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000090, 1000000007, 24);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000091, 1000000007, 5);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000092, 1000000007, 6);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000093, 1000000007, 7);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000094, 1000000007, 8);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000095, 1000000007, 9);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000096, 1000000007, 10);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000097, 1000000007, 11);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000098, 1000000007, 12);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000099, 1000000007, 13);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000100, 1000000007, 14);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000101, 1000000007, 30);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000102, 1000000007, 27);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000103, 1000000007, 47);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000104, 1000000007, 49);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000105, 1000000007, 48);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000106, 1000000007, 51);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000107, 1000000007, 50);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000108, 1000000007, 37);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000109, 1000000007, 41);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000110, 1000000007, 40);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000111, 1000000007, 39);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000112, 1000000007, 38);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000113, 1000000007, 42);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000114, 1000000007, 46);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000115, 1000000007, 45);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000116, 1000000007, 44);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000117, 1000000007, 43);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000118, 1000000007, 29);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1000000119, 1000000007, 28);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (1, 1, 1);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (2, 1, 2);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (3, 1, 15);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (4, 1, 16);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (5, 1, 17);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (6, 1, 18);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (7, 1, 31);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (8, 1, 32);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (9, 1, 33);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (10, 1, 34);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (11, 1, 35);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (12, 1, 3);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (13, 1, 19);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (14, 1, 20);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (15, 1, 21);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (16, 1, 22);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (17, 1, 4);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (18, 1, 23);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (19, 1, 24);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (20, 1, 25);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (21, 1, 26);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (22, 1, 5);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (23, 1, 6);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (24, 1, 7);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (25, 1, 8);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (26, 1, 9);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (27, 1, 10);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (28, 1, 11);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (29, 1, 12);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (30, 1, 13);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (31, 1, 14);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (32, 1, 27);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (33, 1, 30);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (34, 1, 29);
insert into SYS_ROLE_MENU (id, role_id, menu_id)
values (35, 1, 28);
commit;
prompt 85 records loaded
prompt Loading SYS_STUDENT...
insert into SYS_STUDENT (id, code, name, class_id)
values (1000000003, '9', '0', 0);
insert into SYS_STUDENT (id, code, name, class_id)
values (1000000004, '11', '11', 11);
insert into SYS_STUDENT (id, code, name, class_id)
values (1000000005, '11', '11', 11);
insert into SYS_STUDENT (id, code, name, class_id)
values (5, '2', '2', 2);
insert into SYS_STUDENT (id, code, name, class_id)
values (6, '3', '3', 3);
insert into SYS_STUDENT (id, code, name, class_id)
values (1000000006, '123', '123', 123);
commit;
prompt 6 records loaded
prompt Loading SYS_USER...
insert into SYS_USER (user_id, username, password, salt, email, mobile, status, dept_id, create_time)
values (1, 'admin', 'e1153123d7d180ceeb820d577ff119876678732a68eef4e6ffc0b1f06a01f91b', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', 1, 1, to_date('11-11-2016 11:11:11', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_USER (user_id, username, password, salt, email, mobile, status, dept_id, create_time)
values (2, 'xiaoxing', '2646fc6538efec61111010c2cc8dc8e0452faf7461f32d9d4f036eba330264e9', '0R2OOXvBy4UhUnoW3CQR', null, null, 1, 3, to_date('29-12-2017 11:16:16', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_USER (user_id, username, password, salt, email, mobile, status, dept_id, create_time)
values (3, 'mengyu', 'c43de116dfa01cc66c30dbf92022fc83416e7a3abbf4e5e1c292c3f89c3c1778', 'tGSBalAdji7aBxLVv826', 'mengyu@139.com', '135', 1, 4, to_date('02-01-2018 17:01:50', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 3 records loaded
prompt Loading SYS_USER_ROLE...
insert into SYS_USER_ROLE (id, user_id, role_id)
values (1, 2, 1);
commit;
prompt 1 records loaded


-- Create table
create table QRTZ_BLOB_TRIGGERS
(
  sched_name    VARCHAR2(120) not null,
  trigger_name  VARCHAR2(200) not null,
  trigger_group VARCHAR2(200) not null,
  blob_data     BLOB
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table QRTZ_BLOB_TRIGGERS
  add constraint QRTZ_BLOB_TRIG_PK primary key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP);
alter table QRTZ_BLOB_TRIGGERS
  add constraint QRTZ_BLOB_TRIG_TO_TRIG_FK foreign key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  references QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP);







-- Create table
create table QRTZ_CALENDARS
(
  sched_name    VARCHAR2(120) not null,
  calendar_name VARCHAR2(200) not null,
  calendar      BLOB not null
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table QRTZ_CALENDARS
  add constraint QRTZ_CALENDARS_PK primary key (SCHED_NAME, CALENDAR_NAME);






-- Create table
create table QRTZ_CRON_TRIGGERS
(
  sched_name      VARCHAR2(120) not null,
  trigger_name    VARCHAR2(200) not null,
  trigger_group   VARCHAR2(200) not null,
  cron_expression VARCHAR2(120) not null,
  time_zone_id    VARCHAR2(80)
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table QRTZ_CRON_TRIGGERS
  add constraint QRTZ_CRON_TRIG_PK primary key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  ;
alter table QRTZ_CRON_TRIGGERS
  add constraint QRTZ_CRON_TRIG_TO_TRIG_FK foreign key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  references QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP);



  
  -- Create table
create table QRTZ_FIRED_TRIGGERS
(
  sched_name        VARCHAR2(120) not null,
  entry_id          VARCHAR2(95) not null,
  trigger_name      VARCHAR2(200) not null,
  trigger_group     VARCHAR2(200) not null,
  instance_name     VARCHAR2(200) not null,
  fired_time        NUMBER(13) not null,
  sched_time        NUMBER(13) not null,
  priority          NUMBER(13) not null,
  state             VARCHAR2(16) not null,
  job_name          VARCHAR2(200),
  job_group         VARCHAR2(200),
  is_nonconcurrent  VARCHAR2(1),
  requests_recovery VARCHAR2(1)
)
;
-- Create/Recreate indexes 
create index IDX_QRTZ_FT_INST_JOB_REQ_RCVRY on QRTZ_FIRED_TRIGGERS (SCHED_NAME, INSTANCE_NAME, REQUESTS_RECOVERY)
  ;
create index IDX_QRTZ_FT_JG on QRTZ_FIRED_TRIGGERS (SCHED_NAME, JOB_GROUP)
 ;
create index IDX_QRTZ_FT_J_G on QRTZ_FIRED_TRIGGERS (SCHED_NAME, JOB_NAME, JOB_GROUP)
  ;
create index IDX_QRTZ_FT_TG on QRTZ_FIRED_TRIGGERS (SCHED_NAME, TRIGGER_GROUP)
  ;
create index IDX_QRTZ_FT_TRIG_INST_NAME on QRTZ_FIRED_TRIGGERS (SCHED_NAME, INSTANCE_NAME)
  ;
create index IDX_QRTZ_FT_T_G on QRTZ_FIRED_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  ;
-- Create/Recreate primary, unique and foreign key constraints 
alter table QRTZ_FIRED_TRIGGERS
  add constraint QRTZ_FIRED_TRIGGER_PK primary key (SCHED_NAME, ENTRY_ID)
  ;

  
  
  
  
  
  
-- Create table
create table QRTZ_JOB_DETAILS
(
  sched_name        VARCHAR2(120) not null,
  job_name          VARCHAR2(200) not null,
  job_group         VARCHAR2(200) not null,
  description       VARCHAR2(250),
  job_class_name    VARCHAR2(250) not null,
  is_durable        VARCHAR2(1) not null,
  is_nonconcurrent  VARCHAR2(1) not null,
  is_update_data    VARCHAR2(1) not null,
  requests_recovery VARCHAR2(1) not null,
  job_data          BLOB
)
;
-- Create/Recreate indexes 
create index IDX_QRTZ_J_GRP on QRTZ_JOB_DETAILS (SCHED_NAME, JOB_GROUP);
create index IDX_QRTZ_J_REQ_RECOVERY on QRTZ_JOB_DETAILS (SCHED_NAME, REQUESTS_RECOVERY)
  ;
-- Create/Recreate primary, unique and foreign key constraints 
alter table QRTZ_JOB_DETAILS
  add constraint QRTZ_JOB_DETAILS_PK primary key (SCHED_NAME, JOB_NAME, JOB_GROUP)
  ;

  
  
  
  -- Create table
create table QRTZ_LOCKS
(
  sched_name VARCHAR2(120) not null,
  lock_name  VARCHAR2(40) not null
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table QRTZ_LOCKS
  add constraint QRTZ_LOCKS_PK primary key (SCHED_NAME, LOCK_NAME)
  ;

  
  
  
  -- Create table
create table QRTZ_PAUSED_TRIGGER_GRPS
(
  sched_name    VARCHAR2(120) not null,
  trigger_group VARCHAR2(200) not null
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table QRTZ_PAUSED_TRIGGER_GRPS
  add constraint QRTZ_PAUSED_TRIG_GRPS_PK primary key (SCHED_NAME, TRIGGER_GROUP)
  ;

  
  
  
  -- Create table
create table QRTZ_SCHEDULER_STATE
(
  sched_name        VARCHAR2(120) not null,
  instance_name     VARCHAR2(200) not null,
  last_checkin_time NUMBER(13) not null,
  checkin_interval  NUMBER(13) not null
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table QRTZ_SCHEDULER_STATE
  add constraint QRTZ_SCHEDULER_STATE_PK primary key (SCHED_NAME, INSTANCE_NAME)
  ;

  
  
  
  
  
  
  -- Create table
create table QRTZ_SIMPLE_TRIGGERS
(
  sched_name      VARCHAR2(120) not null,
  trigger_name    VARCHAR2(200) not null,
  trigger_group   VARCHAR2(200) not null,
  repeat_count    NUMBER(7) not null,
  repeat_interval NUMBER(12) not null,
  times_triggered NUMBER(10) not null
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table QRTZ_SIMPLE_TRIGGERS
  add constraint QRTZ_SIMPLE_TRIG_PK primary key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
 ;
alter table QRTZ_SIMPLE_TRIGGERS
  add constraint QRTZ_SIMPLE_TRIG_TO_TRIG_FK foreign key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  references QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP);

  
  
  
  
  -- Create table
create table QRTZ_SIMPROP_TRIGGERS
(
  sched_name    VARCHAR2(120) not null,
  trigger_name  VARCHAR2(200) not null,
  trigger_group VARCHAR2(200) not null,
  str_prop_1    VARCHAR2(512),
  str_prop_2    VARCHAR2(512),
  str_prop_3    VARCHAR2(512),
  int_prop_1    NUMBER(10),
  int_prop_2    NUMBER(10),
  long_prop_1   NUMBER(13),
  long_prop_2   NUMBER(13),
  dec_prop_1    NUMBER(13,4),
  dec_prop_2    NUMBER(13,4),
  bool_prop_1   VARCHAR2(1),
  bool_prop_2   VARCHAR2(1)
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table QRTZ_SIMPROP_TRIGGERS
  add constraint QRTZ_SIMPROP_TRIG_PK primary key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
 ;
alter table QRTZ_SIMPROP_TRIGGERS
  add constraint QRTZ_SIMPROP_TRIG_TO_TRIG_FK foreign key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  references QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP);

  
  
  
  
  -- Create table
create table QRTZ_TRIGGERS
(
  sched_name     VARCHAR2(120) not null,
  trigger_name   VARCHAR2(200) not null,
  trigger_group  VARCHAR2(200) not null,
  job_name       VARCHAR2(200) not null,
  job_group      VARCHAR2(200) not null,
  description    VARCHAR2(250),
  next_fire_time NUMBER(13),
  prev_fire_time NUMBER(13),
  priority       NUMBER(13),
  trigger_state  VARCHAR2(16) not null,
  trigger_type   VARCHAR2(8) not null,
  start_time     NUMBER(13) not null,
  end_time       NUMBER(13),
  calendar_name  VARCHAR2(200),
  misfire_instr  NUMBER(2),
  job_data       BLOB
)
;
-- Create/Recreate indexes 
create index IDX_QRTZ_T_C on QRTZ_TRIGGERS (SCHED_NAME, CALENDAR_NAME)
  ;
create index IDX_QRTZ_T_G on QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_GROUP)
  ;
create index IDX_QRTZ_T_J on QRTZ_TRIGGERS (SCHED_NAME, JOB_NAME, JOB_GROUP)
  ;
create index IDX_QRTZ_T_JG on QRTZ_TRIGGERS (SCHED_NAME, JOB_GROUP)
  ;
create index IDX_QRTZ_T_NEXT_FIRE_TIME on QRTZ_TRIGGERS (SCHED_NAME, NEXT_FIRE_TIME)
  ;
create index IDX_QRTZ_T_NFT_MISFIRE on QRTZ_TRIGGERS (SCHED_NAME, MISFIRE_INSTR, NEXT_FIRE_TIME)
  ;
create index IDX_QRTZ_T_NFT_ST on QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_STATE, NEXT_FIRE_TIME)
  ;
create index IDX_QRTZ_T_NFT_ST_MISFIRE on QRTZ_TRIGGERS (SCHED_NAME, MISFIRE_INSTR, NEXT_FIRE_TIME, TRIGGER_STATE)
  ;
create index IDX_QRTZ_T_NFT_ST_MISFIRE_GRP on QRTZ_TRIGGERS (SCHED_NAME, MISFIRE_INSTR, NEXT_FIRE_TIME, TRIGGER_GROUP, TRIGGER_STATE)
  ;
create index IDX_QRTZ_T_N_G_STATE on QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_GROUP, TRIGGER_STATE)
  ;
create index IDX_QRTZ_T_N_STATE on QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP, TRIGGER_STATE)
  ;
create index IDX_QRTZ_T_STATE on QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_STATE)
  ;
-- Create/Recreate primary, unique and foreign key constraints 
alter table QRTZ_TRIGGERS
  add constraint QRTZ_TRIGGERS_PK primary key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  ;
alter table QRTZ_TRIGGERS
  add constraint QRTZ_TRIGGER_TO_JOBS_FK foreign key (SCHED_NAME, JOB_NAME, JOB_GROUP)
  references QRTZ_JOB_DETAILS (SCHED_NAME, JOB_NAME, JOB_GROUP);

  
  
  
  -- Create table
create table SCHEDULE_JOB
(
  job_id          NUMBER(20) not null,
  bean_name       NVARCHAR2(200),
  method_name     NVARCHAR2(100),
  params          NCLOB,
  cron_expression NVARCHAR2(100),
  status          NUMBER(4),
  remark          NVARCHAR2(255),
  create_time     DATE
);
-- Add comments to the table 
comment on table SCHEDULE_JOB
  is '定时任务';
-- Add comments to the columns 
comment on column SCHEDULE_JOB.job_id
  is '任务id';
comment on column SCHEDULE_JOB.bean_name
  is 'spring bean名称';
comment on column SCHEDULE_JOB.method_name
  is '方法名';
comment on column SCHEDULE_JOB.params
  is '参数';
comment on column SCHEDULE_JOB.cron_expression
  is 'cron表达式';
comment on column SCHEDULE_JOB.status
  is '任务状态  0：正常  1：暂停';
comment on column SCHEDULE_JOB.remark
  is '备注';
comment on column SCHEDULE_JOB.create_time
  is '创建时间';
-- Create/Recreate primary, unique and foreign key constraints 
alter table SCHEDULE_JOB
  add primary key (JOB_ID)
 ;

  
  
  -- Create table
create table SCHEDULE_JOB_LOG
(
  log_id      NUMBER(20) not null,
  job_id      NUMBER(20) not null,
  bean_name   NVARCHAR2(200),
  method_name NVARCHAR2(100),
  params      NCLOB,
  status      NUMBER(4) not null,
  error       NCLOB,
  times       NUMBER(11) not null,
  create_time DATE
);
-- Add comments to the table 
comment on table SCHEDULE_JOB_LOG
  is '定时任务日志';
-- Add comments to the columns 
comment on column SCHEDULE_JOB_LOG.log_id
  is '任务日志id';
comment on column SCHEDULE_JOB_LOG.job_id
  is '任务id';
comment on column SCHEDULE_JOB_LOG.bean_name
  is 'spring bean名称';
comment on column SCHEDULE_JOB_LOG.method_name
  is '方法名';
comment on column SCHEDULE_JOB_LOG.params
  is '参数';
comment on column SCHEDULE_JOB_LOG.status
  is '任务状态    0：成功    1：失败';
comment on column SCHEDULE_JOB_LOG.error
  is '失败信息';
comment on column SCHEDULE_JOB_LOG.times
  is '耗时(单位：毫秒)';
comment on column SCHEDULE_JOB_LOG.create_time
  is '创建时间';
-- Create/Recreate indexes 
create index JOB_ID on SCHEDULE_JOB_LOG (JOB_ID)
 ;
-- Create/Recreate primary, unique and foreign key constraints 
alter table SCHEDULE_JOB_LOG
  add primary key (LOG_ID)
 ;

  
  
  
  
  -- Create table
create table SYS_CONFIG
(
  id     NUMBER(20) not null,
  key    NVARCHAR2(50),
  value  NCLOB,
  status NUMBER(4),
  remark NVARCHAR2(500)
)
;
-- Add comments to the table 
comment on table SYS_CONFIG
  is '系统配置信息表';
-- Add comments to the columns 
comment on column SYS_CONFIG.key
  is 'key';
comment on column SYS_CONFIG.value
  is 'value';
comment on column SYS_CONFIG.status
  is '状态   0：隐藏   1：显示';
comment on column SYS_CONFIG.remark
  is '备注';
-- Create/Recreate indexes 
create unique index KEY on SYS_CONFIG (KEY)
;
-- Create/Recreate primary, unique and foreign key constraints 
alter table SYS_CONFIG
  add primary key (ID)
 ;

  
  
  
  
-- Create table
create table SYS_LOG
(
  id          NUMBER(20) not null,
  username    NVARCHAR2(50),
  operation   NVARCHAR2(50),
  method      NVARCHAR2(200),
  params      NCLOB,
  time        NUMBER(20) not null,
  ip          NVARCHAR2(64),
  create_date DATE
)
;
-- Add comments to the table 
comment on table SYS_LOG
  is '系统日志';
-- Add comments to the columns 
comment on column SYS_LOG.username
  is '用户名';
comment on column SYS_LOG.operation
  is '用户操作';
comment on column SYS_LOG.method
  is '请求方法';
comment on column SYS_LOG.params
  is '请求参数';
comment on column SYS_LOG.time
  is '执行时长(毫秒)';
comment on column SYS_LOG.ip
  is 'IP地址';
comment on column SYS_LOG.create_date
  is '创建时间';
-- Create/Recreate primary, unique and foreign key constraints 
alter table SYS_LOG
  add primary key (ID)
;
  
  
  
  
insert into SCHEDULE_JOB (JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, CRON_EXPRESSION, STATUS, REMARK, CREATE_TIME)
values (1, 'testTask', 'test', 'renren', '0 0/10 * * * ?', 0, '有参数测试', to_date('01-12-2016 23:16:46', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB (JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, CRON_EXPRESSION, STATUS, REMARK, CREATE_TIME)
values (2, 'testTask', 'test2', '', '0 0/10 * * * ?', 1, '无参数测试', to_date('03-12-2016 14:55:56', 'dd-mm-yyyy hh24:mi:ss'));
  
  
  

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (1, 1, 'testTask', 'test', 'renren', 0, 'renren', 1047, to_date('26-12-2017 17:00:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (2, 1, 'testTask', 'test', 'renren', 0, 'renren', 1061, to_date('27-12-2017 14:00:09', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (3, 1, 'testTask', 'test', 'renren', 0, 'renren', 1027, to_date('27-12-2017 14:30:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (4, 1, 'testTask', 'test', 'renren', 0, 'renren', 1021, to_date('27-12-2017 15:00:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (5, 1, 'testTask', 'test', 'renren', 0, 'renren', 1009, to_date('27-12-2017 15:30:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (6, 1, 'testTask', 'test', 'renren', 0, 'renren', 1008, to_date('27-12-2017 16:00:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (7, 1, 'testTask', 'test', 'renren', 0, 'renren', 1008, to_date('27-12-2017 16:30:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (8, 1, 'testTask', 'test', 'renren', 0, 'renren', 1007, to_date('27-12-2017 17:00:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (9, 1, 'testTask', 'test', 'renren', 0, 'renren', 1007, to_date('27-12-2017 17:30:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (10, 1, 'testTask', 'test', 'renren', 0, 'renren', 1007, to_date('27-12-2017 18:00:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (11, 1, 'testTask', 'test', 'renren', 0, 'renren', 1007, to_date('27-12-2017 18:30:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (12, 1, 'testTask', 'test', 'renren', 0, 'renren', 1007, to_date('27-12-2017 19:00:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (13, 1, 'testTask', 'test', 'renren', 0, 'renren', 1005, to_date('27-12-2017 19:30:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (14, 1, 'testTask', 'test', 'renren', 0, 'renren', 1008, to_date('27-12-2017 20:00:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (15, 1, 'testTask', 'test', 'renren', 0, 'renren', 1007, to_date('27-12-2017 20:30:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (16, 1, 'testTask', 'test', 'renren', 0, 'renren', 1007, to_date('27-12-2017 21:00:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (17, 1, 'testTask', 'test', 'renren', 0, 'renren', 1009, to_date('27-12-2017 21:30:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (18, 1, 'testTask', 'test', 'renren', 0, 'renren', 1009, to_date('27-12-2017 22:00:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (19, 1, 'testTask', 'test', 'renren', 0, 'renren', 1007, to_date('27-12-2017 22:30:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (20, 1, 'testTask', 'test', 'renren', 0, 'renren', 1007, to_date('27-12-2017 23:00:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (21, 1, 'testTask', 'test', 'renren', 0, 'renren', 1008, to_date('27-12-2017 23:30:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (22, 1, 'testTask', 'test', 'renren', 0, 'renren', 1007, to_date('28-12-2017', 'dd-mm-yyyy'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (23, 1, 'testTask', 'test', 'renren', 0, 'renren', 1007, to_date('28-12-2017 00:30:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (24, 1, 'testTask', 'test', 'renren', 0, 'renren', 1007, to_date('28-12-2017 01:00:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (25, 1, 'testTask', 'test', 'renren', 0, 'renren', 1007, to_date('28-12-2017 01:30:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (26, 1, 'testTask', 'test', 'renren', 0, 'renren', 1008, to_date('28-12-2017 02:00:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (27, 1, 'testTask', 'test', 'renren', 0, 'renren', 1008, to_date('28-12-2017 02:30:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (28, 1, 'testTask', 'test', 'renren', 0, 'renren', 1008, to_date('28-12-2017 03:00:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (29, 1, 'testTask', 'test', 'renren', 0, 'renren', 1009, to_date('28-12-2017 03:30:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (30, 1, 'testTask', 'test', 'renren', 0, 'renren', 1007, to_date('28-12-2017 04:00:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (31, 1, 'testTask', 'test', 'renren', 0, 'renren', 1007, to_date('28-12-2017 04:30:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (32, 1, 'testTask', 'test', 'renren', 0, 'renren', 1004, to_date('28-12-2017 05:00:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (33, 1, 'testTask', 'test', 'renren', 0, 'renren', 1008, to_date('28-12-2017 05:30:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (34, 1, 'testTask', 'test', 'renren', 0, 'renren', 1007, to_date('28-12-2017 06:00:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (35, 1, 'testTask', 'test', 'renren', 0, 'renren', 1009, to_date('28-12-2017 06:30:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (36, 1, 'testTask', 'test', 'renren', 0, 'renren', 1008, to_date('28-12-2017 07:00:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (37, 1, 'testTask', 'test', 'renren', 0, 'renren', 1008, to_date('28-12-2017 07:30:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (38, 1, 'testTask', 'test', 'renren', 0, 'renren', 1007, to_date('28-12-2017 08:00:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (39, 1, 'testTask', 'test', 'renren', 0, 'renren', 1009, to_date('28-12-2017 08:30:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (40, 1, 'testTask', 'test', 'renren', 0, 'renren', 1009, to_date('28-12-2017 09:00:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (41, 1, 'testTask', 'test', 'renren', 0, 'renren', 1008, to_date('28-12-2017 09:30:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (42, 1, 'testTask', 'test', 'renren', 0, 'renren', 1007, to_date('28-12-2017 10:00:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (43, 1, 'testTask', 'test', 'renren', 0, 'renren', 1008, to_date('28-12-2017 10:30:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (44, 1, 'testTask', 'test', 'renren', 0, 'renren', 1007, to_date('28-12-2017 11:00:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (45, 1, 'testTask', 'test', 'renren', 0, 'renren', 1006, to_date('28-12-2017 11:30:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (46, 1, 'testTask', 'test', 'renren', 0, 'renren', 1008, to_date('28-12-2017 12:00:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (47, 1, 'testTask', 'test', 'renren', 0, 'renren', 1007, to_date('28-12-2017 12:30:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (48, 1, 'testTask', 'test', 'renren', 0, 'renren', 1007, to_date('28-12-2017 13:00:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (49, 1, 'testTask', 'test', 'renren', 0, 'renren', 1007, to_date('28-12-2017 13:30:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (50, 1, 'testTask', 'test', 'renren', 0, 'renren', 1004, to_date('28-12-2017 14:00:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (51, 1, 'testTask', 'test', 'renren', 0, 'renren', 1004, to_date('28-12-2017 14:30:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (52, 1, 'testTask', 'test', 'renren', 0, 'renren', 1007, to_date('28-12-2017 15:00:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (53, 1, 'testTask', 'test', 'renren', 0, 'renren', 1007, to_date('28-12-2017 15:30:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into SCHEDULE_JOB_LOG (LOG_ID, JOB_ID, BEAN_NAME, METHOD_NAME, PARAMS, STATUS, ERROR, TIMES, CREATE_TIME)
values (54, 1, 'testTask', 'test', 'renren', 0, 'renren', 1007, to_date('28-12-2017 16:00:00', 'dd-mm-yyyy hh24:mi:ss'));
  
  
 

insert into SYS_CONFIG (ID, KEY, VALUE, STATUS, REMARK)
values (1, 'CLOUD_STORAGE_CONFIG_KEY', '{"aliyunAccessKeyId":"","aliyunAccessKeySecret":"","aliyunBucketName":"","aliyunDomain":"","aliyunEndPoint":"","aliyunPrefix":"","qcloudBucketName":"","qcloudDomain":"","qcloudPrefix":"","qcloudSecretId":"","qcloudSecretKey":"","qiniuAccessKey":"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ","qiniuBucketName":"ios-app","qiniuDomain":"http://7xqbwh.dl1.z0.glb.clouddn.com","qiniuPrefix":"upload","qiniuSecretKey":"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV","type":1}', 0, '云存储配置信息');

insert into SYS_CONFIG (ID, KEY, VALUE, STATUS, REMARK)
values (2, 'swither', 'off', 1, '开关');


insert into SYS_LOG (ID, USERNAME, OPERATION, METHOD, PARAMS, TIME, IP, CREATE_DATE)
values (1000000002, 'admin', '修改用户', 'com.ai.ysm.sys.controller.SysUserController.update()', '{"code":"2123","name":"123","classId":123}', 95, '127.0.0.1', to_date('10-01-2018 10:48:46', 'dd-mm-yyyy hh24:mi:ss'));





set feedback on
set define on
prompt Done.
