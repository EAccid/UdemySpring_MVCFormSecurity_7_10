<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<table class="offers">
    <c:forEach var="offer" items="${offers}">
        <tr>
            <td class = "name" ><c:out value="${offer.user.name}"/></td>
            <td class = "contact" ><c:out value="${offer.user.email}"/></td>
            <td class = "text" ><c:out value="${offer.text}"/></td>
        </tr>
    </c:forEach>
</table>

