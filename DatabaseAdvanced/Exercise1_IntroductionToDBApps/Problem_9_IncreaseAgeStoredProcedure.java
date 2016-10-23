import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;

/**
 * Created by Bludya on 23.10.2016 г..
 * All rights reserved!
 */
public class Problem_9_IncreaseAgeStoredProcedure {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/minions_db";
        String user = "exercise";
        String password = "1234";

        String callProcedureQuery = "CALL usp_get_older(?)";
        String selectQuery = "SELECT name, age FROM minions WHERE id = ?";

        try (Connection connection = DriverManager.getConnection(url, user, password);
             PreparedStatement callProcedureStatement = connection.prepareStatement(callProcedureQuery);
             PreparedStatement selectStatement = connection.prepareStatement(selectQuery);
             BufferedReader reader = new BufferedReader(new InputStreamReader(System.in))) {

            int id = Integer.parseInt(reader.readLine());

            callProcedureStatement.setInt(1, id);
            callProcedureStatement.executeUpdate();

            selectStatement.setInt(1, id);

            ResultSet resultSet = selectStatement.executeQuery();

            while(resultSet.next()){
                String name = resultSet.getString("name");
                int age = resultSet.getInt("age");

                System.out.printf("%s %d%n", name ,age);
            }


        } catch (SQLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
