insert into sys_objectusers(objectusersid, companyid, objectid, objectpk, username, roleid, ispublictoallusers)
  select sys_objectusers_seq.nextval, fin_costcenter.companyid, 'FIN_COSTCENTER',
    'FIN_COSTCENTER.COMPANYID='||fin_costcenter.companyid||'|FIN_COSTCENTER.COSTCENTERID='||fin_costcenter.costcenterid||
    '|FIN_COSTCENTER.FYEARID='||fin_costcenter.fyearid, null,null,'1'
    from fin_costcenter
