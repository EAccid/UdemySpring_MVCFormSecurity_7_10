<%--
  Created by IntelliJ IDEA.
  User: AA
  Date: 28.09.2016
  Time: 12:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <style type="text/css">
        .formtable {
            padding: 10px;
            border: 1px solid blue;
        }

        input[type = text] {
            width: 250px;
        }

        textarea {
            width: 250px;
            height: 300px;
        }

        .label {
            text-align: right;
            vertical-align: top;
        }

        .control {
            margin-left: 10px;
        }
    </style>
    <title>createoffer</title>
</head>

<body>

<form method="post" action="${pageContext.request.contextPath}/docreate">

    <table class="formtable">
        <tr>
            <td class="label">Name:</td>
            <td><input class="control" name="name" type="text"></td>
        </tr>
        <tr>
            <td class="label">Email:</td>
            <td><input class="control" name="email" type="text"></td>
        </tr>
        <tr>
            <td class="label">Your offer:</td>
            <td><textarea class="control" name="text" rows="10" cols="10"></textarea></td>
        </tr>
        <tr>
            <td class="label"></td>
            <td><input class="control" value="Create advert" type="submit"></td>
        </tr>
    </table>

</form>

</body>

</html>
