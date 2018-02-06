create table med_dashboard(dashboardid number(38) not null, companyid number(38) not null, mnemonic varchar2(20), descr varchar2(100), comments varchar2(200));
alter table med_dashboard add constraint med_dashboard_pk primary key (dashboardid, companyid);
create table med_dashboarditem(dashboarditemid number(38) not null, dashboardid number(38) not null, companyid number(38) not null,
   title varchar2(40) not null, ordersequence number(38), isinpanel varchar2(1) not null, reportid number(38), fetchallpatientdata varchar2(1) not null,
   obsparams varchar2(100), noofrowsperpage number(38), href varchar2(100), isaddingnewservice varchar2(1) not null, servicemasterid number(38));
alter table med_dashboarditem add constraint med_dashboarditem_pk primary key (dashboarditemid, companyid);
alter table med_dashboarditem add constraint med_dashboard_dashboarditem_fk
   foreign key (dashboardid, companyid)
   references med_dashboard(dashboardid, companyid)
   on delete cascade;
alter table med_dashboarditem add constraint med_servicemaster_dashbitem_fk
   foreign key (servicemasterid, companyid)
   references med_servicemaster(servicemasterid, companyid)
   on delete cascade;
create index med_dashboard_dashboarditem_fk on med_dashboarditem(dashboardid, companyid);
create index med_servicemaster_dashbitem_fk on med_dashboarditem(servicemasterid, companyid);
