<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 25.11.2019
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<h3><spring:message code="login_log"/></h3><br>
<form action="servletLogin" method="post">
    <spring:message code="login_inp_log"/>
    <input type="text" name="name" placeholder="${message}"/><br><br>
    <spring:message code="login_inp_pass"/>
    <input type="password" name="password" placeholder="${message}"/><br><br>
    <input type="submit" value="<spring:message code="login_enter"/>">
</form>
<form action="/servletEnter">
    <input type="submit" value="<spring:message code="login_back"/>">
</form>
</body>
</html>
