import java.sql.*;

/**
 * Created by Bludya on 20.10.2016 г..
 * All rights reserved!
 */
public class Problem_2_GetVillainsName {

    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/minions_db";
        String user = "exercise";
        String password = "1234";

        String query = "SELECT v.name, COUNT(m.name) as minions\n" +
                "  FROM villains AS v\n" +
                "  JOIN minions AS m\n" +
                "    ON v.id = m.villain_id\n" +
                " GROUP BY v.name\n" +
                "HAVING COUNT(m.name) > 3\n" +
                " ORDER BY COUNT(m.name) DESC";

        try(Connection connection = DriverManager.getConnection(url, user, password);
            Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery(query);

            while(resultSet.next()){
                String name = resultSet.getString("name");
                int minions = resultSet.getInt("minions");

                System.out.printf("%s %d%n", name, minions);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}