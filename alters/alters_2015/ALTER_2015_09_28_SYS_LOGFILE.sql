alter table sys_logfile add iscompressed varchar2(1);
alter table sys_logfile add compressedchanges blob;

--- !!!! alters should be applied to all historical log changes
--- !!!! view
create or replace view sys_logfile_view as
select "OBJECTID","OBJECTPK","USERNAME","COMPANYID","LOGDATE","ACTION","REMOTEADDRESS","REMOTEHOST","MODELNAME","LOGCHANGES","ROWPK","ISCOMPRESSED", "COMPRESSEDCHANGES" from sys_logfile;
---- !!!!! all historical tables should be included

--- !!!! create java methods within oracle in order to be able to run sql statements for sys_logfile
--- !!!! example: select sys_logfile.logdate, getUnZippedCLob(compressedchanges) from sys_logfile
create or replace and compile java source named "Compress" as
import java.io.*;
import java.sql.SQLException;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;

public class Compress {
  public static oracle.sql.CLOB getUnZippedCLob(oracle.sql.BLOB bytes) throws IOException, SQLException {
    String output = null;
    if (bytes != null) {
      InputStreamReader isr = new InputStreamReader(new GZIPInputStream(bytes.binaryStreamValue()), "UTF-8");
      StringWriter sw = new StringWriter();
      char[] chars = new char[1024];
      for (int len; (len = isr.read(chars)) > 0;) {
        sw.write(chars, 0, len);
      }
      output = sw.toString();
    }
    oracle.jdbc.OracleConnection conn = (oracle.jdbc.OracleConnection) new oracle.jdbc.OracleDriver().defaultConnection();
    oracle.sql.CLOB clob = oracle.sql.CLOB.createTemporary(conn, true, oracle.sql.CLOB.DURATION_SESSION);
    clob.setString(1, output);
    return clob;
  }

  public static oracle.sql.CLOB getUnZippedCLob(byte[] input) throws IOException, SQLException {
    String output = null;
    if (input != null) {
      InputStreamReader isr = new InputStreamReader(new GZIPInputStream(new ByteArrayInputStream(input)), "UTF-8");
      StringWriter sw = new StringWriter();
      char[] chars = new char[1024];
      for (int len; (len = isr.read(chars)) > 0;) {
        sw.write(chars, 0, len);
      }
      output = sw.toString();
    }
    oracle.jdbc.OracleConnection conn = (oracle.jdbc.OracleConnection) new oracle.jdbc.OracleDriver().defaultConnection();
    oracle.sql.CLOB clob = oracle.sql.CLOB.createTemporary(conn, true, oracle.sql.CLOB.DURATION_SESSION);
    clob.setString(1, output);
    return clob;
  }

  public static String getUnZippedString(oracle.sql.BLOB bytes) throws IOException, SQLException {
    String output = null;
    if (bytes != null) {
      InputStreamReader isr = new InputStreamReader(new GZIPInputStream(bytes.binaryStreamValue()));
      StringWriter sw = new StringWriter();
      char[] chars = new char[1024];
      for (int len; (len = isr.read(chars)) > 0;) {
        sw.write(chars, 0, len);
      }
      output = sw.toString();
    }
    return output;
  }

  public static String getUnZippedString(byte[] input) throws IOException, SQLException {
    String output = null;
    if (input != null) {
      InputStreamReader isr = new InputStreamReader(new GZIPInputStream(new ByteArrayInputStream(input)), "UTF-8");
      StringWriter sw = new StringWriter();
      char[] chars = new char[1024];
      for (int len; (len = isr.read(chars)) > 0;) {
        sw.write(chars, 0, len);
      }
      output = sw.toString();
    }
    return output;
  }

  public static oracle.sql.BLOB zipCLobToBLob(oracle.sql.CLOB clob) throws IOException, SQLException {
    oracle.jdbc.OracleConnection conn = (oracle.jdbc.OracleConnection) new oracle.jdbc.OracleDriver().defaultConnection();
    oracle.sql.BLOB blob = oracle.sql.BLOB.createTemporary(conn, true, oracle.sql.BLOB.DURATION_SESSION);

/*
    ByteArrayOutputStream bos = new ByteArrayOutputStream();
    GZIPOutputStream gzip = new GZIPOutputStream(bos);

    final Reader reader = clob.getCharacterStream();
    final BufferedReader br = new BufferedReader(reader);

    int b;
    while (-1 != (b = br.read())) {
      gzip.write((char) b);
    }
    br.close();
    gzip.close();

    OutputStream outputStream = blob.setBinaryStream(0);
    outputStream.write(bos.toByteArray());
    outputStream.flush();

    //blob.setBytes(bos.toByteArray());
*/
    blob.setBytes(new byte[] {0,1});
    return blob;
  }

  public static String cLobToString(oracle.sql.CLOB clob) throws IOException, SQLException {
    final Reader reader = clob.getCharacterStream();
    final BufferedReader br = new BufferedReader(reader);
    final StringBuilder stBuilder = new StringBuilder();

    int b;
    while (-1 != (b = br.read())) {
      stBuilder.append((char) b);
    }

    br.close();

    return stBuilder.toString();
  }

  public static byte[] zipCLobToRaw(oracle.sql.CLOB clob) throws IOException, SQLException {
    String st = cLobToString(clob);
    byte[] bytes = st.getBytes("UTF-8");
    ByteArrayOutputStream bos = new ByteArrayOutputStream();
    GZIPOutputStream gzip = new GZIPOutputStream(bos);
    gzip.write(bytes);
    gzip.close();
    return bos.toByteArray();
  }

};
/

--- !!! create the oracle functions which map to java methods
CREATE OR REPLACE FUNCTION GETUNZIPPEDCLOB(INPUT BLOB) RETURN CLOB
 AS LANGUAGE JAVA
 NAME 'Compress.getUnZippedCLob(oracle.sql.BLOB) return oracle.sql.CLOB';

CREATE OR REPLACE FUNCTION GETUNZIPPEDCLOB(INPUTSTR RAW) RETURN CLOB
 AS LANGUAGE JAVA
 NAME 'Compress.getUnZippedCLob(byte[]) return oracle.sql.CLOB';

CREATE OR REPLACE FUNCTION GETUNZIPPEDSTRING(INPUT BLOB) RETURN VARCHAR2
 AS LANGUAGE JAVA
 NAME 'Compress.getUnZippedString(oracle.sql.BLOB) return java.lang.String';

CREATE OR REPLACE FUNCTION GETUNZIPPEDSTRING(INPUTSTR RAW) RETURN VARCHAR2
 AS LANGUAGE JAVA
 NAME 'Compress.getUnZippedString(byte[]) return java.lang.String';

CREATE OR REPLACE FUNCTION ZIPCLOBTOBLOB(INPUTSTR CLOB) RETURN BLOB
 AS LANGUAGE JAVA
 NAME 'Compress.zipCLobToBLob(oracle.sql.CLOB) return oracle.sql.BLOB';

CREATE OR REPLACE FUNCTION ZIPCLOBTORAW(INPUTSTR CLOB) RETURN RAW
 AS LANGUAGE JAVA
 NAME 'Compress.zipCLobToRaw(oracle.sql.CLOB) return byte[]';


--- !!!! create an oracle procedure to update the compressedchanges column, should run for all historical data / tables included in the sys_logfile view
create or replace procedure sys_logfile_updblob is
  cursor sys_logfile_cur is
    select OBJECTID, OBJECTPK, MODELNAME, ROWPK, USERNAME, COMPANYID, LOGDATE, ACTION, LOGCHANGES from sys_logfile
    where logchanges is not null;
    --where iscompressed = '0' or iscompressed is null;

  sys_logfile_rec sys_logfile_cur%ROWTYPE;

  v_blob Blob;

  counter int;
begin
  counter := 1;

  open sys_logfile_cur;
  loop
    fetch sys_logfile_cur into sys_logfile_rec;
    exit when sys_logfile_cur%NOTFOUND;

    if (DBMS_lob.getlength(sys_logfile_rec.logchanges) > 0) then
      v_blob := to_blob(ZIPCLOBTORAW(sys_logfile_rec.logchanges));

      update sys_logfile set compressedchanges=v_blob, iscompressed = '1' where
        objectid = sys_logfile_rec.objectid and objectpk = sys_logfile_rec.objectpk and
        modelname = sys_logfile_rec.modelname and rowpk = sys_logfile_rec.rowpk and
        username = sys_logfile_rec.username and companyid = sys_logfile_rec.companyid and
        logdate = sys_logfile_rec.logdate and action = sys_logfile_rec.action;
    end if;
    if (counter mod 500 = 0) then
      commit;
    end if;
    counter := counter + 1;
  end loop;
  close sys_logfile_cur;
  commit;
end sys_logfile_updblob;




