/**
 * application.properties in /src/main/resources needs to be changed to direct to test_data databse before running tests
 * You will also need to run spring boot locally and use local urls instead of tomcat
 */



package com.dsv.pvt.fikafocus;
import com.dsv.pvt.fikafocus.cafe.Cafe2;
import com.dsv.pvt.fikafocus.cafe.CafeRepository;
import com.dsv.pvt.fikafocus.review.ReviewRepository;
import com.dsv.pvt.fikafocus.user.UserRepository;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.Before;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Profile;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.StandardCharsets;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;


@ActiveProfiles("test")
public class DatabaseTest {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ReviewRepository reviewRepository;
    @Autowired
    private CafeRepository cafeRepository;

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
        assertEquals("abc123 café street 123 café abc123 123.456 1.01101 4 3", s);
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
        assertEquals("abc123@gmail.com abc123 123abc", s);
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
        assertEquals("1 2020-12-22 4 excellent coffee abc123 abc123@gmail.com", s);
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
        assertEquals("abc123 abc123@gmail.com", s);
    }
/*
    @Test
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
        assertEquals("abc123@gmail.com abc123 123abc", s);
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
        assertEquals("abc123 café street 123 café abc123 123.456 1.01101 4 3", s);
    }

    @Test
    void favouriteAppearsInDataBaseAfterAddingWithHTTP() throws IOException, SQLException{
        String sqlInsert = "insert into cafe2 (id, address, name, lat, lng, price, rating) " +
                "values ('abc123', 'café street 123', 'café abc123', '123.456', '1.01101', '4', '3')";
        stmt.executeUpdate(sqlInsert);
        String sqlInsert2 = "insert into user (email, username, pass) values ('abc123@gmail.com', 'abc123', '123abc')";
        stmt.executeUpdate(sqlInsert2);
        String data = "";
        URL url = new URL("http://127.0.0.1:8080/cafes/abc123@gmail.com/addfavourite/abc123");
        URLConnection connection = url.openConnection();
        HttpURLConnection http = (HttpURLConnection) connection;
        http.setRequestMethod("POST");
        http.setDoOutput(true);
        connection.getOutputStream().write(data.getBytes(StandardCharsets.UTF_8));
        connection.getInputStream();
        ResultSet myRs = stmt.executeQuery("select * from favourites");
        String s = null;
        if ( myRs.next() ) {
            s = myRs.getString("cafe_id") + " " + myRs.getString("user_id");
        }
        assertEquals("abc123 abc123@gmail.com", s);
    }

    @Test
    void reviewAppearsInDataBaseAfterAddingWithHTTP() throws IOException, SQLException{
        String sqlInsert = "insert into cafe2 (id, address, name, lat, lng, price, rating) " +
                "values ('abc123', 'café street 123', 'café abc123', '123.456', '1.01101', '4', '3')";
        stmt.executeUpdate(sqlInsert);
        String sqlInsert2 = "insert into user (email, username, pass) values ('abc123@gmail.com', 'abc123', '123abc')";
        stmt.executeUpdate(sqlInsert2);
        String data = "rating=4&reviewText=excellent coffee&cafeId=abc123&userEmail=abc123@gmail.com";
        URL url = new URL("http://127.0.0.1:8080/reviews/add");
        URLConnection connection = url.openConnection();
        HttpURLConnection http = (HttpURLConnection) connection;
        http.setRequestMethod("POST");
        http.setDoOutput(true);
        connection.getOutputStream().write(data.getBytes(StandardCharsets.UTF_8));
        connection.getInputStream();
        ResultSet myRs = stmt.executeQuery("select * from review");
        String s = null;
        String date = LocalDate.now().toString();
        if ( myRs.next() ) {
            s = 1 + " " + myRs.getString("date") +
                    " " + myRs.getString("rating") + " " + myRs.getString("review_string") +
                    " " + myRs.getString("cafe") + " " + myRs.getString("user");;
        }
        assertEquals("1 " + date + " 4 excellent coffee abc123 abc123@gmail.com", s);
    }

    @Test
    void favouriteByUserIdReturnsCorrectJSON() throws IOException, SQLException{
        String sqlInsert = "insert into cafe2 (id, address, name, lat, lng, price, rating) " +
                "values ('abc123', 'café street 123', 'café abc123', '123.456', '1.01101', '4', '3')";
        stmt.executeUpdate(sqlInsert);
        String sqlInsert2 = "insert into user (email, username, pass) values ('abc123@gmail.com', 'abc123', '123abc')";
        stmt.executeUpdate(sqlInsert2);
        String sqlInsert3 = "insert into favourites (cafe_id, user_id) " +
                "values ('abc123', 'abc123@gmail.com')";
        stmt.executeUpdate(sqlInsert3);
        String data = "";
        URL url = new URL("http://127.0.0.1:8080/cafes/abc123@gmail.com/favourites");
        URLConnection connection = url.openConnection();
        HttpURLConnection http = (HttpURLConnection) connection;
        http.setRequestMethod("GET");
        http.setDoOutput(true);
        StringBuilder informationString = new StringBuilder();
        Scanner scanner = new Scanner(url.openStream());

        while (scanner.hasNext()) {
            informationString.append(scanner.nextLine());
        }
        scanner.close();
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(String.valueOf(informationString));
        String cafe = jsonNode.at("/0/id").toString();
        assertEquals("\"abc123\"", cafe);
    }

    @Test
    void favouriteByCafeIdReturnsCorrectJSON() throws IOException, SQLException{
        String sqlInsert = "insert into cafe2 (id, address, name, lat, lng, price, rating) " +
                "values ('abc123', 'café street 123', 'café abc123', '123.456', '1.01101', '4', '3')";
        stmt.executeUpdate(sqlInsert);
        String sqlInsert2 = "insert into user (email, username, pass) values ('abc123@gmail.com', 'abc123', '123abc')";
        stmt.executeUpdate(sqlInsert2);
        String sqlInsert3 = "insert into favourites (cafe_id, user_id) " +
                "values ('abc123', 'abc123@gmail.com')";
        stmt.executeUpdate(sqlInsert3);
        String data = "";
        URL url = new URL("http://127.0.0.1:8080/cafes/abc123/favouritesbycafe");
        URLConnection connection = url.openConnection();
        HttpURLConnection http = (HttpURLConnection) connection;
        http.setRequestMethod("GET");
        http.setDoOutput(true);
        StringBuilder informationString = new StringBuilder();
        Scanner scanner = new Scanner(url.openStream());

        while (scanner.hasNext()) {
            informationString.append(scanner.nextLine());
        }
        scanner.close();
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(String.valueOf(informationString));
        String cafe = jsonNode.at("/0/email").toString();
        assertEquals("\"abc123@gmail.com\"", cafe);
    }

    @Test
    void removingFavouriteByHTTPRemovesCafe() throws IOException, SQLException{
        String sqlInsert = "insert into cafe2 (id, address, name, lat, lng, price, rating) " +
                "values ('abc123', 'café street 123', 'café abc123', '123.456', '1.01101', '4', '3')";
        stmt.executeUpdate(sqlInsert);
        String sqlInsert4 = "insert into cafe2 (id, address, name, lat, lng, price, rating) " +
                "values ('abc1234', 'café street 123', 'café abc1234', '123.456', '1.01101', '4', '3')";
        stmt.executeUpdate(sqlInsert4);
        String sqlInsert2 = "insert into user (email, username, pass) values ('abc123@gmail.com', 'abc123', '123abc')";
        stmt.executeUpdate(sqlInsert2);
        String sqlInsert3 = "insert into favourites (cafe_id, user_id) " +
                "values ('abc123', 'abc123@gmail.com')";
        stmt.executeUpdate(sqlInsert3);
        String sqlInsert5 = "insert into favourites (cafe_id, user_id) " +
                "values ('abc1234', 'abc123@gmail.com')";
        stmt.executeUpdate(sqlInsert5);
        String data = "";
        URL url = new URL("http://127.0.0.1:8080/cafes/abc123@gmail.com/removefavourite/abc1234");
        URLConnection connection = url.openConnection();
        HttpURLConnection http = (HttpURLConnection) connection;
        http.setRequestMethod("DELETE");
        http.setDoOutput(true);
        connection.getOutputStream().write(data.getBytes(StandardCharsets.UTF_8));
        connection.getInputStream();
        ResultSet myRs = stmt.executeQuery("select * from favourites");
        String s = null;
        if ( myRs.next() ) {
            s = myRs.getString("cafe_id") + " " + myRs.getString("user_id");
        }
        assertEquals("abc123 abc123@gmail.com", s);
    }

    @Test
    void reviewByUserIdReturnsCorrectJSON() throws IOException, SQLException{
        String sqlInsert = "insert into cafe2 (id, address, name, lat, lng, price, rating) " +
                "values ('abc123', 'café street 123', 'café abc123', '123.456', '1.01101', '4', '3')";
        stmt.executeUpdate(sqlInsert);
        String sqlInsert2 = "insert into user (email, username, pass) values ('abc123@gmail.com', 'abc123', '123abc')";
        stmt.executeUpdate(sqlInsert2);
        String sqlInsert3 = "insert into review (id, date, rating, review_string, cafe, user) " +
                "values (1, '2020-12-22', 4, 'excellent coffee', 'abc123', 'abc123@gmail.com')";
        stmt.executeUpdate(sqlInsert3);
        String data = "";
        URL url = new URL("http://127.0.0.1:8080/reviews/users/abc123@gmail.com");
        URLConnection connection = url.openConnection();
        HttpURLConnection http = (HttpURLConnection) connection;
        http.setRequestMethod("GET");
        http.setDoOutput(true);
        StringBuilder informationString = new StringBuilder();
        Scanner scanner = new Scanner(url.openStream());
        while (scanner.hasNext()) {
            informationString.append(scanner.nextLine());
        }
        scanner.close();
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(String.valueOf(informationString));
        String cafe = jsonNode.at("/0/review_string").toString();
        assertEquals("\"excellent coffee\"", cafe);
    }

*/
}
