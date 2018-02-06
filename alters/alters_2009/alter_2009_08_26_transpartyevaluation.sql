create table fin_occupationcertificate(companyid number(38) not null,
  fyearid number(38) not null, occupationid number(38) not null,
  occupationcertificateid number(38) not null,
  mnemonic varchar2(20) not null, descr varchar2(50) not null);
alter table fin_occupationcertificate add constraint
  fin_occupationcertificate_pk primary key (occupationcertificateid, companyid, fyearid);
alter table fin_occupationcertificate add constraint
  fin_occupation_certificate_fk foreign key (occupationid, companyid, fyearid)
  references fin_occupation(occupationid, companyid, fyearid)
  on delete cascade;

create table fin_transpartycertificate(companyid number(38) not null,
  fyearid number(38) not null, fintranspartyid number(38) not null,
  transpartycertificateid number(38) not null,
  occupationcertificateid number(38) not null,
  receiptdate date,
  validsincedate date not null, validtilldate date,
  comments varchar2(100), decisionno varchar2(30));
alter table fin_transpartycertificate add constraint
  fin_transpartycertificate_pk primary key (transpartycertificateid, companyid, fyearid);
alter table fin_transpartycertificate add constraint
  occupationcert_transpcert_fk foreign key (occupationcertificateid, companyid, fyearid)
  references fin_occupationcertificate(occupationcertificateid, companyid, fyearid);
alter table fin_transpartycertificate add constraint
  transparty_transpcert_fk foreign key (fintranspartyid, companyid, fyearid)
  references fin_transparty(fintranspartyid, companyid, fyearid)
  on delete cascade;

create table fin_transpartyevaluation(companyid number(38) not null,
  fyearid number(38) not null, fintranspartyid number(38) not null,
  transpartyevaluationid number(38) not null,
  evaluationdate date not null, evaluationoutcomeindicator number(38) not null,
  evaluationdescr varchar2(250),
  comments varchar2(100));
alter table fin_transpartyevaluation add constraint
  fin_transpartyevaluation_pk primary key (transpartyevaluationid, companyid, fyearid);
alter table fin_transpartyevaluation add constraint
  transparty_transpeval_fk foreign key (fintranspartyid, companyid, fyearid)
  references fin_transparty(fintranspartyid, companyid, fyearid)
  on delete cascade;

alter table fin_transparty add (cooperationstartdate date, cooperationenddate date);