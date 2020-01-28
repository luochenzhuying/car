prompt PL/SQL Developer import file
prompt Created on 2019��10��16�� by LINING
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
values ('��10006', '��֩��', '��ɫ', 500, 3000, 5000, '�ѳ���', '�ų����ɫ��', 'jingdian.jpg');
insert into CARS (CARNUMBER, CARTYPE, COLOR, PRICE, RENTPRICE, DEPOSIT, ISRENTING, CARDESC, CARIMG)
values ('��00000', '����ԽҰ', '��ɫ', 300000, 100000, 200000, 'δ����', '����ר������', 'jipu.jpg');
insert into CARS (CARNUMBER, CARTYPE, COLOR, PRICE, RENTPRICE, DEPOSIT, ISRENTING, CARDESC, CARIMG)
values ('��10004', '�ӳ���', '�ٻ�ɫ', 20000, 5000, 10000, 'δ����', '�������ܣ��ݻ���Ʒ��', 'oragle.jpg');
insert into CARS (CARNUMBER, CARTYPE, COLOR, PRICE, RENTPRICE, DEPOSIT, ISRENTING, CARDESC, CARIMG)
values ('��10001', 'С�ͳ�', '��ɫ', 10000, 500, 100, '�ѳ���', '����һ��ǳ�Ư���ķ����������', 'red.jpg');
insert into CARS (CARNUMBER, CARTYPE, COLOR, PRICE, RENTPRICE, DEPOSIT, ISRENTING, CARDESC, CARIMG)
values ('��10002', '���ͳ�', '��ɫ', 20000, 1000, 300, '�ѳ���', '����������ذ�', 'blue.jpg');
insert into CARS (CARNUMBER, CARTYPE, COLOR, PRICE, RENTPRICE, DEPOSIT, ISRENTING, CARDESC, CARIMG)
values ('��10003', '���ͳ�', '��ɫ', 30000, 2000, 500, 'δ����', '��ɫ����', 'dark.jpg');
insert into CARS (CARNUMBER, CARTYPE, COLOR, PRICE, RENTPRICE, DEPOSIT, ISRENTING, CARDESC, CARIMG)
values ('��10005', 'ģ�ͳ�', '��ɫ', 50000, 10000, 20000, '�ѳ���', '�˳��Ǹ����ֻ������', 'model.jpg');
commit;
prompt 7 records loaded
prompt Loading ROLES...
insert into ROLES (ROLEID, ROLENAME)
values (1, '����Ա');
insert into ROLES (ROLEID, ROLENAME)
values (2, '�����û�');
insert into ROLES (ROLEID, ROLENAME)
values (3, '��ʽ�û�');
commit;
prompt 3 records loaded
prompt Loading USERS...
insert into USERS (USERNAME, IDENTITY, FULLNAME, SEX, ADDRESS, PHONE, POSITION, USERLEVEL, USERPWD)
values ('zhou', '2547963215', '�ܹ�һ', '��', '�����к�����', '13569824651', '����Ա', 2, '123');
insert into USERS (USERNAME, IDENTITY, FULLNAME, SEX, ADDRESS, PHONE, POSITION, USERLEVEL, USERPWD)
values ('li', '5214658746', '��͢��', '��', '�����к�����', '14236582451', '����Ա', 3, '123');
insert into USERS (USERNAME, IDENTITY, FULLNAME, SEX, ADDRESS, PHONE, POSITION, USERLEVEL, USERPWD)
values ('yuan', '12345678', 'Ԭǰ��', '��', '������ͨ����', '18870421108', '����Ա', 1, '123');
insert into USERS (USERNAME, IDENTITY, FULLNAME, SEX, ADDRESS, PHONE, POSITION, USERLEVEL, USERPWD)
values ('zhang', '3654215846', '�����', '��', '�����к�����', '12365485621', '����Ա', 2, '123');
commit;
prompt 4 records loaded
prompt Loading CUSTOMERS...
insert into CUSTOMERS (IDENTITY, CUSTNAME, SEX, ADDRESS, PHONE, CAREER, CUSTPWD)
values ('1001', '����', '��', '�����в�ƽ��', '15326984512', 'ѧ��', null);
insert into CUSTOMERS (IDENTITY, CUSTNAME, SEX, ADDRESS, PHONE, CAREER, CUSTPWD)
values ('1002', '����', '��', '�����в�ƽ��', '18563241253', '����', null);
insert into CUSTOMERS (IDENTITY, CUSTNAME, SEX, ADDRESS, PHONE, CAREER, CUSTPWD)
values ('1003', '����', 'Ů', '�����г�����', '51236478954', '����Ա', null);
commit;
prompt 3 records loaded
prompt Loading RENTTABLE...
insert into RENTTABLE (TABLEID, IMPREST, SHOULDPAYPRICE, PRICE, BEGINDATE, SHOULDRETURNDATE, RETURNDATE, RENTFLAG, CUSTID, CARID, USERID)
values (20171016151010, 5000, 30000, 50000, to_date('16-10-2017', 'dd-mm-yyyy'), to_date('01-11-2017', 'dd-mm-yyyy'), to_date('16-10-2017', 'dd-mm-yyyy'), 0, '1001', '��00000', 'yuan');
insert into RENTTABLE (TABLEID, IMPREST, SHOULDPAYPRICE, PRICE, BEGINDATE, SHOULDRETURNDATE, RETURNDATE, RENTFLAG, CUSTID, CARID, USERID)
values (20171016152054, 600, 1000, 5000, to_date('17-10-2017', 'dd-mm-yyyy'), to_date('04-11-2017', 'dd-mm-yyyy'), null, 1, '1003', '��10005', 'yuan');
insert into RENTTABLE (TABLEID, IMPREST, SHOULDPAYPRICE, PRICE, BEGINDATE, SHOULDRETURNDATE, RETURNDATE, RENTFLAG, CUSTID, CARID, USERID)
values (20171016151557, 7000, 20000, 30000, to_date('17-10-2017', 'dd-mm-yyyy'), to_date('28-10-2017', 'dd-mm-yyyy'), to_date('16-10-2017', 'dd-mm-yyyy'), 0, '1002', '��10006', 'yuan');
insert into RENTTABLE (TABLEID, IMPREST, SHOULDPAYPRICE, PRICE, BEGINDATE, SHOULDRETURNDATE, RETURNDATE, RENTFLAG, CUSTID, CARID, USERID)
values (20171016152517, 1000, 2000, 10000, to_date('17-10-2017', 'dd-mm-yyyy'), to_date('30-10-2017', 'dd-mm-yyyy'), null, 1, '1002', '��10001', 'yuan');
insert into RENTTABLE (TABLEID, IMPREST, SHOULDPAYPRICE, PRICE, BEGINDATE, SHOULDRETURNDATE, RETURNDATE, RENTFLAG, CUSTID, CARID, USERID)
values (20171016152612, 600, 1500, 5000, to_date('18-10-2017', 'dd-mm-yyyy'), to_date('03-11-2017', 'dd-mm-yyyy'), null, 1, '1001', '��10002', 'yuan');
insert into RENTTABLE (TABLEID, IMPREST, SHOULDPAYPRICE, PRICE, BEGINDATE, SHOULDRETURNDATE, RETURNDATE, RENTFLAG, CUSTID, CARID, USERID)
values (20171016151934, 2000, 5000, 10000, to_date('17-10-2017', 'dd-mm-yyyy'), to_date('26-10-2017', 'dd-mm-yyyy'), null, 1, '1001', '��10006', 'yuan');
insert into RENTTABLE (TABLEID, IMPREST, SHOULDPAYPRICE, PRICE, BEGINDATE, SHOULDRETURNDATE, RETURNDATE, RENTFLAG, CUSTID, CARID, USERID)
values (20171016151633, 800, 3000, 5000, to_date('16-10-2017', 'dd-mm-yyyy'), to_date('27-10-2017', 'dd-mm-yyyy'), to_date('16-10-2017', 'dd-mm-yyyy'), 0, '1003', '��10004', 'yuan');
insert into RENTTABLE (TABLEID, IMPREST, SHOULDPAYPRICE, PRICE, BEGINDATE, SHOULDRETURNDATE, RETURNDATE, RENTFLAG, CUSTID, CARID, USERID)
values (20171016152018, 1000, 3000, 5000, to_date('16-10-2017', 'dd-mm-yyyy'), to_date('02-11-2017', 'dd-mm-yyyy'), to_date('16-10-2017', 'dd-mm-yyyy'), 0, '1002', '��10003', 'yuan');
commit;
prompt 8 records loaded
prompt Loading CHECKTABLE...
insert into CHECKTABLE (CHECKID, CHECKDATE, FIELD, PROBLEM, PAYING, CHECKUSERID, RENTID)
values (20171016152650, to_date('16-10-2017', 'dd-mm-yyyy'), '��', '��', 0, 'yuan', 20171016152018);
insert into CHECKTABLE (CHECKID, CHECKDATE, FIELD, PROBLEM, PAYING, CHECKUSERID, RENTID)
values (20171016151919, to_date('16-10-2017', 'dd-mm-yyyy'), '��', '��', 0, 'yuan', 20171016151633);
insert into CHECKTABLE (CHECKID, CHECKDATE, FIELD, PROBLEM, PAYING, CHECKUSERID, RENTID)
values (20171016151810, to_date('16-10-2017', 'dd-mm-yyyy'), '��', '��', 0, 'yuan', 20171016151010);
insert into CHECKTABLE (CHECKID, CHECKDATE, FIELD, PROBLEM, PAYING, CHECKUSERID, RENTID)
values (20171016151849, to_date('16-10-2017', 'dd-mm-yyyy'), '��', '��', 0, 'yuan', 20171016151557);
commit;
prompt 4 records loaded
prompt Loading MENUS...
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (20, '�޸Ľ�ɫȨ��', 'systemManager/modifyRoleManager.jsp', 18);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (1, '�������޹���ϵͳ', null, -1);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (2, '�û�����', null, 1);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (3, '����û�', 'users/addUser.jsp', 2);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (4, '��ѯ�û�', 'users/findUser.jsp', 2);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (5, '�ͻ�����', null, 1);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (6, '��ӿͻ�', 'customers/addCustomer.jsp', 5);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (7, '��ѯ�ͻ�', 'customers/findCustomers.jsp', 5);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (8, '��������', null, 1);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (9, '�������', 'cars/addCar.jsp', 8);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (10, '��ѯ����', 'cars/findCars.jsp', 8);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (11, 'ҵ�����', null, 1);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (12, '��������', 'carservice/rentCar.jsp', 11);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (13, '�������', 'carservice/returnCar.jsp', 11);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (14, '���ⵥ����', 'rentManager/findRent.jsp', 11);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (15, '��鵥����', 'checkManager/findReturn.jsp', 11);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (16, 'ҵ��ͳ��', null, 1);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (17, '����Ӧ������', 'rent/MonthStatisticsCar.do', 16);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (18, 'ϵͳ����', null, 1);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (19, '��ӽ�ɫ', 'systemManager/roleManager.jsp', 18);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (21, '��־����', 'systemManager/findLog.jsp', 18);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (22, '��½��Ϣ����', 'systemManager/findLoginInfo.jsp', 18);
commit;
prompt 22 records loaded
prompt Loading FUNS...
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (202, '��ѯ��ɫӵ�е�Ȩ����Ϣ', 'role/FindRoleMenu.do', 20);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (203, '��ѯ��ɫû�е�Ȩ����Ϣ', 'role/FindRoleMenuNo.do', 20);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (204, '�޸Ľ�ɫȨ�޶���', 'role/modifyRoleMenu.do', 20);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (49, '��ѯ�û����֤����', 'user/findIdentity.do', 3);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (32, '����û�����', 'user/addUser.do', 3);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (41, 'Ԥ��ѯ�û�ҳ��', 'users/findUser.jsp', 2);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (1, '��ҳ��', 'index.jsp', 1);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (2, '��¼ҳ��', 'login.jsp', 1);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (3, '��¼ϵͳ����', 'user/login.do', 1);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (4, '�˳�ϵͳ����', 'user/logout.do', 1);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (5, '������ʾ�ɹ�ҳ��', 'tips.jsp', 1);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (31, '����û�ҳ��', 'users/addUser.jsp', 2);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (42, '�߼���ѯ�û�����', 'user/findUsers.do', 4);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (43, 'չʾ��ѯ�û�ҳ��', 'users/showUsers.jsp', 4);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (44, '������ѯ�û�����', 'user/SelectUser.do', 4);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (45, 'Ԥ�޸��û�����', 'user/SelectUser.do', 4);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (46, 'ɾ���û�����', 'user/DeleteUser.do', 4);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (47, '�޸��û���Ϣҳ��', 'users/updateUser.jsp', 4);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (48, '�޸��û���Ϣ����', 'user/ModifyUser.do', 4);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (33, '��ѯ�û���¼������', 'user/findName.do', 3);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (21, '��ѯ���н�ɫ��Ϣ', 'role/FindRole.do', 2);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (6, '��Ȩ����ʾҳ��', 'error.jsp', 1);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (61, '��ӿͻ�ҳ��', 'customers/addCustomer.jsp', 5);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (62, '��ӿͻ�����', 'customer/addCustomer.do', 6);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (63, '��ѯ�ͻ����֤����', 'customer/findIdentity.do', 6);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (71, 'Ԥ��ѯ�ͻ�ҳ��', 'customers/findCustomers.jsp', 5);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (72, '�߼���ѯ�ͻ�����', 'customer/findCustomers.do', 7);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (73, 'չʾ��ѯ�ͻ�ҳ��', 'customers/showCustomers.jsp', 7);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (74, '������ѯ�ͻ�����', 'customer/SelectCustomer.do', 7);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (75, 'Ԥ�޸Ŀͻ�����', 'customer/SelectCustomer.do', 7);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (76, 'ɾ���ͻ�����', 'customer/DeleteCustomer.do', 7);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (77, '�޸Ŀͻ���Ϣҳ��', 'customers/updateCustomer.jsp', 7);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (78, '�޸Ŀͻ���Ϣ����', 'customer/ModifyCustomer.do', 7);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (91, '�������ҳ��', 'cars/addCar.jsp', 8);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (92, '�����������', 'car/addCar.do', 9);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (93, '��ѯ�������Ŷ���', 'car/findCarNumber.do', 9);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (101, 'Ԥ��ѯ����ҳ��', 'cars/findCars.jsp', 8);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (102, '�߼���ѯ��������', 'car/findCar.do', 10);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (103, 'չʾ��ѯ����ҳ��', 'cars/showCars.jsp', 10);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (104, '������ѯ��������', 'car/SelectCar.do', 10);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (105, 'Ԥ�޸���������', 'car/SelectCar.do', 10);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (106, 'ɾ����������', 'car/DeleteCar.do', 10);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (107, '�޸�������Ϣҳ��', 'cars/updateCar.jsp', 10);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (108, '�޸�������Ϣ����', 'car/ModifyCar.do', 10);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (121, 'Ԥ��������ҳ��', 'carservice/rentCar.jsp', 11);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (122, '��֤�ͻ����֤����', 'customer/queryCustomer.do', 12);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (123, '��������ҳ��', 'carservice/createRenting.jsp', 12);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (124, '������������', 'rent/addRent.do', 12);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (131, '�������ҳ��', 'carservice/returnCar.jsp', 11);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (132, '��֤���ⵥ����', 'rent/queryTableId.do', 13);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (133, '�黹����ҳ��', 'carservice/createRenturning.jsp', 13);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (134, '�黹��������', 'check/addCheck.do', 13);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (141, 'Ԥ��ѯ���ⵥҳ��', 'rentManager/findRent.jsp', 11);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (142, '�߼���ѯ���ⵥ����', 'rent/findRents.do', 14);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (143, 'չʾ��ѯ���ⵥҳ��', 'rentManager/showRents.jsp', 14);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (144, '������ѯ���ⵥ����', 'rent/SelectRent.do', 14);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (145, 'Ԥ�޸ĳ��ⵥ����', 'rent/SelectRent.do', 14);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (146, 'ɾ�����ⵥ����', 'rent/DeleteRent.do', 14);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (147, '�޸ĳ��ⵥ��Ϣҳ��', 'rentManager/updateRent.jsp', 14);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (148, '�޸ĳ��ⵥ��Ϣ����', 'rent/ModifyRent.do', 14);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (151, 'Ԥ��ѯ��鵥ҳ��', 'checkManager/findReturn.jsp', 11);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (152, '�߼���ѯ��鵥����', 'check/findChecks.do', 15);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (153, 'չʾ��ѯ��鵥ҳ��', 'checkManager/showReturn.jsp', 15);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (154, '������ѯ��鵥����', 'check/SelectCheck.do', 15);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (155, 'Ԥ�޸ļ�鵥����', 'check/SelectCheck.do', 15);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (156, 'ɾ����鵥����', 'check/DeleteCheck.do', 15);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (157, '�޸ļ�鵥��Ϣҳ��', 'checkManager/updateReturn.jsp', 15);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (158, '�޸ļ�鵥��Ϣ����', 'check/ModifyReturn.do', 15);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (171, '����Ӧ����������', 'rent/MonthStatisticsCar.do', 16);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (172, '����Ӧ������ҳ��', 'carservice/theCurrentMonth.jsp', 17);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (173, '����Ӧ������������ѯ����', 'rent/SelectRUC.do', 17);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (174, '����Ӧ������������ѯҳ��', 'carservice/findMonthReturnCar.jsp', 17);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (191, '��ӽ�ɫҳ��', 'systemManager/roleManager.jsp', 18);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (192, '��ӽ�ɫ����', 'role/addRole.do', 19);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (125, '��ѯ������������', 'car/queryCars.do', 12);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (193, '��ѯ���н�ɫ����', 'role/FindRole.do', 18);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (201, '�޸Ľ�ɫȨ��ҳ��', 'systemManager/modifyRoleManager.jsp', 18);
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
