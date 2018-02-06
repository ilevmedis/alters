alter table PLG_BUDGETORG add ISDEFAULT varchar2(1);
update PLG_BUDGETORG set ISDEFAULT = '0';
update PLG_BUDGETORG set ISDEFAULT = '1' where mnemonic = '100';
commit;

alter table PLG_BUDGETORG modify ISDEFAULT not null;

alter table INV_TRANSHEADER add BUDGETORGID NUMBER(38);

update inv_transheader
  set budgetorgid =
    (select budgetorgid from plg_budgetorg
      where plg_budgetorg.companyid = inv_transheader.companyid
        and plg_budgetorg.fyearid = inv_transheader.fyearid
        and plg_budgetorg.isdefault = '1')
   where inv_transheader.companyid = 1
     and inv_transheader.fyearid = 2002
     and inv_transheader.eventtypeindicator = 2 or inv_transheader.eventtypeindicator = 3;
COMMIT;

update inv_transheader
  set budgetorgid =
    (select budgetorgid from plg_budgetorg
      where plg_budgetorg.companyid = inv_transheader.companyid
        and plg_budgetorg.fyearid = inv_transheader.fyearid
        and plg_budgetorg.isdefault = '1')
   where inv_transheader.companyid = 1
     and inv_transheader.fyearid = 2003
     and inv_transheader.eventtypeindicator = 2 or inv_transheader.eventtypeindicator = 3;
COMMIT;

update inv_transheader
  set budgetorgid =
    (select budgetorgid from plg_budgetorg
      where plg_budgetorg.companyid = inv_transheader.companyid
        and plg_budgetorg.fyearid = inv_transheader.fyearid
        and plg_budgetorg.isdefault = '1')
   where inv_transheader.companyid = 1
     and inv_transheader.fyearid = 2004
     and inv_transheader.eventtypeindicator = 2 or inv_transheader.eventtypeindicator = 3;
COMMIT;

update inv_transheader
  set budgetorgid =
    (select budgetorgid from plg_budgetorg
      where plg_budgetorg.companyid = inv_transheader.companyid
        and plg_budgetorg.fyearid = inv_transheader.fyearid
        and plg_budgetorg.isdefault = '1')
   where inv_transheader.companyid = 1
     and inv_transheader.fyearid = 2005
     and inv_transheader.eventtypeindicator = 2 or inv_transheader.eventtypeindicator = 3;
COMMIT;

update inv_transheader
  set budgetorgid =
    (select budgetorgid from plg_budgetorg
      where plg_budgetorg.companyid = inv_transheader.companyid
        and plg_budgetorg.fyearid = inv_transheader.fyearid
        and plg_budgetorg.isdefault = '1')
   where inv_transheader.companyid = 1
     and inv_transheader.fyearid = 2006
     and inv_transheader.eventtypeindicator = 2 or inv_transheader.eventtypeindicator = 3;
COMMIT;

update inv_transheader
  set budgetorgid =
    (select budgetorgid from plg_budgetorg
      where plg_budgetorg.companyid = inv_transheader.companyid
        and plg_budgetorg.fyearid = inv_transheader.fyearid
        and plg_budgetorg.isdefault = '1')
   where inv_transheader.companyid = 1
     and inv_transheader.fyearid = 2007
     and inv_transheader.eventtypeindicator = 2 or inv_transheader.eventtypeindicator = 3;
COMMIT;

update inv_transheader
  set budgetorgid =
    (select budgetorgid from plg_budgetorg
      where plg_budgetorg.companyid = inv_transheader.companyid
        and plg_budgetorg.fyearid = inv_transheader.fyearid
        and plg_budgetorg.isdefault = '1')
   where inv_transheader.companyid = 1
     and inv_transheader.fyearid = 2008
     and inv_transheader.eventtypeindicator = 2 or inv_transheader.eventtypeindicator = 3;
COMMIT;

update inv_transheader
  set budgetorgid =
    (select budgetorgid from plg_budgetorg
      where plg_budgetorg.companyid = inv_transheader.companyid
        and plg_budgetorg.fyearid = inv_transheader.fyearid
        and plg_budgetorg.isdefault = '1')
   where inv_transheader.companyid = 1
     and inv_transheader.fyearid = 2009
     and inv_transheader.eventtypeindicator = 2 or inv_transheader.eventtypeindicator = 3;
COMMIT;

update inv_transheader
  set budgetorgid =
    (select budgetorgid from plg_budgetorg
      where plg_budgetorg.companyid = inv_transheader.companyid
        and plg_budgetorg.fyearid = inv_transheader.fyearid
        and plg_budgetorg.isdefault = '1')
   where inv_transheader.companyid = 1
     and inv_transheader.fyearid = 2010
     and inv_transheader.eventtypeindicator = 2 or inv_transheader.eventtypeindicator = 3;
COMMIT;

update inv_transheader
  set budgetorgid =
    (select budgetorgid from plg_budgetorg
      where plg_budgetorg.companyid = inv_transheader.companyid
        and plg_budgetorg.fyearid = inv_transheader.fyearid
        and plg_budgetorg.isdefault = '1')
   where inv_transheader.companyid = 1
     and inv_transheader.fyearid = 2011
     and inv_transheader.eventtypeindicator = 2 or inv_transheader.eventtypeindicator = 3;
COMMIT;

update inv_transheader
  set budgetorgid =
    (select budgetorgid from plg_budgetorg
      where plg_budgetorg.companyid = inv_transheader.companyid
        and plg_budgetorg.fyearid = inv_transheader.fyearid
        and plg_budgetorg.isdefault = '1')
   where inv_transheader.companyid = 1
     and inv_transheader.fyearid = 2012
     and inv_transheader.eventtypeindicator = 2 or inv_transheader.eventtypeindicator = 3;
COMMIT;

alter table INV_TRANSHEADER
  add constraint FK_INV_TRANSHD_BUDGETORG foreign key (BUDGETORGID, FYEARID, COMPANYID)
  references plg_budgetorg (BUDGETORGID, FYEARID, COMPANYID);

create index FK_INV_TRANSHD_BUDGETORG on INV_TRANSHEADER (budgetorgid, fyearid, companyid);
