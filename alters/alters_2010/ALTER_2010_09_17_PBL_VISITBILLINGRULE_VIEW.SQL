create or replace view pbl_visitbillingrule_view as
select * from pbl_visitbillingrule a
  where a.visitbillingruleid = (select max(visitbillingruleid) from
    pbl_visitbillingrule b where b.visitid = a.visitid and b.companyid = a.companyid and
      b.fyearid = a.fyearid and b.validsincedate = a.validsincedate);
