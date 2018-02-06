alter table inv_openitemdetailbinding add openitemeventtypeindicator number(38);
update inv_openitemdetailbinding set openitemeventtypeindicator=
  (select inv_openitemheader.eventtypeindicator from
    inv_openitemheader, inv_openitemdetail where
      inv_openitemdetailbinding.openitemdetailid = inv_openitemdetail.openitemdetailid and
      inv_openitemdetailbinding.companyid = inv_openitemdetail.companyid and
      inv_openitemdetailbinding.fyearid = inv_openitemdetail.fyearid and
      inv_openitemheader.openitemheaderid = inv_openitemdetail.openitemheaderid and
      inv_openitemheader.companyid = inv_openitemdetail.companyid and
      inv_openitemheader.fyearid = inv_openitemdetail.fyearid);
COMMIT;