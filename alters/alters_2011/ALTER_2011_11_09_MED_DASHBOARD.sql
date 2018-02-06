alter table med_dashboarditem add (isdisplayedaschart varchar2(1), servicemasters varchar2(1000), servicemastergroupingid number(38), servicemastergroupingcode varchar2(40));
alter table med_dashboarditem modify obsparams varchar2(1000);
update med_dashboarditem set isdisplayedaschart = '0';
commit;
alter table med_dashboarditem modify isdisplayedaschart not null;
