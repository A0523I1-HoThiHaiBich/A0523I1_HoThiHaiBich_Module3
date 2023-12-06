package com.example.bt2_calculatoer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorServlet", value = "/calculator-servlet")

public class CalculatorServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    Double fisrtNum= Double.parseDouble(request.getParameter("firstNum"));
        Double secondNum= Double.parseDouble(request.getParameter("secondNum"));
    String operater= request.getParameter("operator");
    String result = "";
    String operatorSyn="";
    switch (operater){
        case "add":
            result= String.valueOf(fisrtNum+secondNum);
            operatorSyn="+";
            break;
        case "sub":
            result= String.valueOf(fisrtNum-secondNum);
            operatorSyn="-";
            break;
        case "mul":
            result= String.valueOf(fisrtNum*secondNum);
            operatorSyn="*";
            break;
        case "div":
            result= String.valueOf(fisrtNum/secondNum);
            operatorSyn="/";
            break;
    }
    request.setAttribute("firstNum", fisrtNum);
    request.setAttribute("secondNum", secondNum);
    request.setAttribute("operatorSyn", operatorSyn);
    request.setAttribute("result", result);

    RequestDispatcher dispatcher= request.getRequestDispatcher("/calculator.jsp");
    dispatcher.forward(request,response);

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }
}