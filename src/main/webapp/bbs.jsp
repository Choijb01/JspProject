<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="dao.BbsDAO" %>
<%@ page import="dto.BbsDTO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
<style type="text/css">
    /* 기본적인 스타일 초기화 */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
    }

    /* 네비게이션 바 */
    nav {
        background-color: #333;
        color: white;
        padding: 10px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    nav a {
        color: white;
        text-decoration: none;
        padding: 10px;
    }

    nav a:hover {
        background-color: #575757;
    }

    .navbar-brand {
        font-size: 24px;
    }

    /* 메뉴바 */
    ul {
        list-style-type: none;
        display: flex;
        padding: 0;
    }

    ul li {
        margin: 0 10px;
    }

    /* 로그인 메뉴바 */
    .navbar-nav-right {
        margin-left: auto;
        display: flex;
    }

    .navbar-nav-right li {
        margin: 0 10px;
    }

    /* 드롭다운 메뉴 */
    .dropdown-menu {
        list-style-type: none;
        background-color: white;
        padding: 10px;
        display: none;
        position: absolute;
        min-width: 160px;
        border: 1px solid #ccc;
    }

    .dropdown:hover .dropdown-menu {
        display: block;
    }

    .dropdown-menu li {
        margin: 5px 0;
    }

    .dropdown-menu li a {
        text-decoration: none;
        color: black;
    }

    .dropdown-menu li a:hover {
        background-color: #f1f1f1;
    }

    /* 컨테이너 스타일 */
    .bbs-container {
        width: 55%;
        margin: 20px auto;
        padding: 20px;
        background-color: white;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }

    /* 테이블 스타일 */
    .bbs-container table {
        width: 100%;
        border-collapse: collapse;
        text-align: center;
        margin: 20px 0;
    }

    .bbs-container th,
    .bbs-container td {
        border: 1px solid #dddddd;
        padding: 10px;
    }

    .bbs-container th {
        background-color: #eeeeee;
    }

    /* 버튼 스타일 */
    .btn {
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 5px;
        margin: 5px;
    }

    .btn:hover {
        background-color: #45a049;
    }

    .btn-container {
        display: flex;
        justify-content: flex-end;
    }
</style>
</head>
<body>
    <%
        String userID = null;
        if (session.getAttribute("userID") != null){
            userID = (String) session.getAttribute("userID");
        }
        int pageNumber = 1; // 기본페이지
        if(request.getParameter("pageNumber") != null){
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
        }
    %>
    <!-- 네비게이션 바 -->
    <nav>
        <div>
            <a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
        </div>
        <ul>
            <li><a href="main.jsp">메인</a></li>
            <li><a href="bbs.jsp">게시판</a></li>
        </ul>
        <!-- 로그인 메뉴바 -->
        <div class="navbar-nav-right">
            <%
                if(userID == null){
            %>
            <ul>
                <li class="dropdown">
                    <a href="#">접속하기</a>
                    <ul class="dropdown-menu">
                        <li><a href="login.jsp">로그인</a></li>
                        <li><a href="join.jsp">회원가입</a></li>
                    </ul>
                </li>
            </ul>
            <%
                } else {
            %>
            <ul>
                <li class="dropdown">
                    <a href="#">회원관리</a>
                    <ul class="dropdown-menu">
                        <li><a href="logoutAction.jsp">로그아웃</a></li>
                    </ul>
                </li>
            </ul>
            <%        
                }
            %>
        </div>
    </nav>
    <!-- 게시판 화면 -->
    <div class="bbs-container">
        <div class="row">
            <table>
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        BbsDAO bbsDAO = new BbsDAO();
                        ArrayList<BbsDTO> list = bbsDAO.getList(pageNumber);
                        for(int i = 0; i < list.size(); i++){
                    %>
                    <tr>
                        <td><%= list.get(i).getBbsID() %></td>
                        <td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle() %></a></td>
                        <td><%= list.get(i).getUserID() %></td>
                        <td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시" + list.get(i).getBbsDate().substring(14, 16) + "분"%></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <%
                if(pageNumber != 1){
            %>
                <a href="bbs.jsp?pageNumber=<%= pageNumber - 1 %>" class="btn">이전</a>
            <%
                } if(bbsDAO.nextPage(pageNumber + 1)) {
            %>
                <a href="bbs.jsp?pageNumber=<%= pageNumber + 1 %>" class="btn">다음</a>
            <%
                }
            %>
            <div class="btn-container">
	            <a href="write.jsp" class="btn">글쓰기</a>
	        </div>
        </div>
    </div>
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</body>
</html>