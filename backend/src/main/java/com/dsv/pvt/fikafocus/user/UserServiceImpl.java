package com.dsv.pvt.fikafocus.user;

import java.util.ArrayList;
import java.util.List;


import com.dsv.pvt.fikafocus.User;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepo;

    @Override
    public List<UserEntity> getAllUsers(){
       try {
           List<UserEntity> entities = userRepo.findAll();
            List<User> customUsers = new ArrayList<>();
            entities.stream().forEach(e -> {
                User u = new User();
                BeanUtils.copyProperties(e, u);
                customUsers.add(u);
            });
           return entities;
       } catch (Exception e) {
           System.out.println("GET ALL USER METHOD()");
           throw e;
       }
    }

    @Override
    public UserEntity getUserById(int id) {
        return userRepo.findById(id).orElse(null);
    }

    @Override
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

    @Override
    public List<UserEntity> addNewUsers(List<UserEntity> newUsers) {
        try {
            return userRepo.saveAll(newUsers);
        } catch (Exception e) {
            System.out.println("Tried to add a list of users!");
            throw e;
        }
    }

    @Override
    public UserEntity updateUser(UserEntity user) {
        try {
            UserEntity existingUser = userRepo.findById(user.getId()).orElse(null);
            existingUser.setName(user.getName());
            existingUser.setEmail(user.getEmail());
            existingUser.setPass(user.getPass());
            return userRepo.save(user);
        } catch (Exception e) {
            System.err.println("updated");
            throw e;
        }
    }

    @Override
    public String deleteUserById(int id) {
        userRepo.deleteById(id);
        return "removed successfully";
    }

    @Override
    public String deleteAll() {
        userRepo.deleteAll();
        return "Everything has deleted";
    }

}
