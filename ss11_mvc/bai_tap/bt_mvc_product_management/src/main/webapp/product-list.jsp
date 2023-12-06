<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    </style>
    <title>Product List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
          crossorigin="anonymous">
</head>
<body>
<a class="btn btn-outline-primary" href="/product-servlet?action=create">Add new product</a>

<form method="get" action="/product-servlet">
    <input type="hidden" name="action" value="search">
    <input type="text" name="searchId" placeholder="search by Id" id="searchId">
    <input type="submit" value="search">
</form>


<h1>Product List</h1>
<table class="table">
    <thead>
    <tr>
        <th>No.</th>
        <th>Product Name</th>
        <th>Price</th>
        <th>Description</th>
        <th>Manufacturer</th>
        <th>Action</th>

    </tr>
    </thead>
    <tbody>
        <c:forEach items="${list}" var="product" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td>${product.getName()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getDescription()}</td>
            <td>${product.getManufacturer()}</td>
            <td><a class="btn btn-outline-primary" href="/product-servlet?action=edit&id=${product.getId()}" >Edit</a>
            <button type="button" class="btn btn-danger" onclick="sendInfo('${product.id}','${product.name}')" data-bs-toggle="modal" data-bs-target="#exampleModal" >Xóa</button>
            </td>
        </tr>
        </c:forEach>
    </tbody>
</table>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Are you sure?</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form method="post" action="/product-servlet?action=delete">
                <div class="modal-body">
                    <input type="hidden" id="id" name="id">
                    Bạn có chắc muốn xóa <span id="name"></span>?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancle</button>
                    <button type="submit" class="btn btn-primary">Delete</button>
                </div>
            </form>

        </div>
    </div>
</div>
<script>
    function sendInfo(id,name){
        document.getElementById("name").innerText= name;
        document.getElementById("id").value=id;
    }
    // function sendInfoToEditForm(id,name, price,description,manufacturer){
    //     document.getElementById("id").value=id;
    //     document.getElementById("name").value= name;
    //     document.getElementById("price").value= price;
    //     document.getElementById("description").value=description;
    //     document.getElementById("manufacturer").value=manufacturer;
    //
    //
    // }
</script>
</body>
</html>
