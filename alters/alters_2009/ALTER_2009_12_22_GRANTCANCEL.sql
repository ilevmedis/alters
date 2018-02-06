alter table INV_TRANSHEADER add ISCANCELED varchar2(1);
alter table INV_TRANSHEADER add ISCANCELTRANSACTION varchar2(1);
alter table INV_TRANSHEADER add CANCELEDINVTRANSHEADERID number(38);
alter table INV_TRANSHEADER add CANCELEDFYEARID number(38);

alter table INV_TRANSHEADER
  add constraint INV_TRNSHD_CANCEL_TRNSHD foreign key (CANCELEDINVTRANSHEADERID, COMPANYID, CANCELEDFYEARID)
  references inv_transheader (INVTRANSHEADERID, COMPANYID, FYEARID);

create index filo2.INV_TRNSHD_CANCEL_TRNSHD on INV_TRANSHEADER (canceledinvtransheaderid, companyid, canceledfyearid);

UPDATE INV_TRANSHEADER
  SET ISCANCELED = 0, ISCANCELTRANSACTION = '0';
COMMIT;

alter table INV_TRANSHEADER modify ISCANCELED not null;
alter table INV_TRANSHEADER modify ISCANCELTRANSACTION not null;

alter table INV_TRANSDETAIL add ISCANCELED varchar2(1);
alter table INV_TRANSDETAIL add ISCANCELTRANSACTION varchar2(1);
alter table INV_TRANSDETAIL add CANCELEDINVTRANSDETAILID number(38);
alter table INV_TRANSDETAIL add CANCELEDFYEARID number(38);

alter table INV_TRANSDETAIL
  add constraint INV_TRNSDT_CANCEL_TRNSDT foreign key (CANCELEDINVTRANSDETAILID, COMPANYID, CANCELEDFYEARID)
  references inv_transdetail (INVTRANSDETAILID, COMPANYID, FYEARID);

create index INV_TRNSDT_CANCEL_TRNSDT on INV_TRANSDETAIL (canceledinvtransdetailid, companyid, canceledfyearid);

UPDATE INV_TRANSDETAIL
  SET ISCANCELED = 0, ISCANCELTRANSACTION = '0';
COMMIT;

alter table INV_TRANSDETAIL modify ISCANCELED not null;
alter table INV_TRANSDETAIL modify ISCANCELTRANSACTION not null;