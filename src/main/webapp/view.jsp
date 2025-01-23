<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="dto.BbsDTO" %>
<%@ page import="dao.BbsDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/custom.css">
<title>JSP 게시판 웹 사이트</title>
<style>
    /* 기본적인 스타일 초기화 */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: Arial, sans-serif;
        margin: 0;
        background-color: #f4f4f4;
    }

    /* 네비게이션 바 */
    .navbar {
        background-color: #333;
        color: white;
        padding: 10px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .navbar a {
        color: white;
        text-decoration: none;
        padding: 10px;
    }

    .navbar a:hover {
        background-color: #575757;
    }

    .navbar .navbar-brand {
        font-size: 24px;
    }

    /* 메뉴바 */
    .navbar-nav {
        list-style-type: none;
        display: flex;
    }

    .navbar-nav li {
        margin: 0 10px;
    }

    .navbar-nav li a {
        text-decoration: none;
    }

    .navbar-nav-right {
        margin-left: auto;
        display: flex;
    }

    .navbar-nav-right li {
        margin: 0 10px;
    }

    /* 컨테이너 */
    .view-container {
        width: 55%;
        margin: 20px auto;
        padding: 20px;
        background-color: white;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }

    /* 테이블 */
    .view-container table {
        width: 100%;
        margin: 20px 0;
        border-collapse: collapse;
        text-align: center;
    }

    .view-container th, 
    .view-container td {
        padding: 10px;
        border: 1px solid #dddddd;
    }

    .view-container th {
        background-color: #eeeeee;
    }

    /* 버튼 */
    .btn {
        display: inline-block;
        background-color: #007bff;
        color: white;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 4px;
        text-align: center;
        margin: 5px;
    }

    .btn:hover {
        background-color: #0056b3;
    }
    
    .btn-container {
        display: flex;
        justify-content: flex-end;
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
</style>
</head>
<body>
    <%
        String userID = null;
        if (session.getAttribute("userID") != null){
            userID = (String) session.getAttribute("userID");
        }
        int bbsID = 0;
        if (request.getParameter("bbsID") != null){
            bbsID = Integer.parseInt(request.getParameter("bbsID"));
        }
        if(bbsID == 0) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('유효하지 않은 글입니다.')");
            script.println("location.href = 'bbs.jsp'");
            script.println("</script>");
        }
        BbsDTO bbs = new BbsDAO().getBbs(bbsID);
    %>
    <!-- 네비게이션 바 -->
    <nav class="navbar">
        <div>
            <a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
        </div>
        <ul class="navbar-nav">
            <li><a href="main.jsp">메인</a></li>
            <li><a href="bbs.jsp">게시판</a></li>
        </ul>
        <!-- 로그인 메뉴바 -->
        <div class="navbar-nav-right">
            <%
                if(userID == null){
            %>
            <ul class="navbar-nav">
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
            <ul class="navbar-nav">
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
    <div class="view-container">
        <div class="row">
            <table>
                <thead>
                    <tr>
                        <th colspan="3">게시판 글 보기</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>글 제목</td>
                        <td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll(">", "&gt;").replaceAll("<", "&lt;").replaceAll("\n", "<br>") %></td>
                    </tr>
                    <tr>
                        <td>작성자</td>
                        <td colspan="2"><%= bbs.getUserID() %></td>
                    </tr>
                    <tr>
                        <td>작성일자</td>
                        <td colspan="2"><%= bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시" + bbs.getBbsDate().substring(14, 16) + "분"%></td>
                    </tr>
                    <tr>
                        <td>내용</td>
                        <td colspan="2"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll(">", "&gt;").replaceAll("<", "&lt;").replaceAll("\n", "<br>") %></td>
                    </tr>
                </tbody>
            </table>
            <div class="btn-container">
	            <a href="bbs.jsp" class="btn">목록</a>
	            <%
	                if(userID != null && userID.equals(bbs.getUserID())) {
	            %>
	            <a href="update.jsp?bbsID=<%= bbsID %>" class="btn">수정</a>
	            <a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn">삭제</a>
	            <%
	                }
	            %>
            </div>
        </div>
    </div>
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</body>
</html>