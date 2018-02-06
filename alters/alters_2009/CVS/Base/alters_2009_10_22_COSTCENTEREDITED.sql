alter table med_orderheader add (iscostcenteredited varchar2(1));
update med_orderheader set iscostcenteredited = '0';
commit;
alter table med_orderheader modify iscostcenteredited not null;

alter table med_orderdetail add (iscostcenteredited varchar2(1));
update med_orderdetail set iscostcenteredited = '0';
commit;
alter table med_orderdetail modify iscostcenteredited not null;

alter table pbl_chargeheader add (iscostcenteredited varchar2(1));
update pbl_chargeheader set iscostcenteredited = '0';
commit;
alter table pbl_chargeheader modify iscostcenteredited not null;

alter table pbl_chargedetail add (iscostcenteredited varchar2(1));
update pbl_chargedetail set iscostcenteredited = '0';
commit;
alter table pbl_chargedetail modify iscostcenteredited not null;
