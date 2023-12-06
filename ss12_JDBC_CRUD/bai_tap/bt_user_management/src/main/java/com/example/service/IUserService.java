package com.example.service;

import com.example.controller.UserServlet;
import com.example.model.User;

import java.util.List;

public interface IUserService {
    List<User> showList();
    void addNewUser(User user);
    void updateUser(User user);
    void deleteUser(int id);
}
