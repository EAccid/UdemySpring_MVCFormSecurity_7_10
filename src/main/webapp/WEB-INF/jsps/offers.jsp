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
</head>
<body>
<c:forEach var="offer" items="${offers}">
    <p> <c:out value="${offer}"></c:out></p>
</c:forEach>
</body>
</html>
