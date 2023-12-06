<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new Product</title>
</head>
<body>
<p>
    <a href="/product-servlet">Back to product list</a>
</p>
<h1>Add New Product</h1>
<form method="post" action="/product-servlet?action=create">
    <fieldset>
        <legend>Product information</legend>
    <table>
        <tr>
            <td>Product Name:</td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>Price:</td>
            <td><input type="text" name="price"></td>
        </tr>
        <tr>
            <td>Description:</td>
            <td><input type="text" name="description"></td>
        </tr>
        <tr>
            <td>Manufacturer:</td>
            <td><input type="text" name="manufacturer"></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Add new Product"></td>
        </tr>
    </table>
    </fieldset>
</form>

</body>
</html>
