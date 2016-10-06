<%--
  Created by IntelliJ IDEA.
  User: AA
  Date: 06.10.2016
  Time: 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<html>
<head>
    <title><tiles:insertAttribute name="title"/></title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/mainstyle.css">
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/script/jquery.js"></script>
    <tiles:insertAttribute name="includes"/>
</head>
<body>

<div>
    <div class="header">
        <tiles:insertAttribute name="header"/>
    </div>

    <div class="content">
        <tiles:insertAttribute name="content"/>
    </div>

    <hr/>
    <div class="footer">
        <tiles:insertAttribute name="footer"/>
    </div>

</div>

</body>
</html>
