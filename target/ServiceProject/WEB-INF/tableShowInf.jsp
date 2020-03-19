<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 11.12.2019
  Time: 15:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Show Info</title>
</head>
<body>
<form action="/servletAdminUpdate" method="post">
    <input type="hidden" name="adminName" value="${adminName}">
    <input type="hidden" name="adminPassword" value="${adminPassword}">
    <input type="hidden" name="id" value="${id}">
    ID:${id} <br><br>
        <spring:message code="my_page_login"/>
    <input type="text" name="name" value="${name}"/><br><br>
        <spring:message code="my_page_password"/>
    <input type="text" name="password" value="${password}"/><br><br>
        <spring:message code="my_page_name"/>
    <input type="text" name="firstname" value="${firstname}"/><br><br>
        <spring:message code="my_page_last_name"/>
    <input type="text" name="lastname" value="${lastname}"/><br><br>
        <spring:message code="my_page_gender"/>
    <input type="text" name="gender" value="${gender}"/><br><br>
        <spring:message code="my_page_city"/>
    <input type="text" name="city" value="${city}"/><br><br>
        <spring:message code="my_page_role"/>
    <input type="text" name="role" value="${role}"><br><br>
    <input type="submit" value="<spring:message code="my_page_change_inf"/>"/>
</form>
<form action="/servletGetAll" method="get">
    <input type="hidden" name="name" value="${adminName}">
    <input type="hidden" name="password" value="${adminPassword}">
    <input type="submit" value="<spring:message code="create_back"/>">
</form>
</body>
</html>
