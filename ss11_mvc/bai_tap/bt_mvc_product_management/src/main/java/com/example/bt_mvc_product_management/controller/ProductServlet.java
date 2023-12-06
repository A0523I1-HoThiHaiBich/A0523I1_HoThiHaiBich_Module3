package com.example.bt_mvc_product_management.controller;

import com.example.bt_mvc_product_management.model.Product;
import com.example.bt_mvc_product_management.service.IProductService;
import com.example.bt_mvc_product_management.service.ProductService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.rmi.StubNotFoundException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/product-servlet")

public class ProductServlet extends HttpServlet {
    private IProductService iProductService= new ProductService();
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        request.setCharacterEncoding("UTF-8");
        String action= request.getParameter("action");
        if(action==null){
            action="";
        }
        switch (action){
            case "create":
                showFromCreate(request,response);
                break;
            case "edit":
                showFromEdit(request,response);
            case "search":
                findByID(request,response);
                break;
            default:
                showList(request,response);
        }
    }

    private void findByID(HttpServletRequest request, HttpServletResponse response) {
        int id= Integer.parseInt(request.getParameter("searchId"));
        Product product= iProductService.findByID(id);
        request.setAttribute("product",product);
        RequestDispatcher requestDispatcher= request.getRequestDispatcher("/search.jsp");
        try {
            try {
                requestDispatcher.forward(request,response);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }

    }

    private void showFromEdit(HttpServletRequest request, HttpServletResponse response) {
        int id= Integer.parseInt(request.getParameter("id"));
        Product product=iProductService.findByID(id);
        RequestDispatcher requestDispatcher= request.getRequestDispatcher("/edit.jsp");
        request.setAttribute("product",product);
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showFromCreate(HttpServletRequest request, HttpServletResponse response) {
            RequestDispatcher requestDispatcher= request.getRequestDispatcher("/create.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Product> list= iProductService.showList();
        request.setAttribute("list",list);
        RequestDispatcher requestDispatcher= request.getRequestDispatcher("/product-list.jsp");
        try {
            try {
                requestDispatcher.forward(request,response);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }



    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create":
                addNewProduct(request,response);
                break;
            case "edit":
                updateProduct(request,response);
                break;
            case "delete":
                deleteProduct(request,response);
                break;
        }

    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
    int id= Integer.parseInt(request.getParameter("id"));
    iProductService.deleteProduct(id);
        try {
            response.sendRedirect("/product-servlet");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        Double price = Double.valueOf(request.getParameter("price"));
        String description = request.getParameter("description");
        String manufacturer = request.getParameter("manufacturer");
        iProductService.updateProduct(new Product(id,name,price,description,manufacturer));

        try {
            response.sendRedirect("/product-servlet");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void addNewProduct(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        Double price = Double.valueOf(request.getParameter("price"));
        String description = request.getParameter("description");
        String manufacturer = request.getParameter("manufacturer");
        iProductService.addNewProduct(new Product(name,price,description,manufacturer));
        try {
            response.sendRedirect("/product-servlet");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
}