prompt PL/SQL Developer import file
prompt Created on 2019年10月16日 by LINING
set feedback off
set define off
prompt Dropping CARS...
drop table CARS cascade constraints;
prompt Dropping ROLES...
drop table ROLES cascade constraints;
prompt Dropping USERS...
drop table USERS cascade constraints;
prompt Dropping CUSTOMERS...
drop table CUSTOMERS cascade constraints;
prompt Dropping RENTTABLE...
drop table RENTTABLE cascade constraints;
prompt Dropping CHECKTABLE...
drop table CHECKTABLE cascade constraints;
prompt Dropping MENUS...
drop table MENUS cascade constraints;
prompt Dropping FUNS...
drop table FUNS cascade constraints;
prompt Dropping LOGINLOGS...
drop table LOGINLOGS cascade constraints;
prompt Dropping LOGS...
drop table LOGS cascade constraints;
prompt Dropping ROLES_MENUS...
drop table ROLES_MENUS cascade constraints;
prompt Creating CARS...
create table CARS
(
  CARNUMBER VARCHAR2(20) not null,
  CARTYPE   VARCHAR2(50) not null,
  COLOR     VARCHAR2(10) not null,
  PRICE     NUMBER(10,2) not null,
  RENTPRICE NUMBER(10,2) not null,
  DEPOSIT   NUMBER(10,2) not null,
  ISRENTING VARCHAR2(20) not null,
  CARDESC   VARCHAR2(500),
  CARIMG    VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CARS
  add constraint CARS_PK primary key (CARNUMBER)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ROLES...
create table ROLES
(
  ROLEID   NUMBER not null,
  ROLENAME VARCHAR2(20) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROLES
  add constraint ROLES_PK primary key (ROLEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating USERS...
create table USERS
(
  USERNAME  VARCHAR2(40) not null,
  IDENTITY  VARCHAR2(20) not null,
  FULLNAME  VARCHAR2(20) not null,
  SEX       VARCHAR2(10) not null,
  ADDRESS   VARCHAR2(40) not null,
  PHONE     VARCHAR2(20) not null,
  POSITION  VARCHAR2(20) not null,
  USERLEVEL NUMBER not null,
  USERPWD   VARCHAR2(40) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table USERS
  add constraint USERS_PK primary key (USERNAME)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table USERS
  add constraint USERS_UK unique (IDENTITY)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table USERS
  add constraint USERS_FK foreign key (USERLEVEL)
  references ROLES (ROLEID);

prompt Creating CUSTOMERS...
create table CUSTOMERS
(
  IDENTITY VARCHAR2(20) not null,
  CUSTNAME VARCHAR2(40) not null,
  SEX      VARCHAR2(10) not null,
  ADDRESS  VARCHAR2(100) not null,
  PHONE    VARCHAR2(20) not null,
  CAREER   VARCHAR2(20) not null,
  CUSTPWD  VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CUSTOMERS
  add constraint CUSTOMERS_PK primary key (IDENTITY)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating RENTTABLE...
create table RENTTABLE
(
  TABLEID          NUMBER not null,
  IMPREST          NUMBER(10,2) not null,
  SHOULDPAYPRICE   NUMBER(10,2) not null,
  PRICE            NUMBER(10,2) not null,
  BEGINDATE        DATE not null,
  SHOULDRETURNDATE DATE not null,
  RETURNDATE       DATE,
  RENTFLAG         NUMBER not null,
  CUSTID           VARCHAR2(20) not null,
  CARID            VARCHAR2(20) not null,
  USERID           VARCHAR2(40) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table RENTTABLE
  add constraint RENTTABLE_PK primary key (TABLEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table RENTTABLE
  add constraint RENTTABLE_CUSTIONERS_FK3 foreign key (USERID)
  references USERS (USERNAME);
alter table RENTTABLE
  add constraint RENTTABLE_CUSTOMERS_FK1 foreign key (CUSTID)
  references CUSTOMERS (IDENTITY);
alter table RENTTABLE
  add constraint RENTTABLE_CUSTONERS_FK2 foreign key (CARID)
  references CARS (CARNUMBER);

prompt Creating CHECKTABLE...
create table CHECKTABLE
(
  CHECKID     NUMBER not null,
  CHECKDATE   DATE not null,
  FIELD       VARCHAR2(100),
  PROBLEM     VARCHAR2(100),
  PAYING      NUMBER(10,2),
  CHECKUSERID VARCHAR2(40) not null,
  RENTID      NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CHECKTABLE
  add constraint CHECKTABLE_PK primary key (CHECKID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CHECKTABLE
  add constraint CHECKTABLE_RENTTABLE_FK2 foreign key (RENTID)
  references RENTTABLE (TABLEID);
alter table CHECKTABLE
  add constraint CHECKTABLE_USERS_FK1 foreign key (CHECKUSERID)
  references USERS (USERNAME);

prompt Creating MENUS...
create table MENUS
(
  MENUID   NUMBER not null,
  MENUNAME VARCHAR2(40) not null,
  CONNURL  VARCHAR2(80),
  FATHERID NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MENUS
  add constraint MENUS_PK primary key (MENUID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating FUNS...
create table FUNS
(
  FUNID   NUMBER not null,
  FUNNAME VARCHAR2(40) not null,
  FUNURL  VARCHAR2(80) not null,
  MENUID  NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table FUNS
  add constraint FUNS_PK primary key (FUNID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table FUNS
  add constraint FUNS_FK foreign key (MENUID)
  references MENUS (MENUID);

prompt Creating LOGINLOGS...
create table LOGINLOGS
(
  LOGINLOGID NUMBER not null,
  LOGINNAME  VARCHAR2(80),
  LOGINIP    VARCHAR2(40),
  LOGINTIME  DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table LOGINLOGS
  add constraint LOGINLOGS_PK primary key (LOGINLOGID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating LOGS...
create table LOGS
(
  ID         NUMBER not null,
  USERNAME   VARCHAR2(40) not null,
  ACTION     VARCHAR2(40) not null,
  ACTIONTIME DATE not null,
  FLAG       NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating ROLES_MENUS...
create table ROLES_MENUS
(
  ROLEID NUMBER not null,
  MENUID NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROLES_MENUS
  add constraint ROLES_MENUS_PK primary key (ROLEID, MENUID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROLES_MENUS
  add constraint ROLES_MENUS_FK1 foreign key (ROLEID)
  references ROLES (ROLEID)
  disable;
alter table ROLES_MENUS
  add constraint ROLES_MENUS_FK2 foreign key (MENUID)
  references MENUS (MENUID)
  disable;

prompt Disabling triggers for CARS...
alter table CARS disable all triggers;
prompt Disabling triggers for ROLES...
alter table ROLES disable all triggers;
prompt Disabling triggers for USERS...
alter table USERS disable all triggers;
prompt Disabling triggers for CUSTOMERS...
alter table CUSTOMERS disable all triggers;
prompt Disabling triggers for RENTTABLE...
alter table RENTTABLE disable all triggers;
prompt Disabling triggers for CHECKTABLE...
alter table CHECKTABLE disable all triggers;
prompt Disabling triggers for MENUS...
alter table MENUS disable all triggers;
prompt Disabling triggers for FUNS...
alter table FUNS disable all triggers;
prompt Disabling triggers for LOGINLOGS...
alter table LOGINLOGS disable all triggers;
prompt Disabling triggers for LOGS...
alter table LOGS disable all triggers;
prompt Disabling triggers for ROLES_MENUS...
alter table ROLES_MENUS disable all triggers;
prompt Disabling foreign key constraints for USERS...
alter table USERS disable constraint USERS_FK;
prompt Disabling foreign key constraints for RENTTABLE...
alter table RENTTABLE disable constraint RENTTABLE_CUSTIONERS_FK3;
alter table RENTTABLE disable constraint RENTTABLE_CUSTOMERS_FK1;
alter table RENTTABLE disable constraint RENTTABLE_CUSTONERS_FK2;
prompt Disabling foreign key constraints for CHECKTABLE...
alter table CHECKTABLE disable constraint CHECKTABLE_RENTTABLE_FK2;
alter table CHECKTABLE disable constraint CHECKTABLE_USERS_FK1;
prompt Disabling foreign key constraints for FUNS...
alter table FUNS disable constraint FUNS_FK;
prompt Loading CARS...
insert into CARS (CARNUMBER, CARTYPE, COLOR, PRICE, RENTPRICE, DEPOSIT, ISRENTING, CARDESC, CARIMG)
values ('浙10006', '红蜘蛛', '红色', 500, 3000, 5000, '已出租', '炫出你的色彩', 'jingdian.jpg');
insert into CARS (CARNUMBER, CARTYPE, COLOR, PRICE, RENTPRICE, DEPOSIT, ISRENTING, CARDESC, CARIMG)
values ('军00000', '吉普越野', '绿色', 300000, 100000, 200000, '未出租', '军人专用座驾', 'jipu.jpg');
insert into CARS (CARNUMBER, CARTYPE, COLOR, PRICE, RENTPRICE, DEPOSIT, ISRENTING, CARDESC, CARIMG)
values ('京10004', '加长型', '橘黄色', 20000, 5000, 10000, '未出租', '尊贵的享受，奢华的品质', 'oragle.jpg');
insert into CARS (CARNUMBER, CARTYPE, COLOR, PRICE, RENTPRICE, DEPOSIT, ISRENTING, CARDESC, CARIMG)
values ('云10001', '小型车', '红色', 10000, 500, 100, '已出租', '这是一款非常漂亮的法拉利经典款', 'red.jpg');
insert into CARS (CARNUMBER, CARTYPE, COLOR, PRICE, RENTPRICE, DEPOSIT, ISRENTING, CARDESC, CARIMG)
values ('苏10002', '中型车', '蓝色', 20000, 1000, 300, '已出租', '兰博基尼珍藏版', 'blue.jpg');
insert into CARS (CARNUMBER, CARTYPE, COLOR, PRICE, RENTPRICE, DEPOSIT, ISRENTING, CARDESC, CARIMG)
values ('赣10003', '大型车', '黑色', 30000, 2000, 500, '未出租', '黑色商务车', 'dark.jpg');
insert into CARS (CARNUMBER, CARTYPE, COLOR, PRICE, RENTPRICE, DEPOSIT, ISRENTING, CARDESC, CARIMG)
values ('京10005', '模型车', '黄色', 50000, 10000, 20000, '已出租', '此车是概念车，只供欣赏', 'model.jpg');
commit;
prompt 7 records loaded
prompt Loading ROLES...
insert into ROLES (ROLEID, ROLENAME)
values (1, '管理员');
insert into ROLES (ROLEID, ROLENAME)
values (2, '测试用户');
insert into ROLES (ROLEID, ROLENAME)
values (3, '正式用户');
commit;
prompt 3 records loaded
prompt Loading USERS...
insert into USERS (USERNAME, IDENTITY, FULLNAME, SEX, ADDRESS, PHONE, POSITION, USERLEVEL, USERPWD)
values ('zhou', '2547963215', '周广一', '男', '北京市海淀区', '13569824651', '管理员', 2, '123');
insert into USERS (USERNAME, IDENTITY, FULLNAME, SEX, ADDRESS, PHONE, POSITION, USERLEVEL, USERPWD)
values ('li', '5214658746', '李廷建', '男', '北京市海淀区', '14236582451', '管理员', 3, '123');
insert into USERS (USERNAME, IDENTITY, FULLNAME, SEX, ADDRESS, PHONE, POSITION, USERLEVEL, USERPWD)
values ('yuan', '12345678', '袁前兼', '男', '北京市通州区', '18870421108', '管理员', 1, '123');
insert into USERS (USERNAME, IDENTITY, FULLNAME, SEX, ADDRESS, PHONE, POSITION, USERLEVEL, USERPWD)
values ('zhang', '3654215846', '张振邦', '男', '北京市海淀区', '12365485621', '管理员', 2, '123');
commit;
prompt 4 records loaded
prompt Loading CUSTOMERS...
insert into CUSTOMERS (IDENTITY, CUSTNAME, SEX, ADDRESS, PHONE, CAREER, CUSTPWD)
values ('1001', '张三', '男', '北京市昌平区', '15326984512', '学生', null);
insert into CUSTOMERS (IDENTITY, CUSTNAME, SEX, ADDRESS, PHONE, CAREER, CUSTPWD)
values ('1002', '李四', '男', '北京市昌平区', '18563241253', '白领', null);
insert into CUSTOMERS (IDENTITY, CUSTNAME, SEX, ADDRESS, PHONE, CAREER, CUSTPWD)
values ('1003', '王二', '女', '北京市朝阳区', '51236478954', '公务员', null);
commit;
prompt 3 records loaded
prompt Loading RENTTABLE...
insert into RENTTABLE (TABLEID, IMPREST, SHOULDPAYPRICE, PRICE, BEGINDATE, SHOULDRETURNDATE, RETURNDATE, RENTFLAG, CUSTID, CARID, USERID)
values (20171016151010, 5000, 30000, 50000, to_date('16-10-2017', 'dd-mm-yyyy'), to_date('01-11-2017', 'dd-mm-yyyy'), to_date('16-10-2017', 'dd-mm-yyyy'), 0, '1001', '军00000', 'yuan');
insert into RENTTABLE (TABLEID, IMPREST, SHOULDPAYPRICE, PRICE, BEGINDATE, SHOULDRETURNDATE, RETURNDATE, RENTFLAG, CUSTID, CARID, USERID)
values (20171016152054, 600, 1000, 5000, to_date('17-10-2017', 'dd-mm-yyyy'), to_date('04-11-2017', 'dd-mm-yyyy'), null, 1, '1003', '京10005', 'yuan');
insert into RENTTABLE (TABLEID, IMPREST, SHOULDPAYPRICE, PRICE, BEGINDATE, SHOULDRETURNDATE, RETURNDATE, RENTFLAG, CUSTID, CARID, USERID)
values (20171016151557, 7000, 20000, 30000, to_date('17-10-2017', 'dd-mm-yyyy'), to_date('28-10-2017', 'dd-mm-yyyy'), to_date('16-10-2017', 'dd-mm-yyyy'), 0, '1002', '浙10006', 'yuan');
insert into RENTTABLE (TABLEID, IMPREST, SHOULDPAYPRICE, PRICE, BEGINDATE, SHOULDRETURNDATE, RETURNDATE, RENTFLAG, CUSTID, CARID, USERID)
values (20171016152517, 1000, 2000, 10000, to_date('17-10-2017', 'dd-mm-yyyy'), to_date('30-10-2017', 'dd-mm-yyyy'), null, 1, '1002', '云10001', 'yuan');
insert into RENTTABLE (TABLEID, IMPREST, SHOULDPAYPRICE, PRICE, BEGINDATE, SHOULDRETURNDATE, RETURNDATE, RENTFLAG, CUSTID, CARID, USERID)
values (20171016152612, 600, 1500, 5000, to_date('18-10-2017', 'dd-mm-yyyy'), to_date('03-11-2017', 'dd-mm-yyyy'), null, 1, '1001', '苏10002', 'yuan');
insert into RENTTABLE (TABLEID, IMPREST, SHOULDPAYPRICE, PRICE, BEGINDATE, SHOULDRETURNDATE, RETURNDATE, RENTFLAG, CUSTID, CARID, USERID)
values (20171016151934, 2000, 5000, 10000, to_date('17-10-2017', 'dd-mm-yyyy'), to_date('26-10-2017', 'dd-mm-yyyy'), null, 1, '1001', '浙10006', 'yuan');
insert into RENTTABLE (TABLEID, IMPREST, SHOULDPAYPRICE, PRICE, BEGINDATE, SHOULDRETURNDATE, RETURNDATE, RENTFLAG, CUSTID, CARID, USERID)
values (20171016151633, 800, 3000, 5000, to_date('16-10-2017', 'dd-mm-yyyy'), to_date('27-10-2017', 'dd-mm-yyyy'), to_date('16-10-2017', 'dd-mm-yyyy'), 0, '1003', '京10004', 'yuan');
insert into RENTTABLE (TABLEID, IMPREST, SHOULDPAYPRICE, PRICE, BEGINDATE, SHOULDRETURNDATE, RETURNDATE, RENTFLAG, CUSTID, CARID, USERID)
values (20171016152018, 1000, 3000, 5000, to_date('16-10-2017', 'dd-mm-yyyy'), to_date('02-11-2017', 'dd-mm-yyyy'), to_date('16-10-2017', 'dd-mm-yyyy'), 0, '1002', '赣10003', 'yuan');
commit;
prompt 8 records loaded
prompt Loading CHECKTABLE...
insert into CHECKTABLE (CHECKID, CHECKDATE, FIELD, PROBLEM, PAYING, CHECKUSERID, RENTID)
values (20171016152650, to_date('16-10-2017', 'dd-mm-yyyy'), '无', '无', 0, 'yuan', 20171016152018);
insert into CHECKTABLE (CHECKID, CHECKDATE, FIELD, PROBLEM, PAYING, CHECKUSERID, RENTID)
values (20171016151919, to_date('16-10-2017', 'dd-mm-yyyy'), '无', '无', 0, 'yuan', 20171016151633);
insert into CHECKTABLE (CHECKID, CHECKDATE, FIELD, PROBLEM, PAYING, CHECKUSERID, RENTID)
values (20171016151810, to_date('16-10-2017', 'dd-mm-yyyy'), '无', '无', 0, 'yuan', 20171016151010);
insert into CHECKTABLE (CHECKID, CHECKDATE, FIELD, PROBLEM, PAYING, CHECKUSERID, RENTID)
values (20171016151849, to_date('16-10-2017', 'dd-mm-yyyy'), '无', '无', 0, 'yuan', 20171016151557);
commit;
prompt 4 records loaded
prompt Loading MENUS...
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (20, '修改角色权限', 'systemManager/modifyRoleManager.jsp', 18);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (1, '汽车租赁管理系统', null, -1);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (2, '用户管理', null, 1);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (3, '添加用户', 'users/addUser.jsp', 2);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (4, '查询用户', 'users/findUser.jsp', 2);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (5, '客户管理', null, 1);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (6, '添加客户', 'customers/addCustomer.jsp', 5);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (7, '查询客户', 'customers/findCustomers.jsp', 5);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (8, '汽车管理', null, 1);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (9, '添加汽车', 'cars/addCar.jsp', 8);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (10, '查询汽车', 'cars/findCars.jsp', 8);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (11, '业务管理', null, 1);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (12, '汽车出租', 'carservice/rentCar.jsp', 11);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (13, '汽车入库', 'carservice/returnCar.jsp', 11);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (14, '出租单管理', 'rentManager/findRent.jsp', 11);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (15, '检查单管理', 'checkManager/findReturn.jsp', 11);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (16, '业务统计', null, 1);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (17, '当月应还汽车', 'rent/MonthStatisticsCar.do', 16);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (18, '系统管理', null, 1);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (19, '添加角色', 'systemManager/roleManager.jsp', 18);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (21, '日志管理', 'systemManager/findLog.jsp', 18);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (22, '登陆信息管理', 'systemManager/findLoginInfo.jsp', 18);
commit;
prompt 22 records loaded
prompt Loading FUNS...
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (202, '查询角色拥有的权限信息', 'role/FindRoleMenu.do', 20);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (203, '查询角色没有的权限信息', 'role/FindRoleMenuNo.do', 20);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (204, '修改角色权限动作', 'role/modifyRoleMenu.do', 20);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (49, '查询用户身份证动作', 'user/findIdentity.do', 3);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (32, '添加用户动作', 'user/addUser.do', 3);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (41, '预查询用户页面', 'users/findUser.jsp', 2);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (1, '主页面', 'index.jsp', 1);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (2, '登录页面', 'login.jsp', 1);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (3, '登录系统动作', 'user/login.do', 1);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (4, '退出系统动作', 'user/logout.do', 1);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (5, '操作提示成功页面', 'tips.jsp', 1);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (31, '添加用户页面', 'users/addUser.jsp', 2);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (42, '高级查询用户动作', 'user/findUsers.do', 4);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (43, '展示查询用户页面', 'users/showUsers.jsp', 4);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (44, '单独查询用户动作', 'user/SelectUser.do', 4);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (45, '预修改用户动作', 'user/SelectUser.do', 4);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (46, '删除用户动作', 'user/DeleteUser.do', 4);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (47, '修改用户信息页面', 'users/updateUser.jsp', 4);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (48, '修改用户信息动作', 'user/ModifyUser.do', 4);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (33, '查询用户登录名动作', 'user/findName.do', 3);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (21, '查询所有角色信息', 'role/FindRole.do', 2);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (6, '无权限提示页面', 'error.jsp', 1);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (61, '添加客户页面', 'customers/addCustomer.jsp', 5);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (62, '添加客户动作', 'customer/addCustomer.do', 6);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (63, '查询客户身份证动作', 'customer/findIdentity.do', 6);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (71, '预查询客户页面', 'customers/findCustomers.jsp', 5);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (72, '高级查询客户动作', 'customer/findCustomers.do', 7);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (73, '展示查询客户页面', 'customers/showCustomers.jsp', 7);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (74, '单独查询客户动作', 'customer/SelectCustomer.do', 7);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (75, '预修改客户动作', 'customer/SelectCustomer.do', 7);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (76, '删除客户动作', 'customer/DeleteCustomer.do', 7);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (77, '修改客户信息页面', 'customers/updateCustomer.jsp', 7);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (78, '修改客户信息动作', 'customer/ModifyCustomer.do', 7);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (91, '添加汽车页面', 'cars/addCar.jsp', 8);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (92, '添加汽车动作', 'car/addCar.do', 9);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (93, '查询汽车车号动作', 'car/findCarNumber.do', 9);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (101, '预查询汽车页面', 'cars/findCars.jsp', 8);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (102, '高级查询汽车动作', 'car/findCar.do', 10);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (103, '展示查询汽车页面', 'cars/showCars.jsp', 10);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (104, '单独查询汽车动作', 'car/SelectCar.do', 10);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (105, '预修改汽车动作', 'car/SelectCar.do', 10);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (106, '删除汽车动作', 'car/DeleteCar.do', 10);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (107, '修改汽车信息页面', 'cars/updateCar.jsp', 10);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (108, '修改汽车信息动作', 'car/ModifyCar.do', 10);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (121, '预汽车出租页面', 'carservice/rentCar.jsp', 11);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (122, '验证客户身份证动作', 'customer/queryCustomer.do', 12);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (123, '出租汽车页面', 'carservice/createRenting.jsp', 12);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (124, '出租汽车动作', 'rent/addRent.do', 12);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (131, '汽车入库页面', 'carservice/returnCar.jsp', 11);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (132, '验证出租单动作', 'rent/queryTableId.do', 13);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (133, '归还汽车页面', 'carservice/createRenturning.jsp', 13);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (134, '归还汽车动作', 'check/addCheck.do', 13);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (141, '预查询出租单页面', 'rentManager/findRent.jsp', 11);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (142, '高级查询出租单动作', 'rent/findRents.do', 14);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (143, '展示查询出租单页面', 'rentManager/showRents.jsp', 14);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (144, '单独查询出租单动作', 'rent/SelectRent.do', 14);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (145, '预修改出租单动作', 'rent/SelectRent.do', 14);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (146, '删除出租单动作', 'rent/DeleteRent.do', 14);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (147, '修改出租单信息页面', 'rentManager/updateRent.jsp', 14);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (148, '修改出租单信息动作', 'rent/ModifyRent.do', 14);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (151, '预查询检查单页面', 'checkManager/findReturn.jsp', 11);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (152, '高级查询检查单动作', 'check/findChecks.do', 15);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (153, '展示查询检查单页面', 'checkManager/showReturn.jsp', 15);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (154, '单独查询检查单动作', 'check/SelectCheck.do', 15);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (155, '预修改检查单动作', 'check/SelectCheck.do', 15);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (156, '删除检查单动作', 'check/DeleteCheck.do', 15);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (157, '修改检查单信息页面', 'checkManager/updateReturn.jsp', 15);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (158, '修改检查单信息动作', 'check/ModifyReturn.do', 15);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (171, '当月应还汽车动作', 'rent/MonthStatisticsCar.do', 16);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (172, '当月应还汽车页面', 'carservice/theCurrentMonth.jsp', 17);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (173, '当月应还汽车单独查询动作', 'rent/SelectRUC.do', 17);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (174, '当月应还汽车单独查询页面', 'carservice/findMonthReturnCar.jsp', 17);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (191, '添加角色页面', 'systemManager/roleManager.jsp', 18);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (192, '添加角色动作', 'role/addRole.do', 19);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (125, '查询所有汽车动作', 'car/queryCars.do', 12);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (193, '查询所有角色动作', 'role/FindRole.do', 18);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (201, '修改角色权限页面', 'systemManager/modifyRoleManager.jsp', 18);
commit;
prompt 77 records loaded
prompt Loading LOGINLOGS...
prompt Table is empty
prompt Loading LOGS...
prompt Table is empty
prompt Loading ROLES_MENUS...
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 1);
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 2);
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 3);
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 4);
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 5);
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 6);
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 7);
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 8);
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 9);
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 10);
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 11);
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 12);
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 13);
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 14);
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 15);
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 16);
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 17);
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 18);
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 19);
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 20);
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 21);
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 22);
insert into ROLES_MENUS (ROLEID, MENUID)
values (2, 1);
insert into ROLES_MENUS (ROLEID, MENUID)
values (2, 2);
insert into ROLES_MENUS (ROLEID, MENUID)
values (2, 3);
insert into ROLES_MENUS (ROLEID, MENUID)
values (2, 5);
insert into ROLES_MENUS (ROLEID, MENUID)
values (2, 6);
insert into ROLES_MENUS (ROLEID, MENUID)
values (2, 8);
insert into ROLES_MENUS (ROLEID, MENUID)
values (2, 9);
insert into ROLES_MENUS (ROLEID, MENUID)
values (2, 11);
insert into ROLES_MENUS (ROLEID, MENUID)
values (2, 12);
insert into ROLES_MENUS (ROLEID, MENUID)
values (2, 16);
insert into ROLES_MENUS (ROLEID, MENUID)
values (2, 17);
insert into ROLES_MENUS (ROLEID, MENUID)
values (3, 1);
insert into ROLES_MENUS (ROLEID, MENUID)
values (3, 2);
insert into ROLES_MENUS (ROLEID, MENUID)
values (3, 4);
insert into ROLES_MENUS (ROLEID, MENUID)
values (3, 5);
insert into ROLES_MENUS (ROLEID, MENUID)
values (3, 7);
insert into ROLES_MENUS (ROLEID, MENUID)
values (3, 8);
insert into ROLES_MENUS (ROLEID, MENUID)
values (3, 10);
insert into ROLES_MENUS (ROLEID, MENUID)
values (3, 11);
insert into ROLES_MENUS (ROLEID, MENUID)
values (3, 14);
insert into ROLES_MENUS (ROLEID, MENUID)
values (3, 15);
commit;
prompt 43 records loaded
prompt Enabling foreign key constraints for USERS...
alter table USERS enable constraint USERS_FK;
prompt Enabling foreign key constraints for RENTTABLE...
alter table RENTTABLE enable constraint RENTTABLE_CUSTIONERS_FK3;
alter table RENTTABLE enable constraint RENTTABLE_CUSTOMERS_FK1;
alter table RENTTABLE enable constraint RENTTABLE_CUSTONERS_FK2;
prompt Enabling foreign key constraints for CHECKTABLE...
alter table CHECKTABLE enable constraint CHECKTABLE_RENTTABLE_FK2;
alter table CHECKTABLE enable constraint CHECKTABLE_USERS_FK1;
prompt Enabling foreign key constraints for FUNS...
alter table FUNS enable constraint FUNS_FK;
prompt Enabling triggers for CARS...
alter table CARS enable all triggers;
prompt Enabling triggers for ROLES...
alter table ROLES enable all triggers;
prompt Enabling triggers for USERS...
alter table USERS enable all triggers;
prompt Enabling triggers for CUSTOMERS...
alter table CUSTOMERS enable all triggers;
prompt Enabling triggers for RENTTABLE...
alter table RENTTABLE enable all triggers;
prompt Enabling triggers for CHECKTABLE...
alter table CHECKTABLE enable all triggers;
prompt Enabling triggers for MENUS...
alter table MENUS enable all triggers;
prompt Enabling triggers for FUNS...
alter table FUNS enable all triggers;
prompt Enabling triggers for LOGINLOGS...
alter table LOGINLOGS enable all triggers;
prompt Enabling triggers for LOGS...
alter table LOGS enable all triggers;
prompt Enabling triggers for ROLES_MENUS...
alter table ROLES_MENUS enable all triggers;
set feedback on
set define on
prompt Done.
