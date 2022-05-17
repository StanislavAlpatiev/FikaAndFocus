package com.dsv.pvt.fikafocus.user;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController // This means that this class is a Controller
@RequestMapping(path="/user") // This means URL's start with /demo (after Application path)
public class UserController {
    @Autowired // This means to get the bean called userRepository
    // Which is auto-generated by Spring, we will use it to handle the data
    private UserService userService;

    //Create
//    @PostMapping(path="/add") // Map ONLY POST Requests
//    public @ResponseBody com.dsv.pvt.fikafocus.user.UserEntity addNewUser (@RequestBody com.dsv.pvt.fikafocus.user.UserEntity newEntity) {
//        // @ResponseBody means the returned String is the response, not a view name
//        return userService.addNewUser(newEntity);
//    }
//    //Create lists.
//    @PostMapping(path="/addUsers")
//    public @ResponseBody List<com.dsv.pvt.fikafocus.user.UserEntity> addNewUsers(@RequestBody List<com.dsv.pvt.fikafocus.user.UserEntity> newEntities){
//        return userService.addNewUsers(newEntities);
//    }

    @PostMapping("/add")
    public @ResponseBody com.dsv.pvt.fikafocus.user.UserEntity getLocations(@RequestParam String email,
                               @RequestParam String userName,
                               @RequestParam String password)
            throws IOException {

        return userService.addNewUser(email, userName, password);
    }

    //Read
    @GetMapping(path="/all")
    public @ResponseBody List<com.dsv.pvt.fikafocus.user.UserEntity> getAllUsers() {
        // This returns a JSON with the users
        return userService.getAllUsers();
    }

    @GetMapping(path = "userById/{id}")
    public @ResponseBody UserEntity findUserById(@PathVariable String id){
        return userService.getUserById(id);
    }

    //Update
    @PutMapping(path="/update")
    public @ResponseBody com.dsv.pvt.fikafocus.user.UserEntity updateUser(@RequestBody com.dsv.pvt.fikafocus.user.UserEntity entity){
        return userService.updateUser(entity);
    }

    //Remove
    @DeleteMapping(path="/remove/{id}")
    public @ResponseBody String removeUser(@PathVariable String id){
        return userService.deleteUserById(id);
    }

    //Remove all instances
    @DeleteMapping(path="/removeall")
    public @ResponseBody String removeAllUser(){
        return userService.deleteAll();
    }

}
