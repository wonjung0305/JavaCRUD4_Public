<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<%@include file="header.jsp"%>

<%
    response.sendRedirect("list.jsp");
%>

<%@include file="footer.jsp"%>
</body>
</html>