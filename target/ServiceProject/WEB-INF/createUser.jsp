<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 12.11.2019
  Time: 19:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create User</title>
</head>
<body>
<form action="/servletGetAll" method="post" >
    <h3><spring:message code="create_create_user"/></h3>
    <spring:message code="create_login"/>
    <input type="text" name="login" placeholder="${message}" ><br><br>
    <spring:message code="create_password"/>
    <input type="password" name="pass" ><br><br>
    <spring:message code="create_role"/><br><br>
    <input type="radio"  name="role" value="user" checked/><spring:message code="create_user"/><br><br>
    <input type="radio"  name="role" value="admin"/><spring:message code="create_admin"/><br><br>
    <input type="hidden" name="name" value="${name}">
    <input type="hidden" name="password" value="${password}">
    <input type="submit" value="<spring:message code="create_create"/>">
</form>
<form action="/servletGetAll" method="get">
    <input type="hidden" name="name" value="${name}">
    <input type="hidden" name="password" value="${password}">
    <input type="submit" value="<spring:message code="create_back"/>">
</form>
</body>
</html>
