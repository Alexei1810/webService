<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 11.11.2019
  Time: 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AllUsers</title>
</head>
<body>
<h3><spring:message code="table_users"/></h3>
<table border="1">
    <tr>
        <td><spring:message code="table_id"/></td>
        <td><spring:message code="table_name"/></td>
        <td><spring:message code="table_pass"/></td>
    </tr>
<c:forEach items="${users}" var="user">
    <tr>
        <td>${user.id}</td>
        <td>${user.name}</td>
        <td>${user.password}</td>
        <td>
            <form action="servletAdminUpdate" method="get">
                <input type="hidden" name="adminName" value="${name}">
                <input type="hidden" name="adminPassword" value="${password}">
                <input type="hidden" name="id" value="${user.id}"/>
                <input type="hidden" name="name" value="${user.name}"/>
                <input type="hidden" name="password" value="${user.password}"/>
                <input type="hidden" name="firstname" value="${user.firstname}"/>
                <input type="hidden" name="lastname" value="${user.lastname}"/>
                <input type="hidden" name="gender" value="${user.gender}"/>
                <input type="hidden" name="city" value="${user.city}"/>
                <input type="hidden" name="role" value="${user.role}"/>
                <input type="submit" value="<spring:message code="update_change"/>"/>
            </form>
        </td>
        <td>
            <form action="/getAllDelete" method="post">
                <input type="hidden" name="name" value="${name}">
                <input type="hidden" name="password" value="${password}">
                <input type="hidden" name="id" value="${user.id}"/>
                <input type="submit" value="<spring:message code="table_delete"/>"/>
            </form>
        </td>
    </tr>
</c:forEach>
</table>
<br>
<form action="/servletGetAllCreate" method="get">
    <input type="hidden" name="name" value="${name}">
    <input type="hidden" name="password" value="${password}">
    <input type="submit" value="<spring:message code="table_add"/>"/>
</form>

<form action="servletLogin" method="post">
    <input type="hidden" name="name" value="${name}">
    <input type="hidden" name="password" value="${password}">
    <input type="submit" value="<spring:message code="table_back"/>"/>
</form>
</body>
</html>
