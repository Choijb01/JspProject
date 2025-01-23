<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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

    /* 회원가입 컨테이너 */
    .join-container {
        width: 100%;
        max-width: 500px;
        margin: 50px auto;
        padding: 20px;
        background-color: white;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    .join-container h3 {
        text-align: center;
        margin-bottom: 20px;
    }

    .join-container label {
        font-weight: bold;
    }

    .join-container input[type="text"],
    .join-container input[type="password"],
    .join-container input[type="email"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    /* 성별 선택 스타일 */
    .gender-container {
        margin-bottom: 15px;
    }

    .gender-container .gender-label {
        display: block;
        margin-bottom: 10px;
        font-weight: bold;
    }

    .radio-buttons {
        display: flex;
        border: 1px solid #ccc;  /* 하나의 박스에 경계선 */
        border-radius: 5px;
        background-color: #f9f9f9;
    }

    .radio-buttons input[type="radio"] {
        display: none; /* 기본 라디오 버튼 숨김 */
    }

    .radio-buttons label {
        flex: 1;
        text-align: center;
        padding: 10px 0;
        cursor: pointer;
        transition: background-color 0.3s, color 0.3s, border-color 0.3s;
    }

    .radio-buttons input[type="radio"]:checked + label {
        background-color: #007bff;
        color: white;
        border-color: #007bff;
    }

    .radio-buttons label:hover {
        background-color: #e0e0e0;
    }

    .join-container button {
        width: 100%;
        padding: 10px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
    }

    .join-container button:hover {
        background-color: #0056b3;
    }

    .cancel-button {
        margin-top: 10px;
        text-align: center;
    }

    .cancel-button button {
        width: 100%;
        padding: 10px 20px;
        background-color: #dc3545;
    }

    .cancel-button button:hover {
        background-color: #c82333;
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
    
    <!-- 회원가입 컨테이너 -->
    <div class="join-container">
        <h3>회원가입</h3>
        <form action="joinAction.jsp" method="post">
            <label for="userID">아이디:</label>
            <input type="text" id="userID" name="userID" required>

            <label for="userPassword">비밀번호:</label>
            <input type="password" id="userPassword" name="userPassword" required>

            <!-- 성별 선택 -->
            <div class="gender-container">
                <span class="gender-label">성별:</span>
                <div class="radio-buttons">
                    <input type="radio" id="male" name="userGender" value="남자" required>
                    <label for="male">남자</label>
                    <input type="radio" id="female" name="userGender" value="여자">
                    <label for="female">여자</label>
                </div>
            </div>

            <label for="userName">이름:</label>
            <input type="text" id="userName" name="userName" required>

            <label for="userBirthDate">생년월일 (YYYYMMDD):</label>
            <input type="text" id="userBirthDate" name="userBirthDate" pattern="\d{8}" title="YYYYMMDD 형식으로 입력하세요." maxlength="8" required>

            <label for="userPhoneNumber">핸드폰 번호 (010-XXXX-XXXX):</label>
            <input type="text" id="userPhoneNumber" name="userPhoneNumber" pattern="010-\d{4}-\d{4}" title="010-XXXX-XXXX 형식으로 입력하세요." maxlength="13" required>

            <label for="userEmail">이메일:</label>
            <input type="email" id="userEmail" name="userEmail" required>

            <button type="submit">회원가입</button>
        </form>
        <div class="cancel-button">
            <form action="login.jsp" method="get">
                <button type="submit">돌아가기</button>
            </form>
        </div>
    </div>
</body>
</html>