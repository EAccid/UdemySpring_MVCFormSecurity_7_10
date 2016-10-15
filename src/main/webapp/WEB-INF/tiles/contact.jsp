<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII" %>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h2>Send Message</h2>
<%--name of bean:  commandName="message" --%>

<%--User: ${fromUser}--%>

<sform:form method="post" commandName="message">

    <input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}"/>
    <%--after submit--%>
    <input type="hidden" name="_eventId" value="send"/>
    <%--for testing--%>
    <%--<input type="hidden" name="username" value="olenabrygynets"/>--%>


    <table class="formtable">

        <tr>
            <td class="label">Your name:</td>
            <td><sform:input class="control" path="name" type="text" value="${fromName}" /><br/>
                <div class="error"><sform:errors path="name"/></div>
            </td>
        </tr>

        <tr>
            <td class="label">Your email:</td>
            <td><sform:input class="control" path="email" type="text" value="${fromEmail}" /><br/>
                <div class="error"><sform:errors path="email"/></div>
            </td>
        </tr>

        <tr>
            <td class="label">Subject:</td>
            <td><sform:input class="control" path="subject" type="text" /><br/>
                <div class="error"><sform:errors path="subject"/></div>
            </td>
        </tr>

        <tr>
            <td class="label">Your message:</td>
            <td><sform:textarea class="control" path="content" type="text"/><br/>
                <div class="error"><sform:errors path="content"/></div>
            </td>
        </tr>

        <tr>
            <td class="label"></td>
            <td><input class="control" value="Send message" type="submit"></td>
        </tr>

    </table>

</sform:form>

