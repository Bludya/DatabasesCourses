import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Bludya on 23.10.2016 г..
 * All rights reserved!
 */
public class Problem_7_PrintAllMinionNames {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/minions_db";
        String user = "exercise";
        String password = "1234";

        String selectQuery = "SELECT name FROM minions";

        try (Connection connection = DriverManager.getConnection(url, user, password);
                ) {
            Statement select = connection.createStatement();
            ResultSet resultSet = select.executeQuery(selectQuery);

            List<String> names = new ArrayList<>();

            while (resultSet.next()){
                names.add(resultSet.getString("name"));
            }

            int n = names.size();
            for (int i = 0; i < n / 2; i++) {
                System.out.println(names.get(i));
                System.out.println(names.get(n-i-1));
            }

            if(n % 2== 1) {
                System.out.printf(names.get(n/2));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
