package com.dsv.pvt.fikafocus.user;//package com.dsv.pvt.fikafocus;

import javax.persistence.*;

import com.dsv.pvt.fikafocus.cafe.Cafe2;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.*;

@Data
//@NoArgsConstructor
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

    @ManyToMany(mappedBy = "users", fetch = FetchType.LAZY)
    private Set<Cafe2> cafes = new HashSet<>();

    public void addFavourite(Cafe2 cafe2){
        cafes.add(cafe2);
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
