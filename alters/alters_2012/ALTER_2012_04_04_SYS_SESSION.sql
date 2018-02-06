create table sys_session(
  sessionpk number(38) not null,
  appsrv varchar2(50) not null,
  portnumber number(38) not null,
  sessionid varchar2(50) not null,
  username varchar2(20) not null,
  ipaddress varchar2(50) not null,
  logintime timestamp(6),
  logouttime timestamp(6),
  lastpingtime timestamp(6)
  );
alter table sys_session add constraint sys_session_pk primary key(sessionpk);
