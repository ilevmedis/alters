alter table pbl_chargepackageadditional add (packageperc float(126));
update pbl_chargepackageadditional set packageperc = 1 where packageperc is null;
commit;