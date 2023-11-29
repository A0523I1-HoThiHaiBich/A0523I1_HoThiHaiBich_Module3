<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1>Product Discount Calculator</h1><br/>
<form action="/display-discount" method="post">
    <label>Product Description:</label></br>
    <input type="text" name="description" placeholder="product description"></br>
    <label>List Price:</label></br>
    <input type="text" name="listPrice" placeholder="List Price"></br>
    <label>Discount Percent:</label></br>
    <input type="number" name="discount" placeholder="Discount Percent"></br>
    <input type="submit" value=" Calculate Discount">
</form>
</body>
</html>