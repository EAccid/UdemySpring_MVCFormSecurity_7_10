<%--
  Created by IntelliJ IDEA.
  User: AA
  Date: 05.10.2016
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/mainstyle.css">
</head>
<body>

<h3>Authorised Users Only!</h3>

<table class="formtable">
    <tr>
        <td>Username</td>
        <td>Email</td>
        <td>Role</td>
        <td>Enabled</td>
    </tr>
    <c:forEach var="user" items="${users}">

        <tr>
            <td><c:out value="${user.username}"/></td>
            <td><c:out value="${user.email}"/></td>
            <td><c:out value="${user.authority}"/></td>
            <td><c:out value="${user.enabled}"/></td>
        </tr>

    </c:forEach>
</table>

</body>
</html>
