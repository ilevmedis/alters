create table med_observationtag(observationtagid number(38) not null, companyid number(38) not null, fyearid number(38) not null, parameterid number(38) not null,
  visitid number(38) not null, serviceid number(38) not null, observationid number(38) not null, diagnosisgroupingid number(38) not null, diagnosiscodeid varchar2(40) not null);
alter table med_observationtag
  add constraint med_observationtag_pk primary key(observationtagid, companyid);
alter table med_observationtag
  add constraint med_obsparam_observationtag_fk foreign key(parameterid, companyid)
  references med_obsparam(parameterid, companyid);
alter table med_observationtag
  add constraint pta_visit_observationtag_fk foreign key(visitid, companyid, fyearid)
  references pta_visit(visitid, companyid, fyearid);
alter table med_observationtag
  add constraint med_observation_obstag_fk foreign key(observationid, companyid)
  references med_observation(observationid, companyid)
  on delete cascade;
alter table med_observationtag
  add constraint pta_diagnosiscode_obstag_fk foreign key(diagnosisgroupingid, diagnosiscodeid, companyid)
  references pta_diagnosiscode(diagnosisgroupingid, diagnosiscodeid, companyid);

create index med_obsparam_observationtag_fk on med_observationtag(parameterid, companyid);
create index pta_visit_observationtag_fk on med_observationtag(visitid, companyid, fyearid);
create index med_observation_obstag_fk on med_observationtag(observationid, companyid);
create index pta_diagnosiscode_obstag_fk on med_observationtag(diagnosisgroupingid, diagnosiscodeid, companyid);
