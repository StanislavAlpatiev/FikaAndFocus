package com.dsv.pvt.fikafocus.user;

import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepo;

    public List<UserEntity> getAllUsers(){
       try {
           List<UserEntity> entities = userRepo.findAll();
            List<UserEntity> customUsers = new ArrayList<>();
            entities.stream().forEach(e -> {
                UserEntity u = new UserEntity();
                BeanUtils.copyProperties(e, u);
                customUsers.add(u);
            });
           return entities;
       } catch (Exception e) {
           System.out.println("GET ALL USER METHOD()");
           throw e;
       }
    }

    public UserEntity getUserById(String email) {
        return userRepo.findById(email).orElse(null);
    }

    public UserEntity addNewUser(UserEntity newUser) {
        try {
            if(userRepo.existsByNameAndEmail(newUser.getName(), newUser.getEmail())){
                return null;
            }else{
                return userRepo.save(newUser);
            }
        } catch (Exception e) {
            System.out.println("TO ADD NEW USER");
            throw e;
        }
    }

    public List<UserEntity> addNewUsers(List<UserEntity> newUsers) {
        try {
            return userRepo.saveAll(newUsers);
        } catch (Exception e) {
            System.out.println("Tried to add a list of users!");
            throw e;
        }
    }


    public UserEntity updateUser(UserEntity user) {
        try {
            UserEntity existingUser = userRepo.findById(user.getEmail()).orElse(null);
            existingUser.setName(user.getName());
            existingUser.setEmail(user.getEmail());
            existingUser.setPass(user.getPass());
            return userRepo.save(user);
        } catch (Exception e) {
            System.err.println("updated");
            throw e;
        }
    }

    public String deleteUserById(String email) {
        userRepo.deleteById(email);
        return "removed successfully";
    }


    public String deleteAll() {
        userRepo.deleteAll();
        return "Everything has deleted";
    }




}
