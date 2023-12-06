package com.example.controller;

import com.example.model.User;
import com.example.service.IUserService;
import com.example.service.UserService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/user-servlet")

public class UserServlet extends HttpServlet {
    IUserService iUserService= new UserService();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        String action= request.getParameter("action");
        if(action==null){
            action="";
        }
        switch (action){
            case "create":
                break;
            default:
                showList(request,response);
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
    List<User> list= iUserService.showList();
    request.setAttribute("list",list);
        RequestDispatcher requestDispatcher= request.getRequestDispatcher("user-list.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }
}