alter table med_dashboard add (owner varchar2(20), isdefault varchar2(1));
alter table med_dashboard add constraint sys_user_med_dashboard_fk
  foreign key (owner, companyid)
  references sys_user(username, companyid);
create index sys_user_med_dashboard_fk on med_dashboard(owner, companyid);
update med_dashboard set owner = 'ELIAS', isdefault = '0';
commit;
alter table med_dashboard modify (owner not null, isdefault not null);

alter table med_dashboarditem add (isautorefresh varchar2(1), autorefreshinterval number(38));
update med_dashboarditem set isautorefresh = '0';
commit;
alter table med_dashboarditem modify isautorefresh not null;

