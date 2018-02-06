create table pbl_reqheaderdapy(
  reqheaderid number(38) not null,
  companyid number(38) not null,
  dapycontents clob not null
);
alter table pbl_reqheaderdapy
  add constraint pbl_reqheaderdapy_pk
  primary key(reqheaderid, companyid);
alter table pbl_reqheaderdapy
  add constraint pbl_reqheader_dapy_fk
  foreign key (reqheaderid, companyid)
  references pbl_reqheader(reqheaderid, companyid)
  on delete cascade;

create table pbl_reqheaderdapyerror(
  dapyerrorid number(38) not null,
  reqheaderid number(38) not null,
  reqdetailid number(38) not null,
  companyid number(38) not null,
  dapyline number(38) not null,
  errortypeindicator number(38) not null,
  errordescr varchar2(200) not null,
  visitid number(38) not null,
  visitfyearid number(38) not null,
  fintransdetailid number(38),
  fintransheaderid number(38) not null,
  fintransheaderfyearid number(38) not null,
  finitemid number(38),
  facilityid varchar2(40),
  insuranceschemeheaderid number(38),
  doctorid number(38),
  outcomeid number(38),
  metadatavalueid number(38),
  levelid number(38),
  chargedetailid number(38),
  chargeheaderid number(38)
);
alter table pbl_reqheaderdapyerror
  add constraint pbl_reqheaderdapyerror_pk
  primary  key(dapyerrorid, companyid);
alter table pbl_reqheaderdapyerror
  add constraint pbl_reqheader_dapyerror_fk
  foreign key (reqheaderid, companyid)
  references pbl_reqheader(reqheaderid, companyid)
  on delete cascade;

alter table pbl_dapy add (finitemid number(38), psllinenum number(38), zsllinenum number(38),
  fintransheaderid number(38), fintransheaderfyearid number(38), fintransheaderinternaleventno varchar2(20));
