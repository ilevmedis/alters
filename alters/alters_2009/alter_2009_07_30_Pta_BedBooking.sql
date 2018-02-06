
create table PTA_BEDBOOKING
(
  BEDBOOKINGID number(38) not null,
  COMPANYID number(38) not null,
  FYEARID number(38) not null,
  BEDFACILITYID varchar2(40) not null,
  SINCEDATE date not null,
  SINCETIME TIMESTAMP not null,
  TILLDATE date,
  TILLTIME TIMESTAMP,
  BOOKINGREASONINDICATOR number(38) not null,
  BOOKINGCOMMENTS varchar2(150) not null,
  COMMENTS varchar2(200)
);

alter table PTA_BEDBOOKING
  add constraint PK_PTA_BEDBOOKING primary key (bedbookingid,companyid,fyearid);
alter table PTA_BEDBOOKING
  add constraint FK_BEDBOOKING_FACILITY foreign key (bedfacilityid,companyid,fyearid)
  references pta_facility (facilityid,companyid,fyearid);
