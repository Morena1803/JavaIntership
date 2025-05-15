package org.example;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        try {
            Map<String, String> columns = new HashMap<>();
            columns.put("id", "SERIAL PRIMARY KEY");
            columns.put("name", "VARCHAR(50) NOT NULL");
            columns.put("emaili", "VARCHAR(50) UNIQUE NOT NULL");
            Studentt.krijoTable("student", columns);

            System.out.println("Jepnii emrin e studentit:");
            String emri = scanner.nextLine();

            System.out.println("Jep emailin e studentit:");
            String emaili = scanner.nextLine();

            Studentt.shtoStudent(emri, emaili);

            System.out.println("\nLista e studenteve:");
            Studentt.printoStudentet();

            System.out.println("\nJep Id e studentit qe doni te printoni:");
            int idGjetjes = Integer.parseInt(scanner.nextLine());
            Studentt.getStudentById(idGjetjes);

            System.out.println("\nJepni Id e studentit qe doni te ndryshoni:");
            int idUpdate = Integer.parseInt(scanner.nextLine().trim());

            System.out.println("Jep emrin e ri te studentit:");
            String emriUpdate = scanner.nextLine().trim();

            System.out.println("Jep emailin e ri te studentit:");
            String emailUpdate = scanner.nextLine().trim();
            Studentt.ndryshoStudent(idUpdate, emriUpdate, emailUpdate);
            Studentt.getStudentById(idUpdate);


            System.out.println("\nJep Id e studentit qe deshironi te fshini:");
            int idDelete = Integer.parseInt(scanner.nextLine().trim());
            Studentt.fshiStudent(idDelete);

            System.out.println("\nStudentet pas fshirjes:");
            Studentt.printoStudentet();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}