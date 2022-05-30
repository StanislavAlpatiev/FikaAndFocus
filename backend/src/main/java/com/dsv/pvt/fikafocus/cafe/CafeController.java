package com.dsv.pvt.fikafocus.cafe;

import com.dsv.pvt.fikafocus.user.UserEntity;
import com.dsv.pvt.fikafocus.user.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.*;

@RestController
@RequestMapping(path = "/cafes")
public class CafeController {

    @Autowired
    private CafeRepository cafeRepository;
    @Autowired
    private UserRepository userRepository;

    @PostMapping(path = "/add") // Map ONLY POST Requests
    public @ResponseBody
    String addNewCafe(
            @RequestParam String id,
            @RequestParam String address,
            @RequestParam String name,
            @RequestParam String lat,
            @RequestParam String lng,
            @RequestParam String price,
            @RequestParam String rating
    ) {
        Cafe cafe = new Cafe();
        cafe.setId(id);
        cafe.setAddress(address);
        cafe.setName(name);
        cafe.setLat(lat);
        cafe.setLng(lng);
        cafe.setPrice(price);
        cafe.setRating(rating);
        cafeRepository.save(cafe);
        return "Saved";
    }

    @GetMapping(path = "/all")
    public @ResponseBody
    Iterable<Cafe> getAllCafes() {
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
    public Collection getAllReviewsForCafesById(@PathVariable("id") String id) {
        Optional<Cafe> optionalCafe2 = cafeRepository.findById(id);
        if (optionalCafe2.isPresent()) {
            return optionalCafe2.get().getReviewSet();
        }
        return null;
    }

    @GetMapping("/{id}/favourites")
    public Collection getAllFavouritesForCafesByUserId(@PathVariable("id") String id) {
        Optional<UserEntity> optionalUser = userRepository.findById(id);
        if (optionalUser.isPresent()) {
            return optionalUser.get().getCafes();
        }
        return null;
    }

    @GetMapping("/{id}/favouritesbycafe")
    public Collection getAllFavouritesForCafesByCafeId(@PathVariable("id") String id) {
        Optional<Cafe> optionalCafe = cafeRepository.findById(id);
        if (optionalCafe.isPresent()) {
            return optionalCafe.get().getUsers();
        }
        return null;
    }

    @PostMapping("/{userId}/addfavourite/{cafeId}")
    public String addFavourite(
            @PathVariable String userId,
            @PathVariable String cafeId
    ) {
        Optional<Cafe> cafe = cafeRepository.findById(cafeId);
        Optional<UserEntity> user = userRepository.findById(userId);

        user.get().addFavourite(cafe.get());
        cafe.get().addFavourite(user.get());
        cafeRepository.save(cafe.get());
        return "Saved";
    }

    @DeleteMapping("/{userId}/removefavourite/{cafeId}")
    public String removeFavourite(
            @PathVariable String userId,
            @PathVariable String cafeId
    ) {
        Optional<Cafe> cafe = cafeRepository.findById(cafeId);
        Optional<UserEntity> user = userRepository.findById(userId);
        user.get().removeFavourite(cafe.get());
        cafe.get().removeFavourite(user.get());
        cafeRepository.save(cafe.get());
        return "Deleted";
    }

//    @GetMapping("/locations")
//    public String getLocations(@RequestParam String busy_min, @RequestParam String busy_max, @RequestParam String radius, @RequestParam String lng, @RequestParam String lat) throws IOException {
//        String url = "https://besttime.app/api/v1/venues/filter?api_key_private=pri_c84fd82d775d442883228456f021f11b&busy_min=" + busy_min + "&busy_max=" + busy_max + "&types=CAFE&lat=" + lat + "&lng=" + lng + "&radius=" + radius + "&order_by=now%2Cnow&order=asc%2Cdesc&foot_traffic=both&limit=5&page=0";
//        String urlHardCoded = "https://besttime.app/api/v1/venues/filter?api_key_private=pri_a00012d8b9394126beb8ecca2b673940&busy_min=" + busy_min + "&busy_max=" + busy_max + "&types=CAFE&lat=" + lat + "&lng=" + lng + "&radius=" + radius + "&order_by=now%2Cnow&order=asc%2Cdesc&foot_traffic=both&limit=5&page=0";
//        return sendAPIRequest(urlHardCoded);
//    }

    @GetMapping("/locations")
    public String getLocations(@RequestParam String busy_min, @RequestParam String busy_max, @RequestParam String radius, @RequestParam String lng, @RequestParam String lat,  @RequestParam String price, @RequestParam String rating) throws IOException {
        if(Double.parseDouble(rating) < 2.0) {
            rating = "2.0";
        }
        if(Double.parseDouble(rating) > 4.5) {
            rating = "4.5";
        }

//        String url = "https://besttime.app/api/v1/venues/filter?api_key_private=pri_c84fd82d775d442883228456f021f11b&busy_min=" + busy_min + "&busy_max=" + busy_max + "&types=CAFE&lat=" + lat + "&lng=" + lng + "&radius=" + radius + "&price_max" + price + "&rating_min" +  rating + "&order_by=now%2Cnow&order=asc%2Cdesc&foot_traffic=both&limit=5&page=0";
        String url = "https://besttime.app/api/v1/venues/filter?api_key_private=pri_a00012d8b9394126beb8ecca2b673940&busy_min=" + busy_min + "&busy_max=" + busy_max + "&types=CAFE&lat=" + lat + "&lng=" + lng + "&radius=" + radius +  "&price_max=" + price + "&rating_min=" +  rating + "&order_by=now%2Cnow&order=asc%2Cdesc&foot_traffic=both&limit=5&page=0";
        return sendAPIRequest(url);
    }

    //hämta review med visst id
    @GetMapping("/{id}")
    public Cafe reviewById(@PathVariable("id") String id) {
        Optional<Cafe> optionalCafe2 = cafeRepository.findById(id);
        if (optionalCafe2.isPresent()) {
            return optionalCafe2.get();
        }
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
            while ((input = bf.readLine()) != null) {
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
