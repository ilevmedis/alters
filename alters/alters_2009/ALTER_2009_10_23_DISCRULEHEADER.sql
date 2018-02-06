alter table PBL_DISCRULEHEADER add DEFAULTDISCPERC FLOAT;
alter table PBL_DISCRULEHEADER add DISCOUNTTYPEID number(38);

alter table PBL_DISCRULEHEADER
  add constraint FK_PBL_DISCRULEHD_DISCTYPE foreign key (DISCOUNTTYPEID, COMPANYID, FYEARID)
  references pbl_discounttype (DISCOUNTTYPEID, COMPANYID, FYEARID);

create index FK_PBL_DISCRULEHD_DISCTYPE on PBL_DISCRULEHEADER (discounttypeid, companyid, fyearid);