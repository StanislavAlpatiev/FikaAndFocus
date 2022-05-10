package com.dsv.pvt.fikafocus.user;

import org.springframework.stereotype.Component;

import javax.persistence.*;


@Entity // This tells Hibernate to make a table out of this class
public class User2 {
    @Id // primary key
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Integer id;
    private String name;
    private String email;

    public User2(String name, String email) {
        this.name = name;
        this.email = email;
    }

    public User2() {
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
