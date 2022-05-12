package com.dsv.pvt.fikafocus.cafe;

import com.dsv.pvt.fikafocus.review.Review;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.*;

@RestController
@RequestMapping(path="/cafes")
public class CafeController {

    @Autowired
    private CafeRepository cafeRepository;

    @PostMapping(path="/add") // Map ONLY POST Requests
    public @ResponseBody
    String addNewCafe (
            @RequestParam String name,
            @RequestParam String address,
            @RequestParam String lat,
            @RequestParam String lng,
            @RequestParam String rating,
            @RequestParam String price
    )
    {
        Cafe2 cafe = new Cafe2();
        cafe.setName(name);
        cafe.setAddress(address);
        cafe.setLat(lat);
        cafe.setLng(lng);
        cafe.setRating(rating);
        cafe.setPrice(price);
        cafeRepository.save(cafe);
        return "Saved";
    }

    @GetMapping(path="/all")
    public @ResponseBody Iterable<Cafe2> getAllCafes() {
        // This returns a JSON or XML with the users
        return cafeRepository.findAll();
    }

    /**
     * alla reviews för ett visst cafe
     * ex: http://localhost:8080/cafes/46/all
     *
     * @param id - för cafe som man vill ha alla reviews för
     * @return alla cafeer för ett visst cafe,
     */
    @GetMapping("/{id}/all")
    public Collection getAllReviewsforCafesById(@PathVariable("id") Integer id ){
        Optional<Cafe2> optionalCafe2 = cafeRepository.findById(id);
        if(optionalCafe2.isPresent())
            return optionalCafe2.get().getReviewSet();
        return null;
    }

    @GetMapping("/locations")
    public String getLocations(@RequestParam String busy_min, @RequestParam String busy_max, @RequestParam String radius, @RequestParam String lng, @RequestParam String lat) throws IOException {
        String url = "https://besttime.app/api/v1/venues/filter?api_key_private=pri_50709d58bc7444f3aa6739695d46050a&busy_min=" + busy_min + "&busy_max=" + busy_max + "&types=CAFE&lat=" + lat + "&lng=" + lng + "&radius=" + radius + "&order_by=now%2Cnow&order=asc%2Cdesc&foot_traffic=both&limit=5&page=0";
        String urlHardCoded = "https://besttime.app/api/v1/venues/filter?api_key_private=pri_1c91095bed164fcfbf513b76b7c4749e&busy_min=" + busy_min + "&busy_max=" + busy_max + "&types=CAFE&lat=" + lat + "&lng=" + lng + "&radius=" + radius + "&order_by=now%2Cnow&order=asc%2Cdesc&foot_traffic=both&limit=5&page=0";
        return sendAPIRequest(urlHardCoded);
    }

        //hämta review med visst id
        @GetMapping("/{id}")
        public Cafe2 reviewById (@PathVariable("id") Integer id ){
            Optional<Cafe2> optionalCafe2 = cafeRepository.findById(id);
            if (optionalCafe2.isPresent())
                return optionalCafe2.get();
            return null;
        }

    private String sendAPIRequest(String url) {
        try {
            URL testUrl = new URL(url);
            URLConnection urlConnection = testUrl.openConnection();
            urlConnection.connect();
            BufferedReader bf = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
            String input = "";

            StringBuilder line = new StringBuilder();
            while((input = bf.readLine()) != null){
                line.append(input);
            }
            bf.close();
            return line.toString();

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return e.getMessage();
        }
    }
}
