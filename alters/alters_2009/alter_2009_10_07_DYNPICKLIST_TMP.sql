create table tmp_dynpicklist(
  rowno number(38),
  col1code varchar2(10), col1descr varchar2(100), col1p varchar2(2), col1a varchar2(2), col1n varchar2(2), col1s varchar2(2),
  col2code varchar2(10), col2descr varchar2(100), col2p varchar2(2), col2a varchar2(2), col2n varchar2(2), col2s varchar2(2),
  col3code varchar2(10), col3descr varchar2(100), col3p varchar2(2), col3a varchar2(2), col3n varchar2(2), col3s varchar2(2)
  );

insert into tmp_dynpicklist(rowno)
  select inv_dynpicklist. 