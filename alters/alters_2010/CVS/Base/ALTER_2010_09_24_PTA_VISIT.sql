alter table PTA_VISIT add (PATIENTDEBT FLOAT(126), VISITDEBT FLOAT(126), BANKNOTEDEBT FLOAT(126));
update pta_visit set visitdebt =
  (select nvl(sum(fin_transdetail.amountdebit),0)-nvl(sum(fin_transdetail.amountcredit),0)
        from fin_transdetail where
      fin_transdetail.visitid = pta_visit.visitid and fin_transdetail.companyid = pta_visit.companyid and fin_transdetail.visitfyearid = pta_visit.fyearid and
      fin_transdetail.transacteeindicator=1 and fin_transdetail.patienttypeindicator in (1,3))
      where ispatientowing = '1';
update pta_visit set patientdebt =
      (select sum(fin_transdetail.amountdebit)-sum(fin_transdetail.amountcredit) from fin_transdetail, pta_visit allvisits where
      allvisits.patientid = pta_visit.patientid and allvisits.companyid = pta_visit.companyid and
      fin_transdetail.visitid = allvisits.visitid and fin_transdetail.companyid = allvisits.companyid and fin_transdetail.fyearid = allvisits.visitfyearid and
      fin_transdetail.transacteeindicator=1 and fin_transdetail.patienttypeindicator in (1,3))
      where ispatientowing = '1';
update pta_visit set banknotedebt =
      (select nvl(sum(fin_transdetail.amountdebit),0)-nvl(sum(fin_transdetail.amountcredit),0)
        from fin_transdetail, fin_transdetail clientcredit, fin_transdetail bankdebit, fin_banknote, fin_banknotestatus
        where bankdebit.fintransheaderid = clientcredit.fintransheaderid and
         bankdebit.companyid = clientcredit.companyid and
         bankdebit.fyearid = clientcredit.fyearid and
         fin_banknote.banknoteid = bankdebit.banknoteid and
         fin_banknote.companyid = bankdebit.companyid  and
         fin_banknotestatus.banknotestatusid = fin_banknote.banknotestatusid and
         fin_banknotestatus.companyid = fin_banknote.companyid and
         fin_banknotestatus.fyearid = fin_banknote.fyearid and
         clientcredit.eventtypeindicator in (3,4,5,6,7,8) and
         clientcredit.transacteeindicator = 1 and
         bankdebit.transacteeindicator = 7 and
         clientcredit.visitid = pta_visit.visitid and
         clientcredit.companyid = pta_visit.companyid and
         clientcredit.visitfyearid = pta_visit.fyearid and
         fin_banknotestatus.isdefault = '1' and
         fin_transdetail.banknoteid = fin_banknote.banknoteid and
         fin_transdetail.companyid = fin_banknote.companyid)
      where ispatientowing = '1';
