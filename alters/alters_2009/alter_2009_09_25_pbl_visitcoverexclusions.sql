alter table pbl_visitcoverexclusions add finitemgroupingcode_copy varchar2(40);
update pbl_visitcoverexclusions set finitemgroupingcode_copy = finitemgroupingcode;
commit;
update pbl_visitcoverexclusions set finitemgroupingcode = null;
commit;
alter table pbl_visitcoverexclusions modify finitemgroupingcode varchar2(40);
update pbl_visitcoverexclusions set finitemgroupingcode = finitemgroupingcode_copy;
commit;
alter table pbl_visitcoverexclusions drop column finitemgroupingcode_copy;

