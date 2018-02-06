alter table pbl_chargecover add (insuramtvaluetocover float(126), insuramtdiscperc float(126), insuramtdiscvaluecover float(126));
alter table pbl_chargedetail add (insuramtdiscvaluecharge float(126));
alter table pbl_discruleheader add defaultinsuramtdiscperc float(126);
alter table pbl_discruledetail add insuramtdiscperc float(126);
alter table pbl_insuranceschemedetail add insuramtdiscperc float(126);
alter table pbl_visitcoverdates add insuramtdiscperc float(126);
alter table pbl_parameters add( insuramtdiscvatfinitemid number(38), insuramtdiscfinitemid number(38), insuramtdiscfintranspartyid number(38));
alter table pbl_parameters add constraint fin_transparty_pbl_params_fk
  foreign key (insuramtdiscfintranspartyid, companyid, fyearid)
  references fin_transparty(fintranspartyid, companyid, fyearid);
alter table pbl_parameters add constraint fin_item_pbl_params_fk
  foreign key (insuramtdiscfinitemid, companyid, fyearid)
  references fin_item(finitemid, companyid, fyearid);
alter table pbl_parameters add constraint fin_item_vat_pbl_params_fk
  foreign key (insuramtdiscvatfinitemid, companyid, fyearid)
  references fin_item(finitemid, companyid, fyearid);
alter table pbl_visitcoverdetail add (insuramtdiscvatvalue float(126));

