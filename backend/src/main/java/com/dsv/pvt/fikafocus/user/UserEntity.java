package com.dsv.pvt.fikafocus;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity // This tells Hibernate to make a table out of this class
@Table(name = "User")
public class UserEntity {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Integer id;

    @Column(name = "username")
    private String name;
    @Column(name = "email")
    private String email;
    @Column(name = "pass")
    private String pass;
    @Column(name = "ConfirmedPass")
    private String confirmedPass;
    
    public UserEntity() {
    }

    public UserEntity(String nameParam, String emailParam, String passParam, String confirmPassParam) {
        this.name = nameParam;
        this.email = emailParam;
        this.pass = passParam;
        this.confirmedPass = confirmPassParam;
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

    public void setPass(String pa){
        this.pass = pa;
    }

    public String getPass(){
        return this.pass;
    }

    public String getConfirmPass(){
        return this.confirmedPass;
    }

    @Override
    public String toString() {
        return "Contact [id=" + id + ", name=" + name + ", email=" + email
                + ", pass=" + pass  + "]";
    }
}
