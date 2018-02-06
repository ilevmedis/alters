alter table fin_transdetail add visitfyearid number(38);

UPDATE FIN_TRANSDETAIL SET VISITFYEARID=FYEARID WHERE  (VISITID IS NOT NULL OR VISITCOVERDETAILID IS NOT NULL OR
CHARGECOVERID IS NOT NULL OR CHARGEDETAILID IS NOT NULL);

 --Create/Recreate primary, unique and foreign key constraints
alter table FIN_TRANSDETAIL
 drop constraint VISITCOVERDT_FINTRANSDETAIL;

alter table FIN_TRANSDETAIL
 add constraint VISITCOVERDT_FINTRANSDETAIL foreign key (visitcoverdetailid,companyid,visitfyearid)
references PBL_VISITCOVERDETAIL (VISITCOVERDETAILID,COMPANYID,FYEARID);



-- Create/Recreate primary, unique and foreign key constraints
alter table FIN_TRANSDETAIL
 drop constraint CHARGEDT_TRANSDT;

alter table FIN_TRANSDETAIL
 add constraint CHARGEDT_TRANSDT foreign key (chargedetailid,companyid,visitfyearid)
 references PBL_CHARGEDETAIL (CHARGEDETAILID,COMPANYID,FYEARID);



-- Create/Recreate primary, unique and foreign key constraints

alter table FIN_TRANSDETAIL
 drop constraint VISIT_FINTRANSDETAIL;

alter table FIN_TRANSDETAIL
 add constraint VISIT_FINTRANSDETAIL foreign key (VISITID,COMPANYID,VISITFYEARID)
references pta_visit (visitid,companyid,fyearid);

 -- Create/Recreate primary, unique and foreign key constraints
alter table FIN_TRANSDETAIL
 drop constraint CHARGECOVER_FINTRANSDETAIL;

alter table FIN_TRANSDETAIL
  add constraint CHARGECOVER_FINTRANSDETAIL foreign key (CHARGECOVERID,COMPANYID,VISITFYEARID)
  references pbl_chargecover (CHARGECOVERID,COMPANYID,FYEARID);

  ALTER TABLE FIN_TRANSDETAIL ADD  CANCELEDTRANSFYEARID NUMBER(38);

UPDATE FIN_TRANSDETAIL SET CANCELEDTRANSFYEARID = FYEARID WHERE (CANCELEDFINTRANSHEADERID IS NOT NULL) OR
(CANCELEDFINTRANSDETAILID IS NOT NULL);

-- Create/Recreate primary, unique and foreign key constraints
alter table FIN_TRANSDETAIL
  add constraint CANCELEDHEADER_FINTRANSDETAIL foreign key (canceledfintransheaderid,companyid,CANCELEDTRANSFYEARID)
  references fin_transheader (fintransheaderid,companyid,fyearid);

alter table FIN_TRANSDETAIL
  add constraint CANCELEDDETAIL_FINTRANSDETAIL foreign key (canceledfintransDETAILid,companyid,CANCELEDTRANSFYEARID)
  references fin_transDETAIL (fintransDETAILid,companyid,fyearid);


ALTER TABLE FIN_TRANSHEADER ADD CANCELEDTRANSFYEARID NUMBER(38);

UPDATE FIN_TRANSHEADER SET CANCELEDTRANSFYEARID = FYEARID WHERE (CANCELEDFINTRANSHEADERID IS NOT NULL) ;


alter table FIN_TRANSHEADER drop constraint FINTRANSHD_FINTRANSHD;
  
alter table FIN_TRANSHEADER
  add constraint CANCELEDHEADER_FINTRANSHEADER foreign key (canceledfintransheaderid,companyid,CANCELEDTRANSFYEARID)
  references fin_transheader (fintransheaderid,companyid,fyearid);

create index VISIT_INDX ON  FIN_TRANSDETAIL (VISITID,companyid,VISITFYEARID);


create index CHARGECOVER_INDX ON  FIN_TRANSDETAIL (CHARGECOVERID,companyid,VISITFYEARID);


create index CHARGEDETAIL_INDX ON  FIN_TRANSDETAIL (CHARGEDETAILID,companyid,VISITFYEARID);


Create index VISITCOVER_INDX ON  FIN_TRANSDETAIL (VISITCOVERDETAILID,companyid,VISITFYEARID);


create index CANCELEDDT_INDX ON  FIN_TRANSDETAIL (canceledfintransDETAILid,companyid,CANCELEDTRANSFYEARID);

create index CANCELEDHD_INDX ON  FIN_TRANSDETAIL (canceledfintransheaderid,companyid,CANCELEDTRANSFYEARID);

create index CANCELED_INDX ON  FIN_TRANSHEADER (canceledfintransheaderid,companyid,CANCELEDTRANSFYEARID);

-- FETCH REPORTS TO CHECK
select reportid, moduleid, descr,
  instr(upper(dbms_lob.substr(sqlstmt,4000)),'.VISITID') VISITIDPOS, instr(upper(dbms_lob.substr(sqlstmt,4000)),'.CHARGEDETAILID') CHARGEDETAILIDPOS,
  instr(upper(dbms_lob.substr(sqlstmt,4000)),'.CHARGECOVERID') CHARGECOVERIDPOS, instr(upper(dbms_lob.substr(sqlstmt,4000)),'.VISITCOVERDETAILID') VISITCOVERDETAILIDPOS
  from sys_report
  where (instr(upper(dbms_lob.substr(sqlstmt,4000)),'.VISITID')>0 and instr(upper(dbms_lob.substr(sqlstmt,4000)),'FIN_TRANSDETAIL')>0) or
  (instr(upper(dbms_lob.substr(sqlstmt,4000)),'.CHARGEDETAILID')>0 and instr(upper(dbms_lob.substr(sqlstmt,4000)),'FIN_TRANSDETAIL')>0) or
  (instr(upper(dbms_lob.substr(sqlstmt,4000)),'.CHARGECOVERID')>0 and instr(upper(dbms_lob.substr(sqlstmt,4000)),'FIN_TRANSDETAIL')>0) or
  (instr(upper(dbms_lob.substr(sqlstmt,4000)),'.VISITCOVERDETAILID')>0 and instr(upper(dbms_lob.substr(sqlstmt,4000)),'FIN_TRANSDETAIL')>0)