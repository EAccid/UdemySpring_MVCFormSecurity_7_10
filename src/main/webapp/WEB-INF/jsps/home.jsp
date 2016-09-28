<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<html>
<head>
    <title>home.jsp</title>
</head>
<body>

<c:forEach var="row" items="${offers}">
    ID ${row.id}<br/>
    Name ${row.name}<br/>
    Email ${row.email}<br/>
    Text ${row.text}<br/>
</c:forEach>

</body>
</html>
