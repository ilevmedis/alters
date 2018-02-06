alter table plg_budgetresstatuslog add (fyearid number(38), erpeventtypeid number(38), plgeventtypeid number(38), moduleid varchar2(10), 
  plgeventid number(38), journaruleheaderid number(38), internaleventno varchar2(20));

alter table plg_budgetresstatuslog 
  add constraint erp_eventtype_budresstatus_fk 
  foreign key (erpeventtypeid, fyearid, companyid)
  references erp_eventtype (erpeventtypeid, fyearid, companyid);  
alter table plg_budgetresstatuslog 
  add constraint plg_eventtype_budresstatus_fk 
  foreign key (plgeventtypeid, fyearid, companyid, moduleid)
  references plg_eventtype (plgeventtypeid, fyearid, companyid, moduleid);
alter table plg_budgetresstatuslog 
  add constraint plg_event_budresstatus_fk 
  foreign key (plgeventid, fyearid, companyid)
  references plg_event (plgeventid, fyearid, companyid);  
alter table glg_journalruleheader
  add constraint glg_jrnrulehd_budresstatus_fk
  foreign key (journalruleheaderid, fyearid, companyid)
  references glg_journalruleheader (journalruleheaderid, fyearid, companyid);  

create index plg_event_budresstatus_fk on plg_budgetresstatuslog (plgeventtypeid, fyearid, companyid, moduleid);

create or replace procedure upd_budgetresstatus is
  cursor plg_budgetresstatuslog_cur is
    select * from plg_budgetresstatuslog for update;
  plg_budgetresstatuslog_rec plg_budgetresstatuslog_cur%ROWTYPE;
  
  erpeventtypeid_var erp_eventtype.erpeventtypeid%TYPE;
  erpeventid_var erp_event.erpeventid%TYPE;
  
  plgeventtypeid_var plg_eventtype.plgeventtypeid%TYPE;
  plgeventid_var plg_event.plgeventid%TYPE;
  
  fyearid_var erp_event.fyearid%TYPE;
begin
  -- TODO CHANGE TO CORRECT EVENTTYPES
  erpeventtypeid_var := 50;
  plgeventtypeid_var := 3;
  -- TODO CHANGE FYEARID FROM 2009 TO 2011
  fyearid_var := 2009;

  update plg_budgetresstatuslog 
    set internaleventno = (select approvalno from plg_budgetresheader where 
      plg_budgetresheader.budgetresheaderid = plg_budgetresstatuslog.budgetresheaderid and
      plg_budgetresheader.companyid = plg_budgetresstatuslog.companyid);
  update plg_budgetresstatuslog set fyearid = fyearid_var, plgeventtypeid = plgeventtypeid_var,       
    erpeventtypeid = erpeventtypeid_var, moduleid = 'PLG';
      
  open plg_budgetresstatuslog_cur;
  loop
    fetch plg_budgetresstatuslog_cur into plg_budgetresstatuslog_rec;
    exit when plg_budgetresstatuslog_cur%NOTFOUND;
    
    select erp_event_seq.nextval into erpeventid_var from dual;    
    insert into erp_event(fyearid, erpeventid, companyid, 
        eventdate, erpeventtypeid, isdeleted, moduleid)
      values (fyearid_var, erpeventid_var, plg_budgetresstatuslog_rec.companyid, 
        plg_budgetresstatuslog_rec.statuschangedate, erpeventtypeid_var, '0', 'PLG');
        
    select plg_event_seq.nextval into plgeventid_var from dual;
    insert into plg_event(fyearid, erpeventid, companyid, plgeventid, 
      erpeventtypeid, internaleventdate, moduleid, 
      plgeventtypeid, internaleventno, isdeleted)
        values(fyearid_var, erpeventid_var, plg_budgetresstatuslog_rec.companyid, plgeventid_var, 
          erpeventtypeid_var, plg_budgetresstatuslog_rec.statuschangedate, 'PLG',  
          plgeventtypeid_var, plg_budgetresstatuslog_rec.internaleventno, '0');
    
    update plg_budgetresstatuslog set plgeventid = plgeventid_var where CURRENT OF plg_budgetresstatuslog_cur;

  end loop;
  close plg_budgetresstatuslog_cur;
  commit;
end upd_budgetresstatus;

alter table plg_budgetresstatuslog modify (fyearid not null, erpeventtypeid not null, plgeventtypeid not null, moduleid not null, 
  plgeventid not null);
  