package com.example.th1_mvc_customer_management.controller;

import com.example.th1_mvc_customer_management.model.Customer;
import com.example.th1_mvc_customer_management.service.ICustomerService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/Customers")

public class CustomerServlet extends HttpServlet {
    private ICustomerService CustomerService;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String action= request.getParameter("action");
        if(action=="null"){
            action="";
        }
        switch (action){
            case "create":
                break;
            case "edit":
                break;
            case "delete":
                break;
            default:
                listCustomer(request,response);
                break;

        }
    }

    private void listCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customers= this.CustomerService.showList();
        request.setAttribute("customers",customers);

        RequestDispatcher dispatcher= request.getRequestDispatcher("customer/list.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}