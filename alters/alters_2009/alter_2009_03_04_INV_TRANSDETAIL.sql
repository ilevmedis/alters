alter table inv_transdetail add (noofprintedlabels number(38));
alter table inv_transdetail add islabelsprinted varchar2(1);
update inv_transdetail set islabelsprinted='0';
commit;
alter table inv_transdetail modify islabelsprinted not null;
create index inv_transdt_islabelsprinted on inv_transdetail (companyid, fyearid, islabelsprinted);