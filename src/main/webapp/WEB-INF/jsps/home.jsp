<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>home</title>
</head>
<body>

<p><a href="${pageContext.request.contextPath}/offers">Show current offers.</a></p>
<p><a href="${pageContext.request.contextPath}/createoffer">Add a new offer.</a></p>



<%--<sec:authorize access="!isAuthenticated()">--%>
    <%--<form action="<c:url value="/login"/>">--%>
        <%--<input type="submit" value="Log in"/>--%>
    <%--</form>--%>
<%--</sec:authorize>--%>


<%--<sec:authorize access="isAuthenticated()">--%>
    <%--<form action="${pageContext.request.contextPath}/logout" method="post">--%>
        <%--<input type="submit" value="Log out"/>--%>
        <%--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
    <%--</form>--%>
<%--</sec:authorize>--%>

<sec:authorize access="hasRole('ROLE_ADMIN')">
    <p><a href="${pageContext.request.contextPath}/admin"> --> Admin</a></p>
</sec:authorize>

</body>
</html>