package com.dsv.pvt.fikafocus;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.json.simple.parser.ParseException;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import java.sql.*;  // Using 'Connection', 'Statement' and 'ResultSet' classes in java.sql package
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class APIDataLoader {
    private static final String PRIVATE_KEY = "pri_1c91095bed164fcfbf513b76b7c4749e";
    private static final String PUBLIC_KEY = "pub_2f5ebfbf48c748338a26235c9d21fd53";
    public static void main(String[] args) {
        {
            try {
                URL url = queryFilteredVenues("59.32166538","18.06916639","30000");
                HttpURLConnection conn2 = getConnection(url);

                //Check if connect is made
                int responseCode = conn2.getResponseCode();

                // 200 OK
                if ( responseCode != 200 ) {
                    throw new RuntimeException("HttpResponseCode: " + responseCode);
                } else {

                    StringBuilder informationString = new StringBuilder();
                    Scanner scanner = new Scanner(url.openStream());

                    while (scanner.hasNext()) {
                        informationString.append(scanner.nextLine());
                    }
                    scanner.close();
                    printResponse_jackson_venuenames(informationString);

                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        } // Step 5: Close conn and stmt - Done automatically by try-with-resources (JDK 7)
    }

    public static URL queryFilteredVenues(String latitude, String longitude, String radius) throws MalformedURLException{
        return new URL("https://besttime.app/api/v1/venues/filter?api_key_private="+ PRIVATE_KEY +"&busy_min=0&busy_max=100&types=CAFE&lat=" + latitude + "&lng=" + longitude + "&radius=" + radius + "&order_by=day_rank_max%2Creviews&order=asc%2Cdesc&foot_traffic=both&limit=100&page=0");
    }

    public static HttpURLConnection getConnection(URL url) throws IOException{
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.connect();
        return conn;
    }

    public static void printResponse_jackson_venuenames(StringBuilder informationString) throws ParseException, JsonProcessingException{

        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(String.valueOf(informationString));
        int venue_index = 0;

        // dessa två rader kan tas ut till egen metod
        ArrayList<String> names = new ArrayList();
        List<JsonNode> listOfNodes = jsonNode.findParents("venue_name");


        for(int i = 0; i < listOfNodes.size(); i++) {
            String sourceStringID = jsonNode.at("/venues/" + venue_index + "/venue_id").toString();
            String sourceStringAddress = jsonNode.at("/venues/" + venue_index + "/venue_address").toString();
            String sourceStringName = jsonNode.at("/venues/" + venue_index + "/venue_name").toString();
            String sourceStringLat = jsonNode.at("/venues/" + venue_index + "/venue_lat").toString();
            String sourceStringLng = jsonNode.at("/venues/" + venue_index + "/venue_lng").toString();
            String sourceStringPrice = jsonNode.at("/venues/" + venue_index + "/price_level").toString();
            String sourceStringRating = jsonNode.at("/venues/" + venue_index + "/rating").toString();

            //String sourceString3 = jsonNode.at("/venues/" + venue_index + "/day_info").get("venue_open").toString();
            //String sourceString4 = jsonNode.at("/venues/" + venue_index + "/day_info").get("venue_closed").toString();

            try {
                // Step 1: Construct a database 'Connection' object called 'conn'
                Connection conn = DriverManager.getConnection(
                        "jdbc:mariadb://mysql.dsv.su.se:3306/axda2670",
                        "axda2670", "Ua5rah6eengu");   // For MySQL only
                // The format is: "jdbc:mysql://hostname:port/databaseName", "username", "password"
                // Step 2: Construct a 'Statement' object called 'stmt' inside the Connection created
                Statement stmt = conn.createStatement();
                String sqlInsert = "insert into cafe2 (id, address, name, lat, lng, price, rating) values ("+ sourceStringID + ", " + sourceStringAddress + ", "+ sourceStringName + ", "+ sourceStringLat + ", " + sourceStringLng + ", " + sourceStringPrice + ", " + sourceStringRating +")";
                System.out.println("The SQL statement is: " + sqlInsert + "\n");  // Echo for debugging
                int countInserted = stmt.executeUpdate(sqlInsert);
                System.out.println(countInserted + " records inserted.\n");
            }catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            venue_index++;
            //   JsonNode arrNode = jsonNode.at("/venues/" + venue_index).get("day_raw");

        }
        //Map<?, ?> map = objectMapper.readValue(sourceString, Map.class);
        //System.out.println(map.toString());
        // System.out.println(names);
    }
}