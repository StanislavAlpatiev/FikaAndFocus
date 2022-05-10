package com.dsv.pvt.fikafocus;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import javax.net.ssl.HttpsURLConnection;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.Scanner;

/**
 * What: Looked up an example how you can parse the response of an API and found this code
 * here - https://www.youtube.com/watch?v=zZoboXqsCNw
 * After writing this, I might have adjusted the code a bit, to test some additional stuff. // Anton
 *
 * Why: ...
 */
public class Test_API_besttime {

    public static void main(String[] args) {

        /*
        Maven dependency for JSON-simple:
            <dependency>
                <groupId>com.googlecode.json-simple</groupId>
                <artifactId>json-simple</artifactId>
                <version>1.1.1</version>
            </dependency>
         */

        try {
            //Public API:
            //https://www.metaweather.com/api/location/search/?query=<CITY>
            //https://www.metaweather.com/api/location/44418/
            URL url = new URL("https://besttime.app/api/v1/venues/filter?api_key_private=pri_b32ed6a4cc434307b857af3d65379662&busy_min=0&busy_max=100&hour_min=23&hour_max=1&types=BAR,CAFE,RESTAURANT&lat=59.32967&lng=18.06832&radius=2000&order_by=day_rank_max%2Creviews&order=asc%2Cdesc&foot_traffic=both&limit=20&page=0");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.connect();

            //Check if connect is made
            int responseCode = conn.getResponseCode();

            // 200 OK
            if (responseCode != 200) {
                throw new RuntimeException("HttpResponseCode: " + responseCode);
            } else {

                StringBuilder informationString = new StringBuilder();
                Scanner scanner = new Scanner(url.openStream());

                while (scanner.hasNext()) {
                    informationString.append(scanner.nextLine());
                }
                //Close the scanner
                scanner.close();

                System.out.println(informationString);

                //JSON simple library Setup with Maven is used to convert strings to JSON
                JSONParser parse = new JSONParser();
                JSONArray dataObject = (JSONArray) parse.parse(String.valueOf(informationString));

                //Get the first JSON object in the JSON array
                System.out.println(dataObject.get(0));

                JSONObject venue = (JSONObject) dataObject.get(0);

                System.out.println(venue);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}