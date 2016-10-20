import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;

/**
 * Created by Bludya on 20.10.2016 г..
 * All rights reserved!
 */
public class Problem_3_GetMinionNames {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/minions_db";
        String user = "exercise";
        String password = "1234";

        String getVillainQuery = "SELECT DISTINCT name\n" +
                "  FROM villains\n" +
                " WHERE id = ?;";

        String getMinionsQuery = "SELECT m.name, m.age\n" +
                "  FROM minions AS m\n" +
                " WHERE m.villain_id = ?;";

        try(Connection connection = DriverManager.getConnection(url, user, password);
            PreparedStatement villainStatement = connection.prepareStatement(getVillainQuery);
            PreparedStatement minionsStatement = connection.prepareStatement(getMinionsQuery);
            BufferedReader reader = new BufferedReader(new InputStreamReader(System.in))){
            int villainId = Integer.parseInt(reader.readLine());

            villainStatement.setInt(1, villainId);
            minionsStatement.setInt(1, villainId);

            ResultSet villain = villainStatement.executeQuery();

            //* @return <code>true</code> if the cursor is before the first row;
            // * <code>false</code> if the cursor is at any other position or the
            //        * result set contains no rows
            if(!villain.isBeforeFirst()){
                System.out.printf("No villain with ID %d exists in the database.%n", villainId);
                return;
            }

            villain.next();
            String villainName = villain.getString("name");
            System.out.printf("Villain: %s%n", villainName);

            ResultSet minions = minionsStatement.executeQuery();

            if(!minions.isBeforeFirst()){
                System.out.println("<no minions>");
                return;
            }


            while(minions.next()){
                int row = minions.getRow();
                String name = minions.getString("name");
                int age = minions.getInt("age");

                System.out.printf("%d. %s %d%n", row, name, age);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
