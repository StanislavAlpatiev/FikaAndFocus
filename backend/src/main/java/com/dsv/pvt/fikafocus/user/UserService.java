package com.dsv.pvt.fikafocus.user;

import com.dsv.pvt.fikafocus.cafe.Cafe2;

import java.util.List;

public interface UserService {
    UserEntity addNewUser(UserEntity newUser);
    List<UserEntity> addNewUsers(List<UserEntity> newUsers);

    List<UserEntity> getAllUsers();
    UserEntity getUserById(int id);

    UserEntity updateUser(UserEntity user);

    String deleteUserById(int id);
    String deleteAll();
}
