<%--
  Created by IntelliJ IDEA.
  User: 원중
  Date: 2025-11-21
  Time: 오전 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import ="com.example.javacrud4.dao.BoardDAO"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.javacrud4.vo.BoardVO" %>
<%@ page import="java.util.ArrayList" %>

<%
    BoardDAO dao = new BoardDAO();
    List<BoardVO> list = dao.getList();
%>

<%--

그 다음 헤더/푸터를 넣어서 include 시키기

write.jsp 적당히 꾸미기

wirte_ok.jsp에서 바로 list로 이동하도록

다음에 dao 에서 삭제 가능하도록 코드 짜고, delete_ok.jsp에서 삭제하고 list page로 돌아가게 해서 확인하기

마지막에 index 페이지는 적당한 소개 -> list.jsp로 이동하도록


list 개선: 번호 / 제목 / 작성자 / 내용 30줄 이내 정도까지만 보이게 / 날짜는 년도.월.일 까지만
        : 글 제목으로 들어가게 하도록 (상세 페이지로)
        : 버튼 만들기 (글 추가, 글 삭제, 글 수정)

--%>
<html>
<head>
    <title>list.jsp 페이지</title>
</head>
<body>
<h2>웹툰 게시판 테스트</h2>

<table border="1" width="600">
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>내용</th>
        <th>날짜</th>
        <th>관리(수정/삭제)</th>
    </tr>

    <%
        int i = 0;
        for (BoardVO vo: list){
            i++;

    %>
    <tr>
        <td><%=i%></td>
        <td><%=vo.getTitle()%></td>
        <td><%=vo.getWriter()%></td>
        <td><%=vo.getContent()%></td>
        <td><%=vo.getRegdate()%></td>
        <td>
            <a href="edit.jsp?id=<%=vo.getId()%>">
                수정
            </a>
        </td>
        <td>
            <a href="delete_ok.jsp?id=<%=vo.getId()%>"
                onclick="return confirm('정말 삭제하시겠습니까?');">
                삭제
            </a>
        </td>
    </tr>
    <%
        }
    %>

</table>


</body>
</html>
