create or replace function calculateLastPrice(companyid_criteria in int, 
  invitemid_criteria in int, calcdate_criteria in date, withvat_criteria in int) return float is
  result float;

  cursor lastprice_cur is
    SELECT INV_TRANSDETAIL.TOTALAMOUNT,INV_TRANSDETAIL.NETAMOUNT,INV_TRANSDETAIL.QUA,INV_TRANSDETAIL.QUARELATION
      FROM INV_TRANSDETAIL  WHERE INV_TRANSDETAIL.INVTRANSDETAILID IN  (SELECT MAX(INV_TRANSDETAIL.INVTRANSDETAILID) FROM INV_TRANSDETAIL WHERE INV_TRANSDETAIL.COMPANYID=companyid_criteria AND INV_TRANSDETAIL.INVITEMID=invitemid_criteria AND INV_TRANSDETAIL.UPDATESLASTPRICE='1'
      AND INV_TRANSDETAIL.INTERNALEVENTDATE IN (SELECT MAX(INV_TRANSDETAIL.INTERNALEVENTDATE) FROM INV_TRANSDETAIL
      WHERE INV_TRANSDETAIL.COMPANYID=companyid_criteria AND INV_TRANSDETAIL.INVITEMID=invitemid_criteria AND INV_TRANSDETAIL.UPDATESLASTPRICE='1' AND INV_TRANSDETAIL.INTERNALEVENTDATE<=calcdate_criteria))
      ORDER BY INV_TRANSDETAIL.LINENUM ASC;
  lastprice_rec lastprice_cur%ROWTYPE;

begin
  open lastprice_cur;
  fetch lastprice_cur into lastprice_rec;
  if (lastprice_cur%FOUND) then
    if (withvat_criteria=1) then
      result := lastprice_rec.totalamount / lastprice_rec.qua / lastprice_rec.quarelation;
    else
      result := lastprice_rec.netamount / lastprice_rec.qua / lastprice_rec.quarelation;
    end if;
  else
    result := 0;
  end if;
  close lastprice_cur;

  return(result);
end calculateLastPrice;
