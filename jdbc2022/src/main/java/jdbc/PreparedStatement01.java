package jdbc;

import java.sql.*;

public class PreparedStatement01 {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        Class.forName("org.postgresql.Driver");
        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/techproed", "postgres", "hamza.2021");
        Statement st = con.createStatement();

        //1. Örnek: Prepared statement kullanarak company adı IBM olan number_of_employees değerini 9999 olarak güncelleyin.

        //1.Adim: Prepared statement query i olustur
        String sql1 = "UPDATE companies SET number_of_employees=? WHERE company = ?";

        // 2.Adim: PreparedStatement objesini olustur
        PreparedStatement pst1 = con.prepareStatement(sql1);

        // 3.Adim:set....() metodlari ile ? isaretleri icin deger girlecek
        pst1.setInt(1, 9999);
        pst1.setString(2, "IBM");

        //4.Adim: Execute query
        int updateRowSayisi = pst1.executeUpdate();
        System.out.println(updateRowSayisi + " Satir Guncellendi");

        String sql2 = "SELECT * FROM companies";
        ResultSet result1 = st.executeQuery(sql2);
        while (result1.next()) {

            System.out.println(result1.getInt(1) + "--" + result1.getString(2) + "--" + result1.getInt(3));

        }

        //1. Örnek: Prepared statement kullanarak company adı GOOGLE  olan number_of_employees değerini 15999 olarak güncelleyin.

        //1.Adim: Prepared statement query i olustur
        String sql3 = "UPDATE companies SET number_of_employees=? WHERE company = ?";

        // 2.Adim: PreparedStatement objesini olustur
        PreparedStatement pst2 = con.prepareStatement(sql1);

        // 3.Adim:set....() metodlari ile ? isaretleri icin deger girlecek
        System.out.println("==============================");
        pst2.setInt(1, 15999);
        pst2.setString(2, "GOOGLE");

        //4.Adim: Execute query
        int updateRowSayisi1 = pst2.executeUpdate();
        System.out.println(updateRowSayisi1 + " Satir Guncellendi");

        String sql4 = "SELECT * FROM companies";
        ResultSet result2 = st.executeQuery(sql4);
        while (result2.next()) {

            System.out.println(result2.getInt(1) + "--" + result2.getString(2) + "--" + result2.getInt(3));

        }


    //2. Örnek: "SELECT * FROM <table name>" query'sini prepared statement ile kullanın.
        System.out.println("*********************");
        read_data(con,"contries");

}
    //Bir tablonun istenilen datasını prepared statement ile çağırmak için kullanılan method.
    public static void read_data(Connection con, String tableName) {

        try {

            String query = String.format("SELECT * FROM %s", tableName);//Format() methodu dinamik String oluşturmak için kullanılır.

            Statement statement = con.createStatement();

            //SQL query'yi çalıştır.
            ResultSet rs = statement.executeQuery(query);//Datayı çağırıp ResultSet konteynırına koyuyoruz.

            while (rs.next()) {//Tüm datayı çağıralım.

                System.out.println(rs.getString(1) + " - " + rs.getString(2) + " - " + rs.getInt(3));

            }


        } catch (Exception e) {
            System.out.println(e);
        }
    }
}