package com.dsv.pvt.fikafocus.review;
/**
 * Jag följde den här tutorialen: https://www.youtube.com/watch?v=f5bdUjEIbrg
 *
 *
 */

import com.dsv.pvt.fikafocus.cafe.Cafe2;
import com.dsv.pvt.fikafocus.cafe.CafeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.Optional;

@RestController
@RequestMapping("/reviews")
public class ReviewController {

    @Autowired
    CafeRepository cafeRepository;
    @Autowired
    ReviewRepository reviewRepository;


    @GetMapping(path="/all")
    public @ResponseBody
    Iterable<Review> getAllReviews() {
        // This returns a JSON or XML with the users
        return reviewRepository.findAll();
    }


    @PostMapping(path="/add") // Map ONLY POST Requests
    public @ResponseBody String addNewReview (
            @RequestParam Integer rating,
            @RequestParam String reviewText,
            @RequestParam String cafeId
    )
    {
        Review review = new Review();
        review.setRating(rating);
        review.setReview_string(reviewText);


        Date date = new Date();
        review.setDate(
            date.toString()
        );

        Cafe2 cafeTemp = cafeRepository.findById(cafeId).get();
        review.setCafe(cafeTemp);
        cafeTemp.addReview(review);


        reviewRepository.save(review);
        return "Saved";
    }

    @PostMapping(path="/add/test") // Map ONLY POST Requests
    public @ResponseBody String testAddReview ()
    {
        Review review = new Review();
        review.setRating(3);
        review.setReview_string("reviewText alfalalfsoa");

        Date date = new Date();
        review.setDate(
                date.toString()
        );

        reviewRepository.save(review);
        return "Saved";
    }

    @GetMapping("/{id}")
    public Review reviewById(@PathVariable("id") Integer id ){
        Optional<Review> optionalReview = reviewRepository.findById(id);
        if(optionalReview.isPresent())
            return optionalReview.get();
        return null;
    }



    @PutMapping("/{reviewId}/cafes/{cafeId}")
    public String assignCafeToReview(
            @PathVariable Integer reviewId,
            @PathVariable String cafeId
    ){
       Optional<Cafe2> cafe = cafeRepository.findById(cafeId);
       Optional<Review> review = reviewRepository.findById(reviewId);

       review.get().setCafe(cafe.get());
       cafe.get().addReview(review.get());

       reviewRepository.save(review.get());
       return "Saved";
    }

}
