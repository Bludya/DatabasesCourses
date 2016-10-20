import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Bludya on 21.10.2016 г..
 * All rights reserved!
 */
public class Problem_5_ChangeTownNameCasing {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/minions_db";
        String user = "exercise";
        String password = "1234";

        String getCountryQuery = "SELECT id\n" +
                "  FROM countries\n" +
                " WHERE name = ?";

        String updateTownsQuery = "UPDATE cities AS c\n" +
                "   SET c.name = UPPER(c.name)\n" +
                " WHERE c.country_id = ?";

        String getChangedTownsQuery = "SELECT name\n" +
                "  FROM cities\n" +
                " WHERE country_id = ?";

        try(Connection connection = DriverManager.getConnection(url, user, password);
            BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
            PreparedStatement getCountryStatement = connection.prepareStatement(getCountryQuery);
            PreparedStatement updateTownsStatement = connection.prepareStatement(updateTownsQuery);
            PreparedStatement getChangedTownsStatement = connection.prepareStatement(getChangedTownsQuery)
                ) {
            String countryName = reader.readLine();

            getCountryStatement.setString(1, countryName);
            ResultSet country = getCountryStatement.executeQuery();
            if(!country.isBeforeFirst()){
                System.out.println("No town names were affected.");
                return;
            }
            country.next();
            int countryId = country.getInt("id");

            updateTownsStatement.setInt(1, countryId);
            int changedTownsCount = updateTownsStatement.executeUpdate();

            getChangedTownsStatement.setInt(1, countryId);
            ResultSet changedTowns = getChangedTownsStatement.executeQuery();

            List<String> changedTownsNames = new ArrayList<>();
            while(changedTowns.next()){
                changedTownsNames.add(changedTowns.getString("name"));
            }

            if(changedTownsCount > 0) {
                System.out.printf("%d town names were affected.%n", changedTownsCount);
                System.out.println(changedTownsNames.toString());
            }
            else {
                System.out.println("No town names were affected.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
