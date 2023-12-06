package com.example.repository;

import com.example.model.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository{
    private final String FIND_ALL="SELECT * FROM users";
    private final String ADD_NEW_USER= "INSERT INTO users(name, email,country)\n"+
            "values(?,?,?)";
    private final String UPDATE_USER= "Update users set name=? and email=? and country=? where id=?";

    private final String DELETE_USER = "delete from users\n" +
            "where id = ?;" ;

    @Override
    public List<User> showList() {
        List<User> list= new ArrayList<>();
        Connection connection= BaseRepository.getConnection();
        try {
            Statement statement= connection.createStatement();
            ResultSet resultSet= statement.executeQuery(FIND_ALL);
            while(resultSet.next()){
                int id= resultSet.getInt("id");
                String name= resultSet.getString("name");
                String email= resultSet.getString("email");
                String country= resultSet.getString("country");
                list.add(new User(id,name,email,country));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    @Override
    public void addNew(User user) {

    }

    @Override
    public void updateUser(User user) {

    }

    @Override
    public void deleteUser(int id) {

    }
}
