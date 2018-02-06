alter table MED_EVENTTYPE add ISCREATINGMEDICALLOG varchar2(1);
UPDATE MED_EVENTTYPE SET ISCREATINGMEDICALLOG  = '0';
COMMIT;
alter table MED_EVENTTYPE modify ISCREATINGMEDICALLOG not null;

create table MED_MEDICALLOGGING
(
  MEDICALLOGGINGID number(38) not null,
  COMPANYID        number(38) not null,
  SERVICEID        number(38) not null,
  USERNAME         varchar2(20) not null,
  REMOTEADDRESS    varchar2(20),
  REMOTEHOST       varchar2(20),
  PORTNUMBER       varchar2(4),
  LOGDATE          date not null,
  LOGTIME          timestamp(6) not null,
  VERSIONNO        number(38) not null
)
;
alter table MED_MEDICALLOGGING
  add constraint MED_MEDICALLOGGING_PK primary key (MEDICALLOGGINGID, COMPANYID);
alter table MED_MEDICALLOGGING
  add constraint MEDLOGGING_SERVICE_FK foreign key (SERVICEID, COMPANYID)
  references med_service (SERVICEID, COMPANYID);
alter table MED_MEDICALLOGGING
  add constraint MEDLOGGING_USER_FK foreign key (USERNAME, COMPANYID)
  references sys_user (USERNAME, COMPANYID);

create index MEDLOGGING_SERVICE_FK on MED_MEDICALLOGGING (serviceid, companyid);
create index MEDLOGGING_USER_FK on MED_MEDICALLOGGING (username, companyid);

create table MED_MEDICALLOGVALUE
(
  MEDICALLOGGINGID  number(38) not null,
  MEDICALLOGVALUEID number(38) not null,
  COMPANYID         number(38) not null,
  VERSIONNO         number(38) not null,
  TABLENAME         number(38) not null,
  LOGGEDVALUE       clob
)
;

alter table MED_MEDICALLOGVALUE
  add constraint MED_MEDICALLOGVALUE_PK primary key (MEDICALLOGVALUEID, COMPANYID);
alter table MED_MEDICALLOGVALUE
  add constraint MEDLOGVAL_MEDLOGGING_FK foreign key (MEDICALLOGGINGID, COMPANYID)
  references med_medicallogging (MEDICALLOGGINGID, COMPANYID);

create index MEDLOGVAL_MEDLOGGING_FK on MED_MEDICALLOGVALUE (medicalloggingid, companyid);

create table MED_MEDICALLOGVALUELOB
(
  MEDICALLOGVALUEID    number(38) not null,
  MEDICALLOGVALUELOBID number(38) not null,
  COMPANYID            number(38) not null,
  VERSIONNO            number(38) not null,
  OBSERVATIONID        number(38) not null,
  ACTION               number(38) not null,
  LOBVALUE             blob
)
;

alter table MED_MEDICALLOGVALUELOB
  add constraint MED_MEDICALLOGVALUELOB_PK primary key (MEDICALLOGVALUELOBID, COMPANYID);
alter table MED_MEDICALLOGVALUELOB
  add constraint MEDLOGVAL_MEDLOGVALLOB_FK foreign key (MEDICALLOGVALUEID, COMPANYID)
  references med_medicallogvalue (MEDICALLOGVALUEID, COMPANYID);

create index MEDOBS_MEDLOGVALLOB on MED_MEDICALLOGVALUELOB (observationid, companyid);
create index MEDLOGVAL_MEDLOGVALLOB_FK on MED_MEDICALLOGVALUELOB (medicallogvalueid, companyid);

alter table MED_EVENTTYPE add ISCREATINGMEDICALLOG varchar2(1);
UPDATE MED_EVENTTYPE SET ISCREATINGMEDICALLOG = '0';
COMMIT;
alter table MED_EVENTTYPE modify ISCREATINGMEDICALLOG not null;

alter table MED_SERVICE add ISDELETED varchar2(1);
alter table MED_MEDICALPROC add ISDELETED varchar2(1);
alter table MED_OBSERVATION add ISDELETED varchar2(1);
alter table MED_OBSERVATIONTAG add ISDELETED varchar2(1);
alter table MED_OBSERVATIONLOB add ISDELETED varchar2(1);
alter table MED_SERVICEDOCTOR add ISDELETED varchar2(1);
alter table MED_SERVICESTATUSLOG add ISDELETED varchar2(1);

------------ med_service ------------
create or replace procedure upd_med_service_isdeleted is
  cursor med_service_cur is
    select serviceid, companyid, fyearid, isdeleted
    from med_service;
  med_service_rec med_service_cur%ROWTYPE;

counter integer;
begin
  open med_service_cur;
  counter := 0;
  loop
    fetch med_service_cur into med_service_rec;
    exit when med_service_cur%NOTFOUND;

        update med_service set
          isdeleted = '0'
          where serviceid = med_service_rec.serviceid and
            companyid = med_service_rec.companyid;

      if (counter >= 1000) then
        commit;
        counter :=0;
      else
        counter := counter + 1;
      end if;


  end loop;
  commit;

  close med_service_cur;


end upd_med_service_isdeleted;
/
-------- med_medicalProc ------------
create or replace procedure upd_med_medicalproc_isdeleted is
  cursor med_medicalproc_cur is
    select medicalprocid, companyid, fyearid, isdeleted
    from med_medicalproc;
  med_medicalproc_rec med_medicalproc_cur%ROWTYPE;

counter integer;
begin
  open med_medicalproc_cur;
  counter := 0;
  loop
    fetch med_medicalproc_cur into med_medicalproc_rec;
    exit when med_medicalproc_cur%NOTFOUND;

        update med_medicalproc set
          isdeleted = '0'
          where medicalprocid = med_medicalproc_rec.medicalprocid and
            companyid = med_medicalproc_rec.companyid;

      if (counter >= 1000) then
        commit;
        counter :=0;
      else
        counter := counter + 1;
      end if;


  end loop;
  commit;

  close med_medicalproc_cur;


end upd_med_medicalproc_isdeleted;
/
-------------- med_observation -----------------
create or replace procedure upd_med_observation_isdeleted is
  cursor med_observation_cur is
    select observationid, companyid, fyearid, isdeleted
    from med_observation;
  med_observation_rec med_observation_cur%ROWTYPE;

counter integer;
begin
  open med_observation_cur;
  counter := 0;
  loop
    fetch med_observation_cur into med_observation_rec;
    exit when med_observation_cur%NOTFOUND;

        update med_observation set
          isdeleted = '0'
          where observationid = med_observation_rec.observationid and
            companyid = med_observation_rec.companyid;

      if (counter >= 1000) then
        commit;
        counter :=0;
      else
        counter := counter + 1;
      end if;


  end loop;
  commit;

  close med_observation_cur;


end upd_med_observation_isdeleted;
/
-------------- med_observationlob --------------

create or replace procedure upd_med_observlob_isdeleted is
  cursor med_observationlob_cur is
    select observationid, companyid, isdeleted
    from med_observationlob;
  med_observationlob_rec med_observationlob_cur%ROWTYPE;

counter integer;
begin
  open med_observationlob_cur;
  counter := 0;
  loop
    fetch med_observationlob_cur into med_observationlob_rec;
    exit when med_observationlob_cur%NOTFOUND;

        update med_observationlob set
          isdeleted = '0'
          where observationid = med_observationlob_rec.observationid and
            companyid = med_observationlob_rec.companyid;

      if (counter >= 1000) then
        commit;
        counter :=0;
      else
        counter := counter + 1;
      end if;


  end loop;
  commit;

  close med_observationlob_cur;


end upd_med_observlob_isdeleted;
/
---------------------------------
begin
  -- Call the procedure
  upd_med_service_isdeleted;
end;
/

begin
  -- Call the procedure
  upd_med_medicalproc_isdeleted;
end;
/

begin
  -- Call the procedure
  upd_med_observation_isdeleted;
end;
/

UPDATE MED_OBSERVATIONTAG SET ISDELETED = '0';
COMMIT;
alter table MED_OBSERVATIONTAG modify ISDELETED not null;

UPDATE MED_SERVICEDOCTOR SET ISDELETED = '0';
COMMIT;
alter table MED_SERVICEDOCTOR modify ISDELETED not null;

UPDATE MED_SERVICESTATUSLOG SET ISDELETED = '0';
COMMIT;
alter table MED_SERVICESTATUSLOG modify ISDELETED not null;

--create 1 row for every med_service as starting Log
-- Create sequence
create sequence MED_MEDICALLOGGING_SEQ
minvalue 1
maxvalue 999999999999
start with 1
increment by 1
nocache;

insert into med_medicallogging (medicalloggingid, companyid, serviceid, username, logdate, logtime, versionno)
  select med_medicallogging_seq.nextval, companyid, serviceid, 'ELIAS', servicedate,
  decode(med_service.servicetime, null, to_timestamp('00:00', 'HH24:MI'), med_service.servicetime) , 1
    from med_service;

commit;
alter table MED_SERVICE  modify ISDELETED not null;
alter table MED_MEDICALPROC modify ISDELETED not null;
alter table MED_OBSERVATION modify ISDELETED not null;
alter table MED_OBSERVATIONLOB modify ISDELETED not null;

alter table MED_SERVICE add versionno number(38);
update med_service set versionno = 1;
commit;
alter table MED_SERVICE  modify versionno not null;
