alter table fin_transheader add (noofdecimals number(38), ischargecancel varchar2(1));
update fin_transheader set noofdecimals = 2 where eventtypeindicator in (3,4,5,6);
update fin_transheader set ischargecancel = '0';
update fin_transheader set ischargecancel = '1' where exists
  (select fineventtypeid from fin_eventtype where
    fin_eventtype.fineventtypeid = fin_transheader.fineventtypeid
    and fin_eventtype.companyid = fin_transheader.companyid
    and fin_eventtype.fyearid = fin_transheader.fyearid
    and fin_eventtype.ischargecancel = '1');
commit;
alter table fin_transheader modify ischargecancel not null;
alter table fin_transdetail add netamountbeforeround float(126);
update fin_transdetail set netamountbeforeround = netamount where eventtypeindicator in (3,4,5,6);
