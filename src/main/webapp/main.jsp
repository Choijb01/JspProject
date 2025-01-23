<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
    
    /* 드롭다운 메뉴 */
    .dropdown-menu {
        list-style-type: none;
        background-color: white;
        padding: 0px;
        display: none;
        position: absolute;
        min-width: 200px;
        border: 1px solid #ccc;
    }

    .dropdown:hover .dropdown-menu {
        display: block;
    }

    .dropdown-menu li {
        margin: 10px;
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
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
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
</body>
</html>