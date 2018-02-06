create table pbl_clawbackrule (
  companyid number(38) not null,
  fyearid number(38) not null,
  clawbackruleid number(38) not null,
  sincedate date not null,
  clawbackperccalc float(126)
);
alter table pbl_clawbackrule
  add constraint pbl_clawbackrule_pk
  primary key(companyid, fyearid, clawbackruleid);

alter table pbl_visitcoverdetail add (clawbackperccalc float(126), clawbackperccover float(126));
alter table pbl_chargedetail add clawbackvaluecharge float(126);
alter table pbl_chargecover add (clawbackperccover float(126), clawbackvaluetransferred float(126), clawbackvaluecover float(126), clawbackdiscvaluecover float(126));

alter table fin_transdetail add clawbackamount float(126);