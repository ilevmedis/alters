alter table pbl_visitbillingrule add dailydrugscharge float(126);
alter table pbl_chargedetail add isdrugscharge varchar2(1);
alter table pbl_chargeheader add dailydrugscharge float(126);