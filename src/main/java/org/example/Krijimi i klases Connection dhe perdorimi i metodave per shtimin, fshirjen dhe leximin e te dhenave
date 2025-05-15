package org.example;
import java.sql.*;
import java.util.Map;

public class Studentt {
    public static void krijoTable(String tableName, Map<String, String> columns) throws SQLException {
        StringBuilder sb = new StringBuilder("CREATE TABLE IF NOT EXISTS " + tableName + " (");

        for (Map.Entry<String, String> entry : columns.entrySet()) {
            sb.append(entry.getKey()).append(" ").append(entry.getValue()).append(", ");
        }
        sb.setLength(sb.length() - 2); //per te hequr presjen dhe hapesiren e fundit
        sb.append(")");
        try (Statement stmt = DBConnection.getConnection().createStatement()) {
            stmt.executeUpdate(sb.toString());
        }
    }

    public static void shtoStudent(String emri, String emaili) throws SQLException {
        String sql = "INSERT INTO student (name, emaili) VALUES (?, ?)";

        try (PreparedStatement pstmt = DBConnection.getConnection().prepareStatement(sql)) {
            pstmt.setString(1, emri);
            pstmt.setString(2, emaili);
            pstmt.executeUpdate();
            System.out.println("Studenti u shtua me sukses!");
        }
    }

    public static void printoStudentet() throws SQLException {
        String sql = "SELECT * FROM student";

        try (Statement stmt = DBConnection.getConnection().createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                System.out.println(rs.getInt("id") + "  " +
                        rs.getString("name") + "  " +
                        rs.getString("emaili"));
            }
        }
    }

    public static void getStudentById(int id) throws SQLException {
        String sql = "SELECT * FROM student WHERE id = ?";

        try (PreparedStatement pstmt = DBConnection.getConnection().prepareStatement(sql)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                System.out.println("Id: " + rs.getInt("id"));
                System.out.println("Emri: " + rs.getString("name"));
                System.out.println("Emaili: " + rs.getString("emaili"));
            } else {
                System.out.println("Studenti me Id " + id + " nuk u gjet");
            }
        }
    }

    public static void ndryshoStudent(int id, String emri, String email) throws SQLException {
        String sql = "UPDATE student SET name = ?, emaili = ? WHERE id = ?";

        try (PreparedStatement pstmt = DBConnection.getConnection().prepareStatement(sql)) {
            pstmt.setString(1, emri);
            pstmt.setString(2, email);
            pstmt.setInt(3, id);

            int rows = pstmt.executeUpdate();
            if (rows > 0) {
                System.out.println("Studenti u ndryshua");
            } else {
                System.out.println("Nuk u be asnje ndryshimm");
            }
        }
    }

    public static void fshiStudent(int id) throws SQLException {
        String sql = "DELETE FROM student WHERE id = ?";

        try (PreparedStatement pstmt = DBConnection.getConnection().prepareStatement(sql)) {
            pstmt.setInt(1, id);
            int rows = pstmt.executeUpdate();
            if (rows > 0) {
                System.out.println("studenti u fshi me sukses");
            } else {
                System.out.println("nuk u fshi asnje student");
            }
        }
    }
}



