/**
 * Application.properties needs to be changed to direct to test_data before running tests
 * You will also need to run spring boot locally and use local urls instead of tomcat
 */



package com.dsv.pvt.fikafocus;
import com.dsv.pvt.fikafocus.cafe.Cafe2;
import org.junit.Before;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.Assert.*;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.StandardCharsets;
import java.sql.*;

public class DatabaseTest {
    private static Statement stmt;

    @BeforeEach
    void connectToTestDataBase(){
        try {
            //connection to database
            Connection conn = DriverManager.getConnection("jdbc:mariadb://mysql.dsv.su.se:3306/test_data","axda2670","Ua5rah6eengu");
            stmt = conn.createStatement();
            stmt.executeQuery("delete from favourites");
            stmt.executeQuery("delete from review");
            stmt.executeQuery("delete from cafe2");
            stmt.executeQuery("delete from user");

        } catch (
                SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Test
    void cafeAppearsInDatabaseAfterAddingWithSQLQuery() throws SQLException{
        String sqlInsert = "insert into cafe2 (id, address, name, lat, lng, price, rating) " +
                "values ('abc123', 'café street 123', 'café abc123', '123.456', '1.01101', '4', '3')";
        stmt.executeUpdate(sqlInsert);
        ResultSet myRs = stmt.executeQuery("select * from cafe2");
        String s = null;
        if ( myRs.next() ) {
            s = myRs.getString("id") + " " + myRs.getString("address") +
                    " " + myRs.getString("name") + " " + myRs.getString("lat") +
                    " " + myRs.getString("lng") + " " + myRs.getString("price") +
                    " " + myRs.getString("rating");
        }
        assertTrue(s.equals("abc123 café street 123 café abc123 123.456 1.01101 4 3"));
    }

    @Test
    void userAppearsInDatabaseAfterAddingWithSQLQuery() throws SQLException{
        String sqlInsert = "insert into user (email, username, pass) values ('abc123@gmail.com', 'abc123', '123abc')";
        stmt.executeUpdate(sqlInsert);
        ResultSet myRs = stmt.executeQuery("select * from user");
        String s = null;
        if ( myRs.next() ) {
            s = myRs.getString("email") + " " + myRs.getString("username") +
                    " " + myRs.getString("pass");
        }
        assertTrue(s.equals("abc123@gmail.com abc123 123abc"));
    }

    @Test
    void reviewAppearsInDatabaseAfterAddingWithSQLQuery() throws SQLException{
        String sqlInsert = "insert into cafe2 (id, address, name, lat, lng, price, rating) " +
                "values ('abc123', 'café street 123', 'café abc123', '123.456', '1.01101', '4', '3')";
        stmt.executeUpdate(sqlInsert);
        String sqlInsert2 = "insert into user (email, username, pass) values ('abc123@gmail.com', 'abc123', '123abc')";
        stmt.executeUpdate(sqlInsert2);
        String sqlInsert3 = "insert into review (id, date, rating, review_string, cafe, user) " +
                "values (1, '2020-12-22', 4, 'excellent coffee', 'abc123', 'abc123@gmail.com')";
        stmt.executeUpdate(sqlInsert3);
        ResultSet myRs = stmt.executeQuery("select * from review");
        String s = null;
        if ( myRs.next() ) {
            s = myRs.getString("id") + " " + myRs.getString("date") +
                    " " + myRs.getString("rating") + " " + myRs.getString("review_string") +
                    " " + myRs.getString("cafe") + " " + myRs.getString("user");;
        }
        assertTrue(s.equals("1 2020-12-22 4 excellent coffee abc123 abc123@gmail.com"));
    }

    @Test
    void favouriteAppearsInDatabaseAfterAddingWithSQLQuery() throws SQLException{
        String sqlInsert = "insert into cafe2 (id, address, name, lat, lng, price, rating) " +
                "values ('abc123', 'café street 123', 'café abc123', '123.456', '1.01101', '4', '3')";
        stmt.executeUpdate(sqlInsert);
        String sqlInsert2 = "insert into user (email, username, pass) values ('abc123@gmail.com', 'abc123', '123abc')";
        stmt.executeUpdate(sqlInsert2);
        String sqlInsert3 = "insert into favourites (cafe_id, user_id) " +
                "values ('abc123', 'abc123@gmail.com')";
        stmt.executeUpdate(sqlInsert3);
        ResultSet myRs = stmt.executeQuery("select * from favourites");
        String s = null;
        if ( myRs.next() ) {
            s = myRs.getString("cafe_id") + " " + myRs.getString("user_id");
        }
        assertTrue(s.equals("abc123 abc123@gmail.com"));
    }

/*    @Test
    void userAppearsInDataBaseAfterAddingWithHTTP() throws IOException, SQLException{
        String data = "email=abc123@gmail.com&username=abc123&password=123abc";
        URL url = new URL("http://127.0.0.1:8080/user/add");
        URLConnection connection = url.openConnection();
        HttpURLConnection http = (HttpURLConnection) connection;
        http.setRequestMethod("POST");
        http.setDoOutput(true);
        connection.getOutputStream().write(data.getBytes(StandardCharsets.UTF_8));
        connection.getInputStream();
        ResultSet myRs = stmt.executeQuery("select * from user");
        String s = null;
        if ( myRs.next() ) {
            s = myRs.getString("email") + " " + myRs.getString("username") +
                    " " + myRs.getString("pass");
        }
        assertTrue(s.equals("abc123@gmail.com abc123 123abc"));
    }

    @Test
    void cafeAppearsInDataBaseAfterAddingWithHTTP() throws IOException, SQLException{
        String data = "id=abc123&address=café street 123&name=café abc123&lat=123.456&lng=1.01101&price=4&rating=3";
        URL url = new URL("http://127.0.0.1:8080/cafes/add");
        URLConnection connection = url.openConnection();
        HttpURLConnection http = (HttpURLConnection) connection;
        http.setRequestMethod("POST");
        http.setDoOutput(true);
        connection.getOutputStream().write(data.getBytes(StandardCharsets.UTF_8));
        connection.getInputStream();
        ResultSet myRs = stmt.executeQuery("select * from cafe2");
        String s = null;
        if ( myRs.next() ) {
            s = myRs.getString("id") + " " + myRs.getString("address") +
                    " " + myRs.getString("name") + " " + myRs.getString("lat") +
                    " " + myRs.getString("lng") + " " + myRs.getString("price") +
                    " " + myRs.getString("rating");
        }
        assertTrue(s.equals("abc123 café street 123 café abc123 123.456 1.01101 4 3"));
    }

*/
}
