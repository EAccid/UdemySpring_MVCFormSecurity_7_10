<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<table class="offers">
    <tr>
        <td>Name</td>
        <td>Email</td>
        <td>Offer</td>
    </tr>
    <c:forEach var="offer" items="${offers}">
        <tr>
            <td><c:out value="${offer.user.name}"/></td>
            <td><c:out value="${offer.user.email}"/></td>
            <td><c:out value="${offer.text}"/></td>
        </tr>
    </c:forEach>
</table>

