<%--
  Created by IntelliJ IDEA.
  User: 원중
  Date: 2025-11-21
  Time: 오후 2:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="com.example.javacrud4.dao.BoardDAO"  %>

<%
    // 문자열로 받아서 정수로 바꾸고
    int id = Integer.parseInt(request.getParameter("id"));

    BoardDAO dao = new BoardDAO();
    dao.deleteList(id);

    response.sendRedirect("list.jsp");  // list.jsp로 바로 이동
%>


<html>
<head>
    <title>delete</title>
</head>
<body>

</body>
</html>
