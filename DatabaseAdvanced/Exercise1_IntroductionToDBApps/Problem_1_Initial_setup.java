import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by Bludya on 20.10.2016 г..
 * All rights reserved!
 */
public class Problem_1_Initial_setup {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306";
        String user = "exercise";
        String password = "1234";

        String createDatabaseQuery = "CREATE DATABASE minions_db ";
        
        String useDatabaseQuery = "USE minions_db";

        String createCountriesQuery = "CREATE TABLE countries " +
                "(id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, " +
                "name VARCHAR(50))" ;

        String createCitiesQuery = "CREATE TABLE cities (" +
                "id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, " +
                "name VARCHAR(50), " +
                "country_id INT NOT NULL, " +
                "CONSTRAINT FOREIGN KEY(country_id) " +
                "REFERENCES countries(id))";

        String createVillainsQuery = "CREATE TABLE villains(" +
                "id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, " +
                "name VARCHAR(50), " +
                "evilness_factor VARCHAR(50))";

        String createMinionsQuery = "CREATE TABLE minions ( " +
                "id INT NOT NULL AUTO_INCREMENT PRIMARY KEY," +
                "name VARCHAR(50)," +
                "age INT," +
                "town_id INT NOT NULL," +
                "villain_id INT NOT NULL," +
                "CONSTRAINT FOREIGN KEY(town_id)" +
                "REFERENCES cities(id)," +
                "CONSTRAINT FOREIGN KEY(villain_id)" +
                "REFERENCES villains(id))";

        String insertCountriesQuery = "INSERT INTO countries(id, name) VALUES " +
                "(1, \"Bulgaria\")," +
                "(2, \"Turkey\")," +
                "(3, \"Serbia\")," +
                "(4, \"Romania\")," +
                "(5, \"Greece\")";

        String insertCitiesQuery = "INSERT INTO cities (id, name, country_id) VALUES " +
                "(1,\"Sofia\", 1)," +
                "(2,\"Scopie\", 3)," +
                "(3,\"Timisoara\", 4)," +
                "(4,\"Istanbul\", 2)," +
                "(5,\"Athens\", 5)";

        String insertVillainsQuery = "INSERT INTO villains (id, name, evilness_factor) VALUES " +
                "(1,\"Pesho\", \"super evil\" ), " +
                "(2,\"Dimo\", \"bad\" ), " +
                "(3,\"Ivan\", \"good\" ), " +
                "(4,\"Misho\", \"super evil\" ), " +
                "(5,\"Ilia\", \"evil\" )";

        String insertMinionsQuery = "INSERT INTO minions (id, name, age, town_id, villain_id) VALUES " +
                "(1, \"Banana\", 5, 1, 2), " +
                "(2, \"Apple\", 1, 2, 2), " +
                "(3, \"Pen\", 2, 3, 1), " +
                "(4, \"Pineapple\", 1, 5, 3), " +
                "(5, \"Whatever\", 1, 4, 3)";

        try(Connection connection = DriverManager.getConnection(url, user, password);
            Statement statement = connection.createStatement()){
            
            //create and use the new database
            statement.executeUpdate(createDatabaseQuery);
            statement.executeUpdate(useDatabaseQuery);
            
            //creating tables
            statement.executeUpdate(createCountriesQuery);
            statement.executeUpdate(createCitiesQuery);
            statement.executeUpdate(createVillainsQuery);
            statement.executeUpdate(createMinionsQuery);
            
            //inserting values
            statement.executeUpdate(insertCountriesQuery);
            statement.executeUpdate(insertCitiesQuery);
            statement.executeUpdate(insertVillainsQuery);
            statement.executeUpdate(insertMinionsQuery);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
