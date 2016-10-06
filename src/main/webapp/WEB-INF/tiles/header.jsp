<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<a class="title" href="<c:url value="/"/>">Offers</a>

<sec:authorize access="!isAuthenticated()">
    <form action="<c:url value="/login"/>">
        <input class="login" type="submit" value="Log in"/>
    </form>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
    <form action="${pageContext.request.contextPath}/logout" method="post">
        <input class="login" type="submit" value="Log out"/>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
</sec:authorize>