package com.dsv.pvt.fikafocus;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.IOException;
import java.net.*;
import java.util.*;

/**
 * What: Looked up an example how you can parse the response of an API and found this code
 * here - https://www.youtube.com/watch?v=zZoboXqsCNw
 * After writing this, I might have adjusted the code a bit, to test some additional stuff. // Anton
 * <p>
 * Why: ...
 * // Ant
 */
public class Test_API_besttime_with_methods {

    /*
     Constant keys for convenience since keys are used in
     every search query (in every URL to be precise)
     (Demo keys for now, feel free to use your own demo keys if these stop working
     due to low credit)
     */
    private static final String PRIVATE_KEY = "pri_50709d58bc7444f3aa6739695d46050a";
    private static final String PUBLIC_KEY = "pub_2f5ebfbf48c748338a26235c9d21fd53";


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
            URL url = queryFilteredVenues("59.406845369242845", "17.945222498470716", "10000");
            HttpURLConnection conn = getConnection(url);

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
                scanner.close();

                printResponse(informationString);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * PART 1
     * What: creates a URL object that can later be used in a request.
     * Why: code reuse, readability
     *
     * Example: venueSearchUrl("59.406845369242845", "17.945222498470716", "10000")
     * (gives you 2 venues within 10km radius of Borgarfjordsgatan 12, 164 55 Kista)
     * <p>
     * Additional info: For now, it just gives you 2 results out of developer convenience.
     *
     * Link:
     * If you want to send this kind of url in Postman, just
     * to see how it works and possible responses:
     * https://documentation.besttime.app/#query-filtered-venues-radar
     *
     * // Ant
     * @return
     * @throws MalformedURLException
     */
    public static URL queryFilteredVenues(String latitude, String longitude, String radius) throws MalformedURLException {
        return new URL("https://besttime.app/api/v1/venues/filter?api_key_private="+ PRIVATE_KEY +"&busy_min=0&busy_max=100&types=CAFE&lat=" + latitude + "&lng=" + longitude + "&radius=" + radius + "&order_by=day_rank_max%2Creviews&order=asc%2Cdesc&foot_traffic=both&limit=2&page=0");
    }

    /**
     * PART 2
     * What: creates get request if you give it a valid url. Some urls work with POST rather than get, those urls wont work here. // Ant
     * Why: suspecting we might use this method (its code) a lot, so this should reduce code duplication. // Ant
     *
     * // Ant
     * @param url
     * @return
     * @throws IOException
     */
    public static HttpURLConnection getConnection(URL url) throws IOException {
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.connect();
        return conn;
    }

    /** PART 3
     * What: general response method. Right now it lacks any filters
     * so it will return the whole response.
     *
     * Would like to create a method like this one, but which gets a
     * nested JSONObject / JSONArray. Because for example venue_name
     * is nested within venue.
     *
     * An Idea 220504 16:45:08:
     * could have a method that returns an array of venue ID's (among other things)
     * and then each venue ID can be used in "Query now" https://documentation.besttime.app/#query-now
     * to get the current busyness of every venue one by one ..
     * @param informationString
     * @throws ParseException
     */
    public static void printResponse(StringBuilder informationString) throws ParseException {
        Object obj = new JSONParser().parse(String.valueOf(informationString));

        JSONObject jsonObject = (JSONObject) obj;

        Map jsonMap = (HashMap) jsonObject;

        // make a query in Postman to see why venues are fetched like this
        // and why were not merely printing jsonMap // ant
        System.out.println("----- VENUES ----- \n" + jsonMap.get("venues"));

    }


}