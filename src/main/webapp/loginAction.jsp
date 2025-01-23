<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.UserDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		String userID = request.getParameter("userID");
		String userPassword = request.getParameter("userPassword");
	
		UserDAO userDAO = new UserDAO(); // DAO 객체 생성
		int result = userDAO.login(userID, userPassword); // 로그인 메서드 호출
	
		if (result == 1) {
			session.setAttribute("userID", userID); // 세션에 사용자 정보 저장
			out.println("<script>");
			out.println("alert('로그인 성공!');");
			out.println("location.href='index.jsp';"); // 메인 페이지로 이동
			out.println("</script>");
		} else if (result == 0) {
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다.');");
			out.println("history.back();"); // 이전 페이지로 돌아가기
			out.println("</script>");
		} else if (result == -1) {
			out.println("<script>");
			out.println("alert('존재하지 않는 아이디입니다.');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('데이터베이스 오류가 발생했습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
	%>
</body>
</html>