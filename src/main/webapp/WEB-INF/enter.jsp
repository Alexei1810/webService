<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 10.12.2019
  Time: 23:22
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
    <title>StartPage</title>
</head>
<body>
<span style="float: right">
	<a href="?lang=en">en</a>
	|
	<a href="?lang=ru">ru</a>
</span><br>
<br><h2><spring:message code="enter_welcome"/><br><br>
    <br><form action="servletRegistration" method="get">
        <input type="submit" value="<spring:message code="enter_reg"/>"/>
    </form><br>
    <form action="servletLogin" method="get">
        <input type="submit" value="<spring:message code="enter_log"/>">
    </form><br><br>
</body>
</html>
</body>
</html>
