<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>

<div style="
    width:100%;
    background:#89ff8f;
    padding:20px;
    display:flex;
    align-items:center;
    justify-content:space-between;
    color:white;

    box-sizing: border-box;
">

    <!-- 왼쪽 제목 -->
    <div style="font-size:26px; font-weight:bold;">
        <a href="list.jsp" style="text-decoration: none; color: white">작가 공지방</a>
    </div>

    <!-- 오른쪽 검색바 -->
    <form action="list.jsp" method="get" style="margin:0;">
        <input type="text"
               name="keyword"
               placeholder="검색어를 입력하세요"
               style="padding:8px 12px; border:none; border-radius:6px; width:200px;">

        <button type="submit"
                style="padding:8px 14px; background:white; color:#13fa1b;
                       border:none; border-radius:6px; cursor:pointer; font-weight:bold;">
            검색
        </button>
    </form>

</div>
