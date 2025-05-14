package org.example;
import java.sql.*;
public class Main{
    public static void main(String[] args) {

    String url = "jdbc:postgresql://localhost:5432/intership";
    String user = "postgres";
    String password = "0000";

 try(Connection conn = DriverManager.getConnection(url, user, password)) {
        Statement stat = conn.createStatement();
     System.out.println("Kerkesa 4.a:");
        ResultSet rs = stat.executeQuery("SELECT table_name FROM information_schema.tables WHERE table_schema = 'public'");
     while (rs.next()) {
         System.out.println("Tabela: " + rs.getString("table_name"));
     }
     rs.close();

     System.out.println("\n Kerkesa 4.b:");
     ResultSet rs1 = stat.executeQuery("SELECT * FROM kursi");
     while (rs1.next()) {
         System.out.println(rs1.getString("emri_kursit") +"--" +rs1.getString("kohezgjatja") + "--" + rs1.getString("create_date") + "--" + rs1.getString("update_date"));
     }
     rs1.close();

     System.out.println("\n Kerkesa 4.c:");
     ResultSet rs2 = stat.executeQuery("SELECT * FROM student" +
             " WHERE pike > 10");
     while (rs2.next()) {
         System.out.println(rs2.getString("name") + "  " + rs2.getString("pike") );
     }
     rs2.close();

     System.out.println("\n Kerkesa 4.d:");
     int shtoRrjesht = stat.executeUpdate("INSERT INTO student (name, email, birth_date, phone_number, pike, student_key) " +
             "VALUES ('samanta', 'manta@gmail.com', '2004-10-19', '0681143122', 15, 5)");
     ResultSet rs3 = stat.executeQuery("SELECT * FROM student WHERE name='samanta'");
     while (rs3.next()) {
         System.out.println(rs3.getString("name") + "  " + rs3.getString("email") + "  " + rs3.getString("birth_date") + "  " + rs3.getInt("pike") + "   " + rs3.getInt("student_key"));
     }
         rs3.close();

     System.out.println("\n Kerkesa 4.e:");
     int modifikoPIket = stat.executeUpdate("UPDATE student SET pike = 20 WHERE student_key= 2");
     ResultSet rs4 = stat.executeQuery("SELECT * FROM student WHERE student_key= 2");
     while (rs4.next()) {
         System.out.println(rs4.getString("name") + "  " + rs4.getInt("pike"));
     }
     rs4.close();

     System.out.println("\n Kerkesa 4.f:");
     int fshiStudent = stat.executeUpdate("DELETE FROM student WHERE student_key= 2");
     ResultSet rs5 = stat.executeQuery("SELECT * FROM student");
     System.out.println("Tabela pas fshirjes se studentit:\n ");
     while (rs5.next()) {
         System.out.println(rs5.getString("name") + "  " + rs5.getString("email") + "  " + rs5.getString("birth_date") + "  " + rs5.getInt("pike") + "   " + rs5.getInt("student_key"));
     }
     rs5.close();


 }
            catch(SQLException e){
        e.printStackTrace();
    }
}
}


