<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Simple Calculator</title>
</head>
<body>
<h1>Simple Calculator</h1>
<form action="/calculator-servlet" >
    <label>First Operand:</label>
    <input type="number" name="firstNum"><br>
    <label>Operator:</label>
    <select name="operator">
        <option value="add"> Additional</option>
        <option value="sub"> Sub</option>
        <option value="mul"> Multi</option>
        <option value="div"> Division</option>
    </select><br>
    <label>Second Operand:</label>
    <input type="number" name="secondNum"><br>
    <input type="submit" value="Calculate">
</form>
</body>
</html>