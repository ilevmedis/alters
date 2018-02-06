alter table PBL_DAPY drop primary key;

alter table PBL_DAPY add dapyid number(38);

create sequence pbl_dapy_seq
minvalue 1
maxvalue 999999999999
start with 1
increment by 1
nocache;

update pbl_dapy
  set dapyid = pbl_dapy_seq.nextval;
  commit;

alter table PBL_DAPY
  add constraint pbl_dapy_pk primary key (DAPYID, COMPANYID);

create index req_visit_linenum_indx on PBL_DAPY (REQHEADERID, COMPANYID, VISITID, VISITFYEARID, LINENUM);

