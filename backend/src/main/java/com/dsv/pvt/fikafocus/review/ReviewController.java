package com.dsv.pvt.fikafocus.review;
/**
 * Jag följde den här tutorialen: https://www.youtube.com/watch?v=f5bdUjEIbrg
 *
 *
 */

import com.dsv.pvt.fikafocus.cafe.Cafe2;
import com.dsv.pvt.fikafocus.cafe.CafeRepository;
import com.dsv.pvt.fikafocus.user.UserEntity;
import com.dsv.pvt.fikafocus.user.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.Collection;
import java.util.Optional;

@RestController
@RequestMapping("/reviews")
public class ReviewController {
    @Autowired
    UserRepository userRepository;
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
    public @ResponseBody
    Review addNewReview (
            @RequestParam Integer rating,
            @RequestParam String reviewText,
            @RequestParam String cafeId,
            @RequestParam String userEmail
    )
    {
        Review review = new Review();
        review.setRating(rating);
        review.setReview_string(reviewText);


        LocalDate date = LocalDate.now();
        review.setDate(
            date.toString()
        );

        Cafe2 cafeTemp = cafeRepository.findById(cafeId).get();
        UserEntity userTemp = userRepository.findById(userEmail).get();

        review.setUser(userTemp);
        review.setCafe(cafeTemp);

        cafeTemp.addReview(review);
        userTemp.addReview(review);

        return reviewRepository.save(review);
    }

    @GetMapping(path="/users/{user}")
    public Collection getAllReviewsFromUser(@PathVariable String user){
        Optional<UserEntity> optionalUser = userRepository.findById(user);
        if ( optionalUser.isPresent() )
            return optionalUser.get().getReviewSet();
        return null;
    }

 /*   @PostMapping(path="/add/test") // Map ONLY POST Requests
    public @ResponseBody String testAddReview ()
    {
        Review review = new Review();
        review.setRating(3);
        review.setReview_string("reviewText alfalalfsoa");

        LocalDate date = LocalDate.now();
        review.setDate(
                date.toString()
        );

        reviewRepository.save(review);
        return "Saved";
    }
*/
    @GetMapping("/{id}")
    public Review reviewById(@PathVariable("id") Integer id ){
        Optional<Review> optionalReview = reviewRepository.findById(id);
        if(optionalReview.isPresent())
            return optionalReview.get();
        return null;
    }



    @PutMapping("/{reviewId}/cafes/{cafeId}")
    public Review assignCafeToReview(
            @PathVariable Integer reviewId,
            @PathVariable String cafeId
    ){
       Optional<Cafe2> cafe = cafeRepository.findById(cafeId);
       Optional<Review> review = reviewRepository.findById(reviewId);

       review.get().setCafe(cafe.get());
       cafe.get().addReview(review.get());

       return reviewRepository.save(review.get());
    }

}
