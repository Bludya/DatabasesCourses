import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;

/**
 * Created by Bludya on 21.10.2016 г..
 * All rights reserved!
 */
public class Problem_6_RemoveVillain {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/minions_db";
        String user = "exercise";
        String password = "1234";

        String selectVillainNameQuery = "SELECT name FROM villains WHERE id = ?";

        String deleteVillainQuery = "DELETE FROM villains\n" +
                " WHERE id = ?";
        String updateMinionsQuery = "UPDATE minions\n" +
                "   SET villain_id = NULL\n" +
                " WHERE villain_id = ?";

        try(Connection connection = DriverManager.getConnection(url, user, password);
            PreparedStatement updateStatement = connection.prepareStatement(updateMinionsQuery);
            PreparedStatement deleteStatement = connection.prepareStatement(deleteVillainQuery);
            PreparedStatement selectStatement = connection.prepareStatement(selectVillainNameQuery);
            BufferedReader reader = new BufferedReader(new InputStreamReader(System.in))) {

            int villainId = Integer.parseInt(reader.readLine());

            connection.setAutoCommit(false);
            selectStatement.setInt(1, villainId);
            updateStatement.setInt(1, villainId);
            deleteStatement.setInt(1, villainId);

            int affectedMinions = updateStatement.executeUpdate();


            ResultSet resultSet = selectStatement.executeQuery();

            if(!resultSet.isBeforeFirst()){
                connection.rollback();
                System.out.println("No such villain was found");
                return;
            }

            resultSet.next();
            String villainName = resultSet.getString("name");

            int affectedVillains = deleteStatement.executeUpdate();

            System.out.printf("%s was deleted%n", villainName);
            System.out.printf("%d minions released%n", affectedMinions);


        } catch (SQLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
