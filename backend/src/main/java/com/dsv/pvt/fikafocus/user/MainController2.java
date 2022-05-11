package com.dsv.pvt.fikafocus.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController // This means that this class is a Controller
@RequestMapping(path="/demo") // This means URL's start with /demo (after Application path)
public class MainController2 {
    @Autowired // This means to get the bean called userRepository
    // Which is auto-generated by Spring, we will use it to handle the data
    private com.dsv.pvt.fikafocus.user.UserService userService;

    //Create
    @PostMapping(path="/add") // Map ONLY POST Requests
    public @ResponseBody com.dsv.pvt.fikafocus.user.UserEntity addNewUser (@RequestBody com.dsv.pvt.fikafocus.user.UserEntity newEntity) {
        // @ResponseBody means the returned String is the response, not a view name
        return userService.addNewUser(newEntity);
    }
    //Create lists.
    @PostMapping(path="/addUsers")
    public @ResponseBody List<com.dsv.pvt.fikafocus.user.UserEntity> addNewUsers(@RequestBody List<com.dsv.pvt.fikafocus.user.UserEntity> newEntities){
        return userService.addNewUsers(newEntities);
    }

    //Read
    @GetMapping(path="/all")
    public @ResponseBody List<com.dsv.pvt.fikafocus.user.UserEntity> getAllUsers() {
        // This returns a JSON with the users
        return userService.getAllUsers();
    }

    @GetMapping(path = "userById/{id}")
    public @ResponseBody UserEntity findUserById(@PathVariable int id){
        return userService.getUserById(id);
    }

    //Update
    @PutMapping(path="/update")
    public @ResponseBody com.dsv.pvt.fikafocus.user.UserEntity updateUser(@RequestBody com.dsv.pvt.fikafocus.user.UserEntity entity){
        return userService.updateUser(entity);
    }

    //Remove
    @DeleteMapping(path="/remove/{id}")
    public @ResponseBody String removeUser(@PathVariable int id){
        return userService.deleteUserById(id);
    }

    //Remove all instances
    @DeleteMapping(path="/removeall")
    public @ResponseBody String removeAllUser(){
        return userService.deleteAll();
    }
}
