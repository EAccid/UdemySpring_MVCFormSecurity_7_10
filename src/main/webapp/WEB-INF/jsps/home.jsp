<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

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

<sql:query var="rs" dataSource="jdbc/springUdemy">
    select id, name, email, text from offers
</sql:query>

<c:forEach var="row" items="${rs.rows}">
    ID ${row.id}<br/>
    Name ${row.name}<br/>
</c:forEach>

</body>
</html>
