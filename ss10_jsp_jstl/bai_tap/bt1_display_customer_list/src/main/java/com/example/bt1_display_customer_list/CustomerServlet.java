package com.example.bt1_display_customer_list;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer-servlet")

public class CustomerServlet extends HttpServlet {
    private static List<Customer> list;
    static {
        list= new ArrayList<>();
        list.add(new Customer("Ho Thi Hai Bich", "29/12/1996", "Da Nang"));
        list.add(new Customer("Hoang Hai Quan", "20/1/1990", "Da Nang"));
        list.add(new Customer("Ho Thi HOng Ngoc", "29/1/1994", "Hue"));
        list.add(new Customer("Nguyen Van Tinh", "2/8/1996", "Quang Nam"));
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setAttribute("list",list);
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("WEB-INF/list.jsp");
        requestDispatcher.forward(request,response);

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }
}