<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Product</title>
</head>
<body>
<p>
    <a href="/product-servlet">Back to product list</a>
</p>
<h1>Update Product</h1>
<form method="post" action="/product-servlet?action=edit">
    <fieldset>
        <legend>Product information</legend>
        <table>
            <tr>
                <td>Product Id:</td>
                <td><input type="text" name="id" id="id" value="${product.getId()}"></td>
            </tr>
            <tr>
                <td>Product Name:</td>
                <td><input type="text" name="name" id="name" value="${product.getName()}"></td>
            </tr>
            <tr>
                <td>Price:</td>
                <td><input type="text" name="price"  id="price" value="${product.getPrice()}"></td>
            </tr>
            <tr>
                <td>Description:</td>
                <td><input type="text" name="description" id="description" value="${product.getDescription()}" ></td>
            </tr>
            <tr>
                <td>Manufacturer:</td>
                <td><input type="text" name="manufacturer" id="manufacturer" value="${product.getManufacturer()}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Update Product"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
