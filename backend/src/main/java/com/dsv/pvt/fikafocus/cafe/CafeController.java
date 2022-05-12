package com.dsv.pvt.fikafocus.cafe;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.*;

@RestController
@RequestMapping(path="/cafes")
public class CafeController {
    private static final String PRIVATE_KEY = "pri_50709d58bc7444f3aa6739695d46050a";
    private static final String PUBLIC_KEY = "pub_2f5ebfbf48c748338a26235c9d21fd53";

    @Autowired
    private CafeRepository cafeRepository;

    @PostMapping(path="/add") // Map ONLY POST Requests
    public @ResponseBody
    String addNewCafe (
            @RequestParam String name,
            @RequestParam float lng,
            @RequestParam float lat,
            @RequestParam double rating,
            @RequestParam int price)
    {
        Cafe2 cafe = new Cafe2();
        cafe.setName(name);
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


    //hämta review med visst id
    @GetMapping("/{id}")
    public Cafe2 reviewById(@PathVariable("id") Integer id ){
        Optional<Cafe2> optionalCafe2 = cafeRepository.findById(id);
        if(optionalCafe2.isPresent())
            return optionalCafe2.get();
        return null;
    }


}
