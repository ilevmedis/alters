create or replace function getMultipleSequences(sequenceName in varchar2, noOfSequences in int) return int is
  result int;
  counter int;
  nextValQuery varchar2(200);
  seqVal int;
begin
  nextValQuery := 'SELECT ' || sequenceName || '.NEXTVAL FROM DUAL';
  for counter in 1..noOfSequences loop
    execute immediate nextValQuery into seqVal;
    if (counter = 1) then
      result := seqVal;
    end if;
  end loop;
  return(result);
end getMultipleSequences;