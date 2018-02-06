--DELETE DOUBLE FINTRANSDEBITS FROM PRINTEDSTATUS BUG

DELETE FROM FIN_TRANSDETAIL  A
WHERE  A.ISDEBIT='1'  and a.amountdebit is null and a.fintranspartyid is null
and a.paymentwayindicator is null and a.accountid is null and a.plgaccountid is null and a.banknoteid is null
and a.amountcredit is null and a.bankaccountid is null and a.vatid is null and a.vatamount is null
and a.vatperc is null and a.chargedetailid is null and a.chargecoverid is null and a.prevbanknotestatusid is null
and a.newbanknotestatusid is null  ;

COMMIT;
