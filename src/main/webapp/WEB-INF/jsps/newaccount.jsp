<%--
  Created by IntelliJ IDEA.
  User: AA
  Date: 28.09.2016
  Time: 12:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<html>

<head>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/mainstyle.css">
    <title>Create New Account</title>
</head>

<body>

<sform:form method="post" action="${pageContext.request.contextPath}/createaccount" commandName="user">

    <table class="formtable">

        <tr>
            <td class="label">Username:</td>
            <td><sform:input class="control" path="username" name="username" type="text"/><br/>
                <sform:errors path="username" cssClass="error"/></td>
        </tr>
        <tr>
            <td class="label">Email:</td>
            <td><sform:input class="control" path="email" name="email" type="text"/><br/>
                <sform:errors path="email" cssClass="error"/></td>
        </tr>
        <tr>
            <td class="label">Password:</td>
            <td><sform:input class="control" path="password" name="password" type="text"/><br/>
                <sform:errors path="password" cssClass="error"/></td>
        </tr>
        <tr>
            <td class="label">Confirm Password:</td>
            <td><input class="control" name="confimpass" type="text"/><br/>
            </td>
        </tr>
        <tr>
            <td class="label"></td>
            <td><input class="control" value="Create account" type="submit"></td>
        </tr>

    </table>

</sform:form>

</body>

</html>
