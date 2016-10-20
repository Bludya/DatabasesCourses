import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;

/**
 * Created by Bludya on 21.10.2016 г..
 * All rights reserved!
 */
public class Problem_4_AddMinion {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/minions_db";
        String user = "exercise";
        String password = "1234";

        String getCity = "SELECT id\n" +
                "  FROM cities\n" +
                " WHERE name = ?";

        String getVillain = "SELECT id\n" +
                "  FROM villains AS m\n" +
                " WHERE name = ?;";

        //hardcoded country since not given in the assignment
        String insertCity = "INSERT INTO cities (name, country_id) VALUES" +
                "(?, 1)";

        String insertVillain = "INSERT INTO villains(name, evilness_factor) VALUES" +
                "(?, \"evil\")";

        String insertMinion = "INSERT INTO minions(name, age, city_id, villain_id) VALUES " +
                "(?, ?, ?, ?)";

        try(Connection connection = DriverManager.getConnection(url, user, password);
            BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
            PreparedStatement getCityStatement = connection.prepareStatement(getCity);
            PreparedStatement getVillainStatement = connection.prepareStatement(getVillain);
            PreparedStatement insertCityStatement = connection.prepareStatement(insertCity);
            PreparedStatement insertVillainStatement = connection.prepareStatement(insertVillain);
            PreparedStatement insertMinionStatement = connection.prepareStatement(insertMinion);
        ) {

            connection.setAutoCommit(false);

            String[] minionData = reader.readLine().split("\\s+");
            String minionName = minionData[1];
            int minionAge = Integer.parseInt(minionData[2]);
            String cityName = minionData[3];

            String[] villainData = reader.readLine().split("\\s+");
            String villainName = villainData[1];

            getCityStatement.setString(1, cityName);
            insertCityStatement.setString(1, cityName);
            getVillainStatement.setString(1, villainName);
            insertVillainStatement.setString(1, villainName);

            int cityInDb = 1;
            int villainInDb = 1;
            int minionInDb = 1;

            if(!getCityStatement.executeQuery().isBeforeFirst()){
                if(insertCityStatement.executeUpdate() > 0){
                    System.out.printf("Town %s was added to the database.%n", cityName);
                }
                else {
                    connection.rollback();
                    return;
                }
            }

            ResultSet city = getCityStatement.executeQuery();
            city.next();
            int cityId = city.getInt("id");

            if(!getVillainStatement.executeQuery().isBeforeFirst()){
                if(insertVillainStatement.executeUpdate() > 0){
                   System.out.printf("Villain %s was added to the database.%n", villainName);
                }
                else {
                    connection.rollback();
                    return;
                }
            }

            ResultSet villain = getVillainStatement.executeQuery();
            villain.next();
            int villainId = villain.getInt("id");

            insertMinionStatement.setString(1, minionName);
            insertMinionStatement.setInt(2, minionAge);
            insertMinionStatement.setInt(3, cityId);
            insertMinionStatement.setInt(4, villainId);

            if(insertMinionStatement.executeUpdate() > 0){
                System.out.printf("Successfully added %s to be minion of %s%n", minionName, villainName);
                connection.commit();
            }
            else {
                connection.rollback();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
