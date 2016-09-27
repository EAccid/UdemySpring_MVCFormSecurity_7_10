<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>home.jsp</title>
</head>
<body>

Hi there! <p/>

<%--lesson 56 - Session: <%= session.getAttribute("name") %> <p/>--%>
<%--lesson 57 - Request: <%= request.getAttribute("name") %> <p/>--%>

lesson 57 - Request (using EL): ${nameBold} <p/>

<c:out value="${name}">|</c:out> <p/>

</body>
</html>
