package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;

public class UserDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public UserDAO(){ //DB연결
		try{
			String dbURL = "jdbc:mysql://localhost:3306/STOCKIT";	//DB주소, 포트 기본3306
			String dbID = "root";									
			String dbPassword = "root";								//DB 접속 pw 
			Class.forName("com.mysql.jdbc.Driver");					
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword); //연결
		}catch (Exception e){
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword){				//로그인 method
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()){
				if(rs.getString(1).equals(userPassword)){
					return 1;											//저장된 pw와 입력한 pw 같으면 1 반환
				}
				else
					return 0;											//pw다르면 0 반환
			}
			return -1;													//아이디 다르면 -1 반환
		}catch (Exception e){
			e.printStackTrace();
		}
		return -2;														//DB오류
	}
	public int register(User user){										//회원가입 method
		String SQL = "INSERT INTO USER VALUES (?, ?, ?)";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());						//테이블에 ID,PW,Name순으로 저장됨
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
}	
