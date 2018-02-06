alter table pbl_chargedetail add (servicedate date);
update pbl_chargedetail set servicedate = chargedate;
commit;
alter table pbl_chargedetail modify (servicedate not null);

alter table pbl_chargeheader add (servicedate date);
update pbl_chargeheader set servicedate = chargedate;
commit;
alter table pbl_chargeheader modify (servicedate not null);

alter table pbl_chargedetail add canceldetailid number(38);
alter table pbl_chargedetail add constraint pbl_chargedt_cancelchargedt
  foreign key (canceldetailid, companyid, fyearid) references pbl_chargedetail(chargedetailid, companyid, fyearid);

alter table pbl_chargeheader add cancelreasonindicator number(38);