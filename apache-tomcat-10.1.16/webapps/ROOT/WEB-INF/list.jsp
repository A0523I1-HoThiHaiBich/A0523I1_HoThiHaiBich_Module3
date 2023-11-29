
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        .table{
            width: 100%;
            height: 100px;
            text-align: center;
            border-collapse: collapse;
        }
    </style>
</head>
<body>
<h1><%= "Danh sách khách hàng" %></h1><br/>
    <table class="table">
        <thead>
        <tr>
            <th>Tên</th>
            <th>Ngày sinh</th>
            <th>Địa chỉ</th>
            <th>Ảnh</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="customer" varStatus="loop">
            <tr>
                <td>${customer.getName()}</td>
                <td>${customer.getDateOfBirth()}</td>
                <td>${customer.getAddress()}</td>
                <td>${customer}<img style="width: 30px; height: 30px" src="data:image/jpeg;base64,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"></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>


</body>
</html>