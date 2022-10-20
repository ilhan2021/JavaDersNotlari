package jdbc;

import java.sql.*;

public class tekrar01 {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        Class.forName("org.postgresql.Driver");
        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/techproed","postgres","hamza.2021");
        Statement st = con.createStatement();
       //String st1="CREATE TABLE ogrenci(ogr_no INT, ogr_sube VARCHAR(5), ogr_ad VARCHAR(50), ogr_soyad VARCHAR(50))";
       //st.execute(st1);

       //String st2="INSERT INTO ogrenci VALUES(127,'10-A', 'sedat', 'kurnali')";
       //String st3="INSERT INTO ogrenci VALUES(125,'10-D', 'ahmet', 'deli')";
       //String st4="INSERT INTO ogrenci VALUES(135,'9-C', 'recep', 'kardes')";
       //String st5="INSERT INTO ogrenci VALUES(165,'5-B', 'ismail', 'kaya')";
       //String st6="INSERT INTO ogrenci VALUES(157,'6-S', 'hakan', 'sen')";

       //st.execute(st2);
       //st.execute(st3);
       //st.execute(st4);
       //st.execute(st5);
       //st.execute(st6);


        //isminin son harfi t olan ogrencileri isimlerini ve soy isimlerini listeleyelim
        String st7="SELECT * from ogrenci WHERE ogr_ad like '%t'";
        ResultSet r1=st.executeQuery(st7);
        while (r1.next()){

            System.out.println(r1.getString("ogr_ad")+"---"+r1.getString("ogr_soyad"));
        }

        // String st8="DELETE from ogrenci";
        // st.execute(st8);

        String st9="SELECT * from ogrenci";
        ResultSet r2=st.executeQuery(st9);
        while (r2.next()){

            System.out.println(r2.getString(1)+"\t"+r2.getString(2)+"\t"+r2.getString(3)+"\t"+r2.getString(4));
        }

        con.close();
        st.close();
    }
}