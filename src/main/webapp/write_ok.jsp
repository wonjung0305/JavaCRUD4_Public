<%--
  Created by IntelliJ IDEA.
  User: 원중
  Date: 2025-11-20
  Time: 오전 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.example.javacrud4.dao.BoardDAO" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="com.example.javacrud4.vo.BoardVO" />
<jsp:setProperty name="user" property="*" />

<%


    BoardDAO boardDAO = new BoardDAO();
    int i = boardDAO.insertList(user);

    String msg = "데이터 추가 성공";
    if(i == 0) msg = "[Error] 데이터 추가 실패";
%>

<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="index.jsp">index로 이동</a>

</body>

<script>
    window.onload = function (){
        alert("<%= msg %>");
    }

</script>
</html>
