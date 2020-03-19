<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 25.11.2019
  Time: 18:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My Page</title>
</head>
<body>
<h3><spring:message code="my_page_page"/></h3><br><br>
<spring:message code="my_page_login"/>${user.name}<br><br>
<spring:message code="my_page_password"/>${user.password}<br><br>
<spring:message code="my_page_name"/>${user.firstname}<br><br>
<spring:message code="my_page_last_name"/>${user.lastname}<br><br>
<spring:message code="my_page_gender"/>${user.gender}<br><br>
<spring:message code="my_page_city"/>${user.city}<br><br>
<spring:message code="my_page_role"/>${user.role}<br><br><br>
<form action="/servletUpdate" method="get">
    <input type="hidden" name="id" value="${user.id}"/>
    <input type="hidden" name="name" value="${user.name}"/>
    <input type="hidden" name="password" value="${user.password}"/>
    <input type="hidden" name="firstname" value="${user.firstname}"/>
    <input type="hidden" name="lastname" value="${user.lastname}"/>
    <input type="hidden" name="gender" value="${user.gender}"/>
    <input type="hidden" name="city" value="${user.city}"/>
    <input type="hidden" name="role" value="${user.role}">
    <input type="submit" value="<spring:message code="my_page_change_inf"/>"/>
</form>
<form action="/servletDelete" method="get">
    <input type="hidden" name="id" value="${user.id}"/>
    <input type="hidden" name="name" value="${user.name}"/>
    <input type="hidden" name="password" value="${user.password}"/>
    <input type="submit" value="<spring:message code="my_page_delete"/>"/>
</form>
<form action="/servletLogin">
    <input type="submit"value="<spring:message code="my_page_exit"/>"/>
</form><br>
<c:set var="valid" value="admin"/>
<c:if test="${user.role eq valid}">
    <form action="servletGetAll" method="get">
        <input type="hidden" name="name" value="${user.name}">
        <input type="hidden" name="password" value="${user.password}">
        <input type="submit" value="<spring:message code="my_page_table_us"/>">
    </form>
</c:if>
</body>
</html>
