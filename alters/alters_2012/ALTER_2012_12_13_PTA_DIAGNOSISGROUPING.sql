alter table pta_diagnosisgrouping add (isusedasdiagnosis varchar2(1), isusedasterm varchar2(1));
update pta_diagnosisgrouping set isusedasdiagnosis = '1';
update pta_diagnosisgrouping set isusedasterm = '1';
commit;
alter table pta_diagnosisgrouping modify (isusedasdiagnosis not null, isusedasterm not null);
