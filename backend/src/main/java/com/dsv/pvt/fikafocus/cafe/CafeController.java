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

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
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
    public String getLocations(@RequestParam String busy_min, @RequestParam String busy_max, @RequestParam String radius, @RequestParam String lng, @RequestParam String lat/**, @PathVariable("busy_min") String busy_min,
     @PathVariable("busy_max") String busy_max,
     @PathVariable("radius") String radius**/) throws IOException {

        //Example url request http://localhost:8080/locations?busy_min=0&busy_max=40&radius=2000&lng=17.945222498470716&lat=59.406845369242845"
        StringBuilder sb = new StringBuilder();
        sb.append("https://besttime.app/api/v1/venues/filter?" +
                "api_key_private=pri_50709d58bc7444f3aa6739695d46050a&");
        sb.append("busy_min=" + busy_min + "&");
        sb.append("busy_max=" + busy_max + "&");
        sb.append("types=CAFE&" +
                "lat=" + lat + "&" +
                "lng=" + lng + "&");
        sb.append("radius=" + radius + "&");
        sb.append("order_by=now%2Cnow&" + "order=asc%2Cdesc&" +
                "foot_traffic=both&" + "limit=5&" + "page=0");
//        String url = "https://besttime.app/api/v1/venues/filter?" +
//                "api_key_private=pri_50709d58bc7444f3aa6739695d46050a&" +
//                "busy_min={busy_min}&" +
//                "busy_max={busy_max}&" +
//                "types=CAFE&" +
//                "lat=59.406845369242845&" +
//                "lng=17.945222498470716&" +
//                "radius={radius}&" +
//                "order_by=now%2Cnow&" +
//                "order=asc%2Cdesc&" +
//                "foot_traffic=both&" +
//                "limit=5&" +
//                "page=0";
        URL bestTimeUrl = new URL(sb.toString());
        HttpURLConnection conn = (HttpURLConnection) bestTimeUrl.openConnection();
        conn.setRequestMethod("GET");
        conn.connect();

        int responseCode = conn.getResponseCode();
        // 200 OK
        if (responseCode != 200) {
            throw new RuntimeException("HttpResponseCode: " + responseCode);
        } else {
            StringBuilder JsonString = new StringBuilder();
            Scanner scanner = new Scanner(bestTimeUrl.openStream());

            while (scanner.hasNext()) {
                JsonString.append(scanner.nextLine());
            }
            scanner.close();
//            return JsonString.toString();
            return "temp return";
        }

//        RestTemplate template = new RestTemplate();
//
//        HttpHeaders headers = new HttpHeaders();
//        HttpEntity requestEntity = new HttpEntity<>(headers);
//
//        Map<String, String> uriVariables = new HashMap<>();
//
//        ResponseEntity<Map> response = template.exchange(sb.toString(), HttpMethod.GET, requestEntity, Map.class, uriVariables);

//        return response.getBody();
    }


    //hämta review med visst id
    @GetMapping("/{id}")
    public Cafe2 reviewById(@PathVariable("id") Integer id ){
        Optional<Cafe2> optionalCafe2 = cafeRepository.findById(id);
        if(optionalCafe2.isPresent())
            return optionalCafe2.get();
        return null;
    }

}
