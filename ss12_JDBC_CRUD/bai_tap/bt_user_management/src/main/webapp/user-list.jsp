<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
          crossorigin="anonymous">
</head>
<body>
<h1>User List</h1>
<table class="table">
    <thead>
    <tr>
        <th>No.</th>
        <th>User Name</th>
        <th>Email</th>
        <th>Country</th>
        <th>Action</th>

    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="user" varStatus="loop">
        <tr>
            <td>${user.getId()}</td>
            <td>${user.getName()}</td>
            <td>${user.getEmail()}</td>
            <td>${user.getCountry()}</td>
            <td><a class="btn btn-outline-primary" href="/product-servlet?action=edit">Edit</a>
                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal" >Xóa</button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
