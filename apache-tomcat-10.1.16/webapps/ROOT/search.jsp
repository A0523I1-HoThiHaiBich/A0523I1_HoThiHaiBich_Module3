<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search</title>
</head>
<body>
<p>
    <a href="/product-servlet">Back to product list</a>
</p>
<h1>Search Product Result</h1>
        <table>
            <tr>
                <td>ProductId:</td>
                <td>${product.getId()}</td>
            </tr>
            <tr>
                <td>Product Name:</td>
                <td>${product.getName()}</td>
            </tr>
            <tr>
                <td>Price:</td>
                <td>${product.getPrice()}></td>
            </tr>
            <tr>
                <td>Description:</td>
                <td>${product.getDescription()}</td>
            </tr>
            <tr>
                <td>Manufacturer:</td>
                <td>${product.getManufacturer()}></td>
            </tr>
        </table>
</body>
</html>
