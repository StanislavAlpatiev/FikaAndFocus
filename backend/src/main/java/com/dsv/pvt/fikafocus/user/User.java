package com.dsv.pvt.fikafocus;

public class User {
    private Integer id;
    private String name;
    private String email;
    private String pass;
    private String confirmPass;
    
    public User() {
    }

    public User(String name, String email, String p, String cp) {
        this.name = name;
        this.email = email;
        this.pass = p;
        this.confirmPass = cp;
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

    public String getPass(){
        return this.pass;
    }

    public String getConfirmPass(){
        return this.confirmPass;
    }
}
