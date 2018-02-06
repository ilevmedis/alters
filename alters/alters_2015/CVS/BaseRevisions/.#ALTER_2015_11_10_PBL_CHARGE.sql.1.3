alter table pbl_chargeheader add packageinfo varchar2(150);
alter table pbl_chargedetail add packageinfo varchar2(150);

alter table pbl_chargecover add ispackagefinalized varchar2(1);
update pbl_chargecover set ispackagefinalized = (select ispackagefinalized from pbl_chargedetail where
     pbl_chargedetail.chargedetailid = pbl_chargecover.chargedetailid and
     pbl_chargedetail.companyid = pbl_chargecover.companyid and
     pbl_chargedetail.fyearid = pbl_chargecover.fyearid) where pbl_chargecover.chargedetailid in (select chargedetailid from pbl_chargedetail where fyearid=2015);

update pbl_chargecover set ispackagefinalized = (select ispackagefinalized from pbl_chargedetail where
     pbl_chargedetail.chargedetailid = pbl_chargecover.chargedetailid and
     pbl_chargedetail.companyid = pbl_chargecover.companyid and
     pbl_chargedetail.fyearid = pbl_chargecover.fyearid) where pbl_chargecover.chargedetailid in (select chargedetailid from pbl_chargedetail where fyearid=2014);

alter table pbl_chargecover modify ispackagefinalized not null;
alter table pbl_chargecover modify ispackagefinalized default '0';

create or replace procedure update_packageinfo(sincedate in date, tilldate in date) is
  cursor pbl_chargedetail_cur is
    select chargedetailid, companyid, fyearid, chargepackageid, packageid, isincludedinpackage, ispackagefinalized
    from pbl_chargedetail
    where pbl_chargedetail.chargepackageid is not null and
      chargedate >= sincedate and chargedate <= tilldate;
  pbl_chargedetail_rec pbl_chargedetail_cur%ROWTYPE;

  cursor pbl_chargepackagecover_cur(companyid_var int, fyearid_var int, chargepackageid_var int) is
    select pbl_chargepackagecover.visitcoverdetailid
      from pbl_chargepackagecover
      where
      pbl_chargepackagecover.chargepackageid = chargepackageid_var and
      pbl_chargepackagecover.companyid = companyid_var and
      pbl_chargepackagecover.fyearid = fyearid_var and
      pbl_chargepackagecover.isincluded = '1';
  pbl_chargepackagecover_rec pbl_chargepackagecover_cur%ROWTYPE;

  packageinf varchar2(150);
  counter int;

  cursor pbl_chargeheader_cur is
    select chargeheaderid, companyid, fyearid, chargepackageid, packageid, isincludedinpackage, ispackagefinalized
    from pbl_chargeheader
    where pbl_chargeheader.chargepackageid is not null and
      chargedate >= sincedate and chargedate <= tilldate;
  pbl_chargeheader_rec pbl_chargeheader_cur%ROWTYPE;

begin
  counter := 1;
  open pbl_chargedetail_cur;
  loop
    fetch pbl_chargedetail_cur into pbl_chargedetail_rec;
    exit when pbl_chargedetail_cur%NOTFOUND;

    packageinf := '';
    open pbl_chargepackagecover_cur(pbl_chargedetail_rec.companyid, pbl_chargedetail_rec.fyearid, pbl_chargedetail_rec.chargepackageid);
    loop
      fetch pbl_chargepackagecover_cur into pbl_chargepackagecover_rec;
      exit when pbl_chargepackagecover_cur%NOTFOUND;

      if (packageinf <> '') then
        packageinf := packageinf || '+';
      end if;
      packageinf := packageinf || pbl_chargepackagecover_rec.visitcoverdetailid || ';' || pbl_chargedetail_rec.chargepackageid || ';' ||
        pbl_chargedetail_rec.packageid || ';' || pbl_chargedetail_rec.isincludedinpackage || ';' || pbl_chargedetail_rec.ispackagefinalized;
    end loop;
    close pbl_chargepackagecover_cur;
    update pbl_chargedetail set packageinfo = packageinf where chargedetailid = pbl_chargedetail_rec.chargedetailid and
      companyid = pbl_chargedetail_rec.companyid and fyearid = pbl_chargedetail_rec.fyearid;

    if (counter mod 100 = 0) then
      commit;
    end if;
    counter := counter + 1;
  end loop;
  close pbl_chargedetail_cur;
  commit;

  counter := 1;
  open pbl_chargeheader_cur;
  loop
    fetch pbl_chargeheader_cur into pbl_chargeheader_rec;
    exit when pbl_chargeheader_cur%NOTFOUND;

    packageinf := '';
    open pbl_chargepackagecover_cur(pbl_chargeheader_rec.companyid, pbl_chargeheader_rec.fyearid, pbl_chargeheader_rec.chargepackageid);
    loop
      fetch pbl_chargepackagecover_cur into pbl_chargepackagecover_rec;
      exit when pbl_chargepackagecover_cur%NOTFOUND;

      if (packageinf <> '') then
        packageinf := packageinf || '+';
      end if;
      packageinf := packageinf || pbl_chargepackagecover_rec.visitcoverdetailid || ';' || pbl_chargeheader_rec.chargepackageid || ';' ||
        pbl_chargeheader_rec.packageid || ';' || pbl_chargeheader_rec.isincludedinpackage || ';' || pbl_chargeheader_rec.ispackagefinalized;
    end loop;
    close pbl_chargepackagecover_cur;
    update pbl_chargeheader set packageinfo = packageinf where chargeheaderid = pbl_chargeheader_rec.chargeheaderid and
      companyid = pbl_chargeheader_rec.companyid and fyearid = pbl_chargeheader_rec.fyearid;

    if (counter mod 100 = 0) then
      commit;
    end if;
    counter := counter + 1;
  end loop;
  close pbl_chargeheader_cur;
  commit;

end update_packageinfo;

#######  !!!!!! run update_packageinfo