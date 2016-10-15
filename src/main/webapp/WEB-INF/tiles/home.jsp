<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<table class="offers">
    <tr>
        <td>Name</td>
        <td>Username</td>
        <td>Offer</td>
    </tr>
    <c:forEach var="offer" items="${offers}">
        <tr>
            <td><c:out value="${offer.user.name}"/></td>
            <td><a href="<c:url value="/message?uid=${offer.user.username}"/>">contact</a> </td>
            <td><c:out value="${offer.text}"/></td>
        </tr>
    </c:forEach>
</table>

<p/>

<c:choose>
    <c:when test="${hasOffer}">
        <p><a href="${pageContext.request.contextPath}/createoffer">Edit or delete your current offer.</a></p>
    </c:when>
    <c:otherwise>
        <p><a href="${pageContext.request.contextPath}/createoffer">Add a new offer.</a></p>
    </c:otherwise>
</c:choose>


<sec:authorize access="hasRole('ROLE_ADMIN')">
    <p><a href="${pageContext.request.contextPath}/admin"> --> Admin</a></p>
</sec:authorize>

