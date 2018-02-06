alter table inv_contractdetail add (validsincedate date, validtilldate date);
update inv_contractdetail set validsincedate=(select validsincedate from inv_contractheader
  where inv_contractheader.contractheaderid = inv_contractdetail.contractheaderid 
    and inv_contractheader.companyid=inv_contractdetail.companyid 
    and inv_contractheader.fyearid = inv_contractdetail.fyearid);
commit;
alter table inv_contractdetail modify validsincedate not null; 