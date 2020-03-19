<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 25.11.2019
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration</title>
</head>
<body>
<h3><spring:message code="enter_reg"/></h3><br>
<form action="servletRegistration" method="post">
    <spring:message code="registration_inp_log"/>

    <input type="text" name="name" placeholder="${message}"><br><br>
    <spring:message code="registration_inp_pass"/>
    <input type="text" name="password" placeholder=""/><br><br>
    <input type="hidden" name="role" value="user">
    <input type="submit" value="<spring:message code="registration_do_reg"/>">
</form>
<form action="/servletEnter" method="get">
    <input type="submit" value="<spring:message code="registration_back"/>"/>
</form>
</body>
</html>
