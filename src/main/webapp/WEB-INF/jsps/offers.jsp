<%--
  Created by IntelliJ IDEA.
  User: AA
  Date: 28.09.2016
  Time: 12:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<html>
<head>
    <title>offers</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/mainstyle.css">
</head>
<body>
<table class="offers">
    <tr>
        <td>Name</td>
        <td>Email</td>
        <td>Offer</td>
    </tr>
    <c:forEach var="offer" items="${offers}">
        <tr>
            <td><c:out value="${offer.name}"/></td>
            <td><c:out value="${offer.email}"/></td>
            <td><c:out value="${offer.text}"/></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
