alter table FIN_TRANSDETAIL add iscanceltransaction varchar2(1);
alter table FIN_TRANSDETAIL add ispartiallycanceltransaction varchar2(1);

update fin_transdetail
  set iscanceltransaction = '0', ispartiallycanceltransaction = '0';

update fin_transdetail
  set iscanceltransaction =
    (select apy.iscanceled from fin_transdetail apy
       where apy.fintransdetailid = fin_transdetail.canceledfintransdetailid
         and apy.fyearid = fin_transdetail.canceledtransfyearid
         and apy.companyid = fin_transdetail.companyid),
  ispartiallycanceltransaction =
    (select apy.ispartiallycanceled from fin_transdetail apy
       where apy.fintransdetailid = fin_transdetail.canceledfintransdetailid
         and apy.fyearid = fin_transdetail.canceledtransfyearid
         and apy.companyid = fin_transdetail.companyid)
  where isdebit = '1' and canceledfintransheaderid <> 0;
commit;

alter table FIN_TRANSDETAIL modify ISCANCELTRANSACTION not null;
alter table FIN_TRANSDETAIL modify ISPARTIALLYCANCELTRANSACTION not null;
