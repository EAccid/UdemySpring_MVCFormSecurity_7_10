
<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h2>Create New Account</h2>

<sform:form id="details" method="post" action="${pageContext.request.contextPath}/createaccount" commandName="user">

    <table class="formtable">

        <tr>
            <td class="label">Username:</td>
            <td><sform:input class="control" path="username" name="username" type="text"/><br/>
                <div class="error"><sform:errors path="username"/></div>
            </td>
        </tr>
        <tr>
            <td class="label">Name:</td>
            <td><sform:input class="control" path="name" name="name" type="text"/><br/>
                <div class="error"><sform:errors path="name"/></div>
            </td>
        </tr>
        <tr>
            <td class="label">Email:</td>
            <td><sform:input class="control" path="email" name="email" type="text"/><br/>
                <div class="error"><sform:errors path="email"/></div>
            </td>
        </tr>
        <tr>
            <td class="label">Password:</td>
            <td><sform:input id="password" class="control" path="password" name="password" type="password"/><br/>
                <div class="error"><sform:errors path="password"/></div>
            </td>
        </tr>
        <tr>
            <td class="label">Confirm Password:</td>
            <td><input id="confirmpass" class="control" name="confimpass" type="password"/><br/>
                <div id="matchpass"></div>
            </td>
            </td>
        </tr>
        <tr>
            <td class="label"></td>
            <td><input class="control" value="Create account" type="submit"></td>
        </tr>

    </table>

</sform:form>

