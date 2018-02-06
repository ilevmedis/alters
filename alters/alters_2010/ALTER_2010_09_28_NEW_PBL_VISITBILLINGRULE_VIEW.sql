create index VALIDSINCEDATE_IDX on PBL_VISITBILLINGRULE (VALIDSINCEDATE, VISITID, COMPANYID, FYEARID); 

create or replace view pbl_visitbillingrule_view as
select  decode(prevfacilityid, null, '1', facilityid, '0', '1') ISFACILITYCHANGED,
"VISITBILLINGRULEID","COMPANYID","FYEARID","VISITID",

  "VALIDSINCEDATE","ISFIRSTBILLINGRULE","ISLEVELCHARGECHANGED",



  "ISPACKAGECHANGED","ISPRICELISTCHANGED","CREATIONINDICATOR","PRICELISTCHARGEID",
  "LEVELCHARGESTAYID","LEVELCHARGERESTID","ONEDAYSTAYINDICATOR","FACILITYID",
  "TRANSFERID","PACKAGEID","ISDELETED","DAILYSTAYCHARGE","IKACLINICID"

  from

(select

  (select facilityid from pbl_visitbillingrule c where

    c.visitid = a.visitid and c.companyid = a.companyid and c.fyearid = a.fyearid and

    c.validsincedate < a.validsincedate and c.visitbillingruleid =

  (select max(visitbillingruleid) from pbl_visitbillingrule d where

    d.visitid = a.visitid and d.companyid = a.companyid and d.fyearid = a.fyearid and

    d.validsincedate < a.validsincedate)) as prevfacilityid,



"VISITBILLINGRULEID","COMPANYID","FYEARID","VISITID",

  "VALIDSINCEDATE","ISFIRSTBILLINGRULE","ISLEVELCHARGECHANGED",



  "ISPACKAGECHANGED","ISPRICELISTCHANGED","CREATIONINDICATOR","PRICELISTCHARGEID",
  "LEVELCHARGESTAYID","LEVELCHARGERESTID","ONEDAYSTAYINDICATOR","FACILITYID",
  "TRANSFERID","PACKAGEID","ISDELETED","DAILYSTAYCHARGE","IKACLINICID"

  from pbl_visitbillingrule a

  where a.visitbillingruleid = (select max(visitbillingruleid) from

    pbl_visitbillingrule b where b.visitid = a.visitid and b.companyid = a.companyid and

      b.fyearid = a.fyearid and b.validsincedate = a.validsincedate)

)



