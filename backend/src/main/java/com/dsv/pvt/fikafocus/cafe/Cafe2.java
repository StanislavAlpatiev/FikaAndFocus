package com.dsv.pvt.fikafocus.cafe;

import com.dsv.pvt.fikafocus.review.Review;
import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Cafe2 {

    public Cafe2(){
    }


    public Cafe2(int id,String name,float lat,float lng){
        this.id = id;
        this.name = name;
        this.lat = lat;
        this.lng = lng;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;
    private String name;
    private float lat;
    private float lng;
    private double rating;
    private int price;

    public float getLat(){
        return lat;
    }

    public float getLng(){
        return lng;
    }

    public double getRating(){
        return rating;
    }

    public int getPrice(){
        return price;
    }

    public void setLat(float lat){
        this.lat = lat;
    }

    public void setLng(float lng){
        this.lng = lng;
    }

    public void setRating(double rating){
        this.rating = rating;
    }

    public void setPrice(int price){
        this.price = price;
    }

    public void setReviewSet(Set<Review> reviewSet){
        this.reviewSet = reviewSet;
    }

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
}
