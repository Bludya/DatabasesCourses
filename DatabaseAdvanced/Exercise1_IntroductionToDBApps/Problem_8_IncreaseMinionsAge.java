import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Bludya on 23.10.2016 г..
 * All rights reserved!
 */
public class Problem_8_IncreaseMinionsAge {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/minions_db";
        String user = "exercise";
        String password = "1234";

        //taken from https://brianloomis.wordpress.com/2009/10/15/working-with-titlecase-in-mysql/
       /* String createFunctionQuery =
                "CREATE FUNCTION usf_tcase( str VARCHAR(128) )\n" +
                "RETURNS VARCHAR(128)\n" +
                "BEGIN\n" +
                "\tDECLARE c CHAR(1);\n" +
                "\tDECLARE s VARCHAR(128);\n" +
                "\tDECLARE i INT DEFAULT 1;\n" +
                "\tDECLARE bool INT DEFAULT 1;\n" +
                "\tDECLARE punct CHAR(17) DEFAULT ' ()[]{},.-_!@;:?/';\n" +
                "\t\n" +
                "\tSET s = LCASE( str );\n" +
                "\tWHILE i <= LENGTH( str ) DO   -- Jesse Palmer's correction from < to <= for last char\n" +
                "\t   BEGIN\n" +
                "\t\tSET c = SUBSTRING( s, i, 1 );\n" +
                "\t\tIF LOCATE( c, punct ) > 0 THEN\n" +
                "\t\t\tSET bool = 1;\n" +
                "\t\tELSEIF bool=1 THEN\n" +
                "\t\t\tBEGIN\n" +
                "\t\t\t\tIF c >= 'a' AND c <= 'z' THEN\n" +
                "\t\t\t\tBEGIN\n" +
                "\t\t\t\t\tSET s = CONCAT(LEFT(s,i-1),UCASE(c),SUBSTRING(s,i+1));\n" +
                "\t\t\t\t\tSET bool = 0;\n" +
                "\t\t\t\tEND;\n" +
                "\t\t\t\tELSEIF c >= '0' AND c <= '9' THEN\n" +
                "\t\t\t\t\tSET bool = 0;\n" +
                "\t\t\t\tEND IF;\n" +
                "\t\t\tEND;\n" +
                "\t\tEND IF;\n" +
                "\t\tSET i = i+1;\n" +
                "\t\tEND;\n" +
                "\tEND WHILE;\n" +
                "\tRETURN s;\n" +
                "END;\n";*/

        String updateQuery = "UPDATE minions AS m\n" +
                "   SET m.age = m.age + 1, " +
                "       m.name = usf_tcase(m.name)\n" +
                " WHERE id IN ";

        String selectQuery = "SELECT name, age" +
                "  FROM minions" +
                " WHERE id IN ";

        try (Connection connection = DriverManager.getConnection(url, user, password);
          //   PreparedStatement createFunctionStatement = connection.prepareStatement(createFunctionQuery);
             Statement statement = connection.createStatement();
             BufferedReader reader = new BufferedReader(new InputStreamReader(System.in))
        ) {

            //createFunctionStatement.execute();
            String idsAsStrings = "(" + reader.readLine().replaceAll("\\s+", ",") + ")";

            updateQuery += idsAsStrings;
            selectQuery += idsAsStrings;

            statement.executeUpdate(updateQuery);
            ResultSet resultSet = statement.executeQuery(selectQuery);

            while(resultSet.next()){
                String name = resultSet.getString("name");
                int age = resultSet.getInt("age");

                System.out.printf("%s %d%n", name, age);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
