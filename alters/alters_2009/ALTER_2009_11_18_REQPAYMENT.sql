UPDATE FIN_TRANSDETAIL A
  SET A.PREDISCAMOUNT =  A.AMOUNTCREDIT, A.NETAMOUNT =  A.AMOUNTCREDIT, A.TOTALAMOUNT = A.AMOUNTCREDIT
  WHERE A.ISCREDIT = '1'
	  AND A.FINTRANSHEADERID IN
    (SELECT B.FINTRANSHEADERID FROM FIN_TRANSHEADER B, PBL_REQPAYHEADER PAY
      WHERE B.FINTRANSHEADERID = PAY.FINTRANSHEADERID
        AND B.COMPANYID = PAY.COMPANYID
        AND B.FYEARID = PAY.FYEARID);

UPDATE FIN_TRANSDETAIL A
  SET A.PREDISCAMOUNT =  A.AMOUNTDEBIT, A.NETAMOUNT =  A.AMOUNTDEBIT, A.TOTALAMOUNT = A.AMOUNTDEBIT
  WHERE A.ISDEBIT = '1'
	  AND A.FINTRANSHEADERID IN
    (SELECT B.FINTRANSHEADERID FROM FIN_TRANSHEADER B, PBL_REQPAYHEADER PAY
      WHERE B.FINTRANSHEADERID = PAY.FINTRANSHEADERID
        AND B.COMPANYID = PAY.COMPANYID
        AND B.FYEARID = PAY.FYEARID)

UPDATE FIN_TRANSHEADER
  SET ISREQPAYMENT='0'
WHERE FINTRANSHEADERID IN
  (SELECT PAY.FINTRANSHEADERID FROM PBL_REQPAYHEADER PAY);

DELETE FROM PBL_REQPAYHEADER;
COMMIT;

