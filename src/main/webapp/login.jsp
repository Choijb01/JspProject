<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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

   /* 로그인 컨테이너 스타일 */
    .login-container {
        width: 100%;
        max-width: 400px;
        margin: 50px auto;
        padding: 20px;
        background-color: white;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        border-radius: 5px;
    }

    .login-container h3 {
        text-align: center;
        margin-bottom: 20px;
    }

    .login-container label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }

    .login-container input[type="text"], 
    .login-container input[type="password"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    .login-container button {
        width: 100%;
        padding: 10px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
    }

    .login-container button:hover {
        background-color: #0056b3;
    }

    .join-button {
        margin-top: 10px;
        text-align: center;
    }

    .join-button button {
        width: 100%;
        padding: 10px 20px;
        background-color: #28a745;
    }

    .join-button button:hover {
        background-color: #218838;
    }
</style>
</head>
<body>
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
            <ul class="navbar-nav">
                <li class="dropdown">
                    <a href="#">접속하기</a>
                    <ul class="dropdown-menu">
                        <li><a href="login.jsp">로그인</a></li>
                        <li><a href="join.jsp">회원가입</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
    
    <!-- 로그인 폼 컨테이너 -->
    <div class="login-container">
        <h3>로그인</h3>
        <form action="loginAction.jsp" method="post">
            <label for="userID">아이디:</label> 
            <input type="text" id="userID" name="userID" required>
            
            <label for="userPassword">비밀번호:</label> 
            <input type="password" id="userPassword" name="userPassword" required>
            
            <button type="submit">로그인</button>
        </form>

        <!-- 회원가입 버튼 -->
        <div class="join-button">
            <form action="join.jsp" method="get">
                <button type="submit">회원가입</button>
            </form>
        </div>
    </div>
</body>
</html>