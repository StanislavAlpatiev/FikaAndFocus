package com.dsv.pvt.fikafocus.cafe;

import com.dsv.pvt.fikafocus.review.Review;
import com.dsv.pvt.fikafocus.user.User;
import com.dsv.pvt.fikafocus.user.UserEntity;
import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Cafe2 {

    public Cafe2(){
    }


    public String getAddress(){
        return address;
    }

    public void setAddress(String address){
        this.address = address;
    }

    public Cafe2(String id,String name, String address, String lat,String lng){
        this.id = id;
        this.name = name;
        this.address = address;
        this.lat = lat;
        this.lng = lng;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private String id;
    private String name;
    private String address;
    private String lat;
    private String lng;
    private String rating;
    private String price;

    public String getLat(){
        return lat;
    }

    public String getLng(){
        return lng;
    }

    public String getRating(){
        return rating;
    }

    public String getPrice(){
        return price;
    }

    public void setLat(String lat){
        this.lat = lat;
    }

    public void setLng(String lng){
        this.lng = lng;
    }

    public void setRating(String rating){
        this.rating = rating;
    }

    public void setPrice(String price){
        this.price = price;
    }

    public void setReviewSet(Set<Review> reviewSet){
        this.reviewSet = reviewSet;
    }

    @JsonIgnore // to avoid recursive problem in relationship
    @OneToMany(mappedBy = "cafe2")
    private Set<Review> reviewSet = new HashSet<Review>();


    public Set<UserEntity> getUsers(){
        return users;
    }

    @JsonIgnore
    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.PERSIST)
    @JoinTable(name = "favourites",
            joinColumns = {
                    @JoinColumn(name = "cafe_id", referencedColumnName = "id",
                            nullable = false, updatable = false)},
            inverseJoinColumns = {
                    @JoinColumn(name = "user_id", referencedColumnName = "id",
                            nullable = false, updatable = false)})
    private Set<UserEntity> users = new HashSet<>();


    public Set<Review> getReviewSet() {
        return reviewSet;
    }

    public void addReview(Review review) {
        reviewSet.add(review);
    }


    public String getId() {
        return id;
    }


    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
