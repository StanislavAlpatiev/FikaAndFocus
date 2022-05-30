package com.dsv.pvt.fikafocus.review;

import com.dsv.pvt.fikafocus.cafe.Cafe;
import com.dsv.pvt.fikafocus.user.UserEntity;

import javax.persistence.*;

@Entity
public class Review {

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Integer id;
    private String rating;
    private String review_string;
    private String date;


    @ManyToOne(cascade = CascadeType.ALL)
    //name: vad foreginkey kolumn ska heta, referencedColumnname: vilken kolumn som är forgein key
    @JoinColumn(name="cafe", referencedColumnName = "id")
    private Cafe cafe;


    @ManyToOne
    @JoinColumn(name = "user", referencedColumnName = "email")
    private UserEntity user;

    public UserEntity getUser(){
        return user;
    }

    public Cafe getCafe() {
        return cafe;
    }

    public void setCafe(Cafe cafe){
        this.cafe = cafe;
    }


    public void setUser(UserEntity user){
        this.user = user;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRating() {
        return rating;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    public String getReview_string() {
        return review_string;
    }

    public void setReview_string(String review_string) {
        this.review_string = review_string;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
