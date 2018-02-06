create or replace view PBL_STAYCHARGEDETAIL as
  select pbl_chargedetail.chargedetailid, pbl_chargedetail.companyid, pbl_chargedetail.fyearid, pbl_chargedetail.chargeheaderid,
    pbl_chargedetail.visitid, pbl_chargedetail.finitemid, pbl_chargedetail.facilityexecid, pbl_chargedetail.pricecharge,
    1 as quacharge,
      pbl_chargedetail.prediscvaluecharge/pbl_chargedetail.quacharge as prediscvaluecharge,
      pbl_chargedetail.discvaluecharge/pbl_chargedetail.quacharge as discvaluecharge,
      pbl_chargedetail.prepackagevaluecharge/pbl_chargedetail.quacharge as prepackagevaluecharge,
      pbl_chargedetail.packagediffvaluecharge/pbl_chargedetail.quacharge as packagediffvaluecharge,
      pbl_chargedetail.valuecharge/pbl_chargedetail.quacharge as valuecharge,
      pbl_chargedetail.cancelvaluecharge/pbl_chargedetail.quacharge as cancelvaluecharge,
      pbl_chargedetail.remainingvaluecharge/pbl_chargedetail.quacharge as remainingvaluecharge,
      pbl_chargedetail.invoicedvalue/pbl_chargedetail.quacharge as invoicedvalue,
      pbl_chargedetail.constprice, pbl_chargedetail.constcontrib,
      pbl_chargedetail.constdiscount, pbl_chargedetail.isexcludedfrompackage, pbl_chargedetail.printedinbiblio,
      pbl_chargedetail.printedinmerid, pbl_chargedetail.isdeleted,
      pbl_chargedetail.remaininginvoicevalue/pbl_chargedetail.quacharge as remaininginvoicevalue, pbl_chargedetail.invoiced,
      pbl_chargedetail.linenum, sys_dates.querydate, pbl_chargedetail.isincludedininvoice, pbl_chargedetail.isautocalculated,
      pbl_chargedetail.ispackagecharge, pbl_chargedetail.creationchargepackageid, pbl_chargedetail.isincludedinpackage,
      pbl_chargedetail.packageid, pbl_chargedetail.chargepackageid, pbl_chargedetail.ispackagefinalized, pbl_chargedetail.versionno,
      pbl_chargedetail.iscanceled, pbl_chargedetail.iscanceltransaction,
      pbl_chargedetail.invoicediscvaluecharge/pbl_chargedetail.quacharge as invoicediscvaluecharge,
      pbl_chargedetail.totaldiscvaluecharge/pbl_chargedetail.quacharge as totaldiscvaluecharge,
      pbl_chargedetail.medorderdetailid, pbl_chargedetail.invtransdetailid
      from pbl_chargedetail, sys_dates, pbl_chargeheader
      where sys_dates.querydate>(pbl_chargedetail.chargedate-pbl_chargedetail.quacharge) and sys_dates.querydate<=pbl_chargedetail.chargedate and
        pbl_chargeheader.chargeheaderid = pbl_chargedetail.chargeheaderid and pbl_chargeheader.companyid = pbl_chargedetail.companyid and pbl_chargeheader.fyearid = pbl_chargedetail.fyearid
      and pbl_chargeheader.isstaycharge='1';

create or replace view PBL_STAYCHARGECOVER as
  select pbl_chargecover.chargecoverid, pbl_chargecover.companyid, pbl_chargecover.fyearid,
    pbl_chargecover.fintranspartyid, pbl_chargecover.levelcoverid, pbl_chargecover.pricelistcoverid,
    pbl_chargecover.pricecover, pbl_chargecover.perccover,
    pbl_chargecover.prediscvaluecover/pbl_chargedetail.quacharge as prediscvaluecover,
    pbl_chargecover.discperc, pbl_chargecover.discounttypeid,
    pbl_chargecover.discvaluecover/pbl_chargedetail.quacharge as discvaluecover,
    pbl_chargecover.preplafonvaluecover/pbl_chargedetail.quacharge as preplafonvaluecover,
    pbl_chargecover.plafonvaluecover/pbl_chargedetail.quacharge as plafonvaluecover,
    pbl_chargecover.valuecover/pbl_chargedetail.quacharge as valuecover,
    pbl_chargecover.cancelvaluecover/pbl_chargedetail.quacharge as cancelvaluecover,
    pbl_chargecover.chargedetailid,
    pbl_chargecover.remainingvaluecover/pbl_chargedetail.quacharge as remainingvaluecover,
    pbl_chargecover.invoicedvalue/pbl_chargedetail.quacharge as invoicedvalue,
    pbl_chargecover.remaininginvoicevalue/pbl_chargedetail.quacharge as remaininginvoicevalue,
    pbl_chargecover.invoiced, pbl_chargecover.visitcoverdetailid,
    pbl_chargecover.insuranceschemeheaderid, pbl_chargecover.coverageorder,
    pbl_chargecover.valuetocover/pbl_chargedetail.quacharge as valuetocover,
    pbl_chargecover.visitid, pbl_chargecover.whocoversindicator, pbl_chargecover.isincludedininvoice,
    pbl_chargecover.ispackagecharge, pbl_chargecover.creationchargepackageid, pbl_chargecover.isincludedinpackage,
    pbl_chargecover.isexcludedfrompackage, pbl_chargecover.packageid, pbl_chargecover.chargepackageid,
    pbl_chargecover.iscanceled, pbl_chargecover.iscanceltransaction,
    pbl_chargecover.prepackagevaluecover/pbl_chargedetail.quacharge as prepackagevaluecover,
    pbl_chargecover.packagediffvaluecover/pbl_chargedetail.quacharge as packagediffvaluecover,
    pbl_chargecover.invoicediscvaluecover/pbl_chargedetail.quacharge as invoicediscvaluecover,
    pbl_chargecover.totaldiscvaluecover/pbl_chargedetail.quacharge as totaldiscvaluecover
    from pbl_chargecover, pbl_chargedetail, sys_dates, pbl_chargeheader
      where sys_dates.querydate>(pbl_chargedetail.chargedate-pbl_chargedetail.quacharge) and sys_dates.querydate<=pbl_chargedetail.chargedate and
        pbl_chargecover.chargedetailid = pbl_chargedetail.chargedetailid and pbl_chargecover.companyid = pbl_chargedetail.companyid and pbl_chargecover.fyearid = pbl_chargedetail.fyearid and
        pbl_chargeheader.chargeheaderid = pbl_chargedetail.chargeheaderid and pbl_chargeheader.companyid = pbl_chargedetail.companyid and pbl_chargeheader.fyearid = pbl_chargedetail.fyearid
      and pbl_chargeheader.isstaycharge='1';


