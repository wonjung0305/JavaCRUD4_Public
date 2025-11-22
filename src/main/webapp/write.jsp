<%--
  Created by IntelliJ IDEA.
  User: 원중
  Date: 2025-11-20
  Time: 오전 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>

<html>
<head>
    <title>Title</title>

    <style>
        html,body{
            height: 100%;
            margin: 0;
            padding: 0;
            background: #d8d8d8;

            display: flex;
            flex-direction: column;
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

        .form-box {
            display: grid;
            grid-template-columns: 120px 1fr;

            row-gap: 20px;
            column-gap: 20px;

            font-size: 18px;
        }

        input[type=text],
        textarea {
            width: 100%;
            padding: 10px;

            border: 1px solid #ccc;
            border-radius: 4px;

            font-size: 16px;
        }

        textarea {
            resize: none;
        }

        .btn-area {
            margin-top: 30px;
            text-align: right;
        }

        .submit-btn {
            background: #89ff8f;
            color: white;

            border: none;
            border-radius: 4px;

            padding: 12px 20px;
            font-size: 16px;
            cursor: pointer;
        }
        .submit-btn:hover {
            background: #5fb164;
        }

        .list-btn {
            background: #aaa;
            color: white;

            border:none;
            border-radius: 4px;

            padding: 12px 20px;
            margin-right: 10px;

            font-size: 16px;
            cursor: pointer;
        }
        .list-btn:hover {
            background: #777;
        }

    </style>
</head>
<body>
<%@include file="header.jsp"%>

<div class="container">
    <div class="title">글 작성</div>

    <form action="write_ok.jsp" method="post">
        <div class="form-box">

            <label for="title">작품명</label>
            <input type="text" id="title" name="title" required>
            <label for="writer">작가</label>
            <input type="text" id="writer" name="writer" required>
            <label for="content">내용</label>
            <input type="text" id="content" name="content" required>

        </div>

        <div class="btn-area">
            <button type="button" onclick="location.href='list.jsp'" class="list-btn">목록으로</button>
            <button type="submit" class="submit-btn">등록하기</button>

        </div>

    </form>

</div>

<%@include file="footer.jsp"%>
</body>
</html>
