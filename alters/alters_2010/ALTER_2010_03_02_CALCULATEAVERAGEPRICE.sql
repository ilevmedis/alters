create or replace function calculateAveragePrice(companyid_criteria in int, fyearid_criteria in int, 
  invitemid_criteria in int, calcdate_criteria in date, withvat_criteria in int) return float is
  result float;

  cursor averageprice_cur is
    SELECT SUM(INV_TRANSDETAIL.NETAMOUNT*INV_TRANSDETAIL.VALUEOPER*INV_TRANSDETAIL.BALANCEOPERIN) SUMNETAMOUNT,
      SUM(INV_TRANSDETAIL.TOTALAMOUNT*INV_TRANSDETAIL.VALUEOPER*INV_TRANSDETAIL.BALANCEOPERIN) SUMTOTALAMOUNT,
      SUM(INV_TRANSDETAIL.QUA*INV_TRANSDETAIL.QUAOPER*INV_TRANSDETAIL.QUARELATION*INV_TRANSDETAIL.BALANCEOPERIN) SUMQUA
      FROM INV_TRANSDETAIL
      WHERE INV_TRANSDETAIL.INVITEMID=invitemid_criteria
        AND INV_TRANSDETAIL.COMPANYID=companyid_criteria
        AND INV_TRANSDETAIL.FYEARID=fyearid_criteria
        AND INV_TRANSDETAIL.ISDELETED='0'
        AND INV_TRANSDETAIL.UPDATESAVERAGEPRICE='1'
        AND (INV_TRANSDETAIL.INVENTORYINDICATOR='1' or INV_TRANSDETAIL.INTERNALEVENTDATE<=calcdate_criteria);
  averageprice_rec averageprice_cur%ROWTYPE;

begin
  open averageprice_cur;
  fetch averageprice_cur into averageprice_rec;
  if (averageprice_cur%FOUND) then
    if (withvat_criteria = 1) then
      if (averageprice_rec.sumqua > 0) then
        result := averageprice_rec.sumtotalamount / averageprice_rec.sumqua;
      else
        result := 0;
      end if;
    else
      if (averageprice_rec.sumqua > 0) then
        result := averageprice_rec.sumnetamount / averageprice_rec.sumqua;
      else
        result := 0;
      end if;
    end if;
  else
    result := 0;
  end if;

  return(result);
end calculateAveragePrice;
