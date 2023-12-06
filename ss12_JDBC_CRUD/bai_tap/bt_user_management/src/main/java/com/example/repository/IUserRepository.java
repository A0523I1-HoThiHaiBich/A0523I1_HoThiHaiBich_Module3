package com.example.repository;

import com.example.model.User;

import java.util.List;

public interface IUserRepository {
    List<User> showList();
    void addNew(User user);
    void updateUser( User user);
    void deleteUser(int id);
}
