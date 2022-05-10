package com.dsv.pvt.fikafocus.cafe;

import com.dsv.pvt.fikafocus.review.Review;
import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Cafe2 {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Integer id;
    private String name;
    private double location;


    @JsonIgnore // to avoid recursive problem in relationship
    @OneToMany(mappedBy = "cafe2")
    private Set<Review> reviewSet = new HashSet<Review>();


    public Set<Review> getReviewSet() {
        return reviewSet;
    }

    public void addReview(Review review) {
        reviewSet.add(review);
    }


    public Integer getId() {
        return id;
    }


    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getLocation() {
        return location;
    }

    public void setLocation(double location) {
        this.location = location;
    }
}
