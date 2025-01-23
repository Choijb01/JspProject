package dao;

import dto.UserDTO;

import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

public class UserDAO {

	private Connection conn; // db에 접근하게 해주는 객체

	// 생성자
	public UserDAO() {
		// 예외 처리
		try { // mysql에 접속을 하게 해주는 부분
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbID = "root";
			String dbPassword = "root12313";
			Class.forName("com.mysql.jdbc.Driver"); // Driver : mysql에 접속할 수 있도록 하는 하나의 매개체 역할
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword); // 접속된 정보가 담김
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 비밀번호 암호화 메서드
	private String hashPassword(String password) throws Exception {
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		byte[] hash = md.digest(password.getBytes("UTF-8"));
		return Base64.getEncoder().encodeToString(hash);
	}

	// 로그인 메서드
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		ResultSet rs = null;
		try (PreparedStatement pstmt = conn.prepareStatement(SQL)) {
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String hashedPassword = hashPassword(userPassword);
				if (rs.getString("userPassword").equals(hashedPassword)) {
					return 1; // 로그인 성공
				} else {
					return 0; // 비밀번호 불일치
				}
			}
			return -1; // 아이디 없음
		} catch (Exception e) {
			e.printStackTrace();
			return -2; // 데이터베이스 오류
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// 회원가입 메서드
	public int join(UserDTO user) {
		String SQL = "INSERT INTO USER (userID, userPassword, userGender, userName, userBirthDate, userPhoneNumber, userEmail) VALUES (?, ?, ?, ?, ?, ?, ?)";
		try (PreparedStatement pstmt = conn.prepareStatement(SQL)) {
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, hashPassword(user.getUserPassword())); // 비밀번호 암호화
			pstmt.setString(3, user.getUserGender());
			pstmt.setString(4, user.getUserName());
			pstmt.setString(5, user.getUserBirthDate());
			pstmt.setString(6, user.getUserPhoneNumber());
			pstmt.setString(7, user.getUserEmail());
			return pstmt.executeUpdate(); // 성공 시 1 반환
		} catch (Exception e) {
			e.printStackTrace();
			return -1; // 데이터베이스 오류
		}
	}
}