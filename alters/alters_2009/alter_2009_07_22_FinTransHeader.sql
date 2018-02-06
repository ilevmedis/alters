alter table fin_transheader add isdiscounted varchar2(1);
update fin_transheader set isdiscounted = '0';
commit;
alter table fin_transheader modify isdiscounted not null;

create index fin_transhd_isdiscounted on fin_transheader (isdiscounted, internaleventdate);
