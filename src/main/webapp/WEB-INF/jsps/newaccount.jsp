<%--
  Created by IntelliJ IDEA.
  User: AA
  Date: 28.09.2016

  Time: 12:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>

<head>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/mainstyle.css">
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/script/jquery.js"></script>

    <script type="text/javascript">
        function onLoad() {

            $("#password").keyup(checkPasswordsMatch);
            $("#confirmpass").keyup(checkPasswordsMatch);

            $("#details").submit(canSubmit);
        }

        function canSubmit() {
            var password = $("#password").val();
            var confirmpass = $("#confirmpass").val();

            if(password != confirmpass) {
                alert("<fmt:message key='UnmatchedPasswords.user.password'/>")
                return false;
            }
            else {
                return true;
            }
        }

        function checkPasswordsMatch() {
            var password = $("#password").val();
            var confirmpass = $("#confirmpass").val();

            if (password.length > 3 || confirmpass.length > 3) {

                if (password == confirmpass) {
                    $("#matchpass").text("<fmt:message key='MatchedPasswords.user.password'/>");
                    $("#matchpass").addClass("valid");
                    $("#matchpass").removeClass("error");
                } else {
                    $("#matchpass").text("<fmt:message key='UnmatchedPasswords.user.password'/>");
                    $("#matchpass").addClass("error");
                    $("#matchpass").removeClass("valid");
                }
            }
        }

        $(document).ready(onLoad);

    </script>


    <title>Create New Account</title>
</head>

<body>

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
            <td><input id="confirmpass" class="control" name="confimpass" type="text"/><br/>
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

</body>

</html>
