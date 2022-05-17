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
    @Column(name = "email")
    private String email;
    @Column(name = "username")
    private String name;
    @Column(name = "pass")
    private String pass;


    public UserEntity() {
    }

    public UserEntity(String emailParam, String nameParam, String passParam) {
        this.email = emailParam;
        this.name = nameParam;
        this.pass = passParam;
    }

    @ManyToMany(mappedBy = "users", fetch = FetchType.LAZY)
    private Set<Cafe2> cafes = new HashSet<>();

    public void addFavourite(Cafe2 cafe2){
        cafes.add(cafe2);
    }

    public void removeFavourite(Cafe2 cafe2){
        cafes.remove(cafe2);
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPass(String pa){
        this.pass = pa;
    }

    public String getPass(){
        return this.pass;
    }

    @Override
    public String toString() {
        return "Contact [ email=" + email +"name=" + name + ", pass=" + pass  + "]";
    }
}
