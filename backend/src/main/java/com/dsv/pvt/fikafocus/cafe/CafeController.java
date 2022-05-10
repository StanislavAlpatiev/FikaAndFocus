package com.dsv.pvt.fikafocus.cafe;

import com.dsv.pvt.fikafocus.review.Review;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Collection;
import java.util.Optional;

@RestController
@RequestMapping(path="/cafes")
public class CafeController {

    @Autowired
    private CafeRepository cafeRepository;

    @PostMapping(path="/add") // Map ONLY POST Requests
    public @ResponseBody
    String addNewCafe (
            @RequestParam String name,
            @RequestParam Integer location)
    {
        Cafe2 cafe = new Cafe2();
        cafe.setName(name);
        cafe.setLocation(location);
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
