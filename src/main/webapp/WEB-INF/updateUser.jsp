<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 12.11.2019
  Time: 19:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Information</title>
</head>
<body>
<h3><spring:message code="update_change_inf"/></h3><br>
<form action="/servletUpdate" method="post">
    <input type="hidden" name="id" value="${id}">
    <input type="hidden" name="role" value="${role}">
    <spring:message code="update_log"/>
    <input type="text" name="name" value="${name}"><br><br>
    <spring:message code="update_pass"/>
    <input type="text" name="password" value="${password}"><br><br>
    <spring:message code="update_name"/>
    <input type="text" name="firstname" value="${firstname}"><br><br>
    <spring:message code="update_lastname"/>
    <input type="text" name="lastname" value="${lastname}"><br><br>
    <spring:message code="update_gender"/>
    <input type="text" name="gender" value="${gender}"><br><br>
    <spring:message code="update_city"/>
    <input type="text" name="city" value="${city}"><br><br>
    <input type="submit" value="<spring:message code="update_change"/>"><br>
</form>
<form action="/servletLogin" method="post" >
    <input type="hidden" name="name" value="${name}">
    <input type="hidden" name="password" value="${password}">
    <input type="submit" value="<spring:message code="update_back"/>">
</form>
</body>
</html>
