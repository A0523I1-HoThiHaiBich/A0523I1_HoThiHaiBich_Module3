package com.example.service;

import com.example.model.User;
import com.example.repository.IUserRepository;
import com.example.repository.UserRepository;

import java.util.List;

public class UserService implements IUserService{
    private IUserRepository iUserRepository= new UserRepository();
    @Override
    public List<User> showList() {
       return iUserRepository.showList();
    }

    @Override
    public void addNewUser(User user) {

    }

    @Override
    public void updateUser(User user) {

    }

    @Override
    public void deleteUser(int id) {

    }
}
