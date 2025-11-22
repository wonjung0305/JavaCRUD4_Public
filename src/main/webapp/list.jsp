<%--
  Created by IntelliJ IDEA.
  User: 원중
  Date: 2025-11-21
  Time: 오전 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%@ page import ="com.example.javacrud4.dao.BoardDAO"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.javacrud4.vo.BoardVO" %>

<%
    BoardDAO dao = new BoardDAO();
    List<BoardVO> list = dao.getList();

    String keyword = request.getParameter("keyword");

    if(keyword != null && !keyword.trim().equals("")){
        list = dao.search(keyword);
    }
    else{
        list = dao.getList();
    }
%>

<html>
<head>
    <title>list.jsp 페이지</title>
    <style>
        html,body{
            height: 100%;
            margin: 0;
            padding: 0;
            background: #efefef;

            display: flex;
            flex-direction: column;

            flex: 1;
        }

        .container{
            width: 1000px;
            margin: 40px auto;
            background: white;

            padding: 20px;
            border-radius: 4px;

            box-shadow: 0 0 20px rgba(0,0,0,0.1);

            flex: 1;
        }

        .title{
            text-align: center;
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .write-area{
            display: flex;
            justify-content: flex-end;
            margin-bottom: 10px;
        }

        .write-btn{
            background-color: #89ff8f;
            color: white;

            padding: 10px 14px;

            border-radius: 4px;

            text-decoration: none;
            font-weight: 600;
        }

        .write-btn:hover{
            background-color: #5fb164;
        }

        .head-line{
            display: grid;
            grid-template-columns: 60px 1fr 2fr 120px 160px 80px;
            column-gap: 14px;

            font-size: 15px;
            font-weight: 800;

            padding: 18px;
            border-radius: 4px;

            cursor: default;
        }

        .item{
            background: white;
            color: black;

            margin-bottom: 12px;
            padding: 18px;
            border-radius: 4px;

            display: grid;
            grid-template-columns: 60px 1fr 2fr 120px 160px 80px;
            column-gap:14px;

            align-items:center;
            font-size:15px;

            box-shadow:0 2px 8px rgba(0,0,0,0.06);

            transition:0.2s;
            cursor: pointer;
        }

        .item:hover{
            background: #d2ffb1;
            font-size: 16px;
        }

        .content-link{
            color: black;
            text-decoration: none;
        }

        .date{
            font-size:14px;
            color:#777;
        }

        .delete_btn{
            background:#ff6c6c;
            color:white;
            padding:6px 10px;
            border-radius:6px;
            text-decoration:none;
            font-size:14px;
        }
        .delete_btn:hover{
            background:#b02a37;
        }

    </style>
</head>
<body>
<%@include file="header.jsp"%>

<div class="container">

    <div class="title" style="text-align:center;">
        <% if(keyword != null && !keyword.trim().equals("")) { %>
        검색 결과: "<%= keyword %>"
        <% } else { %>
        공지
        <% } %>
    </div>

    <div class="write-area">
        <a href="write.jsp" class="write-btn">글 작성</a>
    </div>

    <div class="head-line">
        <div>NO.</div>
        <div>작품명</div>
        <div>내용</div>
        <div>작가</div>
        <div>등록일</div>
        <div>관리</div>
    </div>

    <%
        int i = 0;
        for (BoardVO vo : list) {
            i++;
    %>
    <div class="item">
        <div><%=i %></div>
        <div><%=vo.getTitle() %></div>
        <div>
            <a href="view.jsp?id=<%=vo.getId()%>" class="content-link">
                    <%= (vo.getContent().length() > 30) ? vo.getContent().substring(0,30) + "..." : vo.getContent()
                %>
            </a>
        </div>
        <div><%=vo.getWriter() %></div>

        <%
            String dateStr = "";
            if (vo.getRegdate() != null) {
                dateStr = vo.getRegdate().toString();

                if (dateStr.length() >= 10) {
                    dateStr = dateStr.substring(0,10);
                }
            }
        %>
        <div class="date"><%= dateStr %></div>

        <div class="delete-area">
            <a href="delete_ok.jsp?id=<%=vo.getId()%>" class="delete_btn" onclick="return confirm('삭제하시겠습니까?')">삭제</a>
        </div>

    </div>

    <% } %>
</div>
<%@include file="footer.jsp"%>
</body>
</html>
