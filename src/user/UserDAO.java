package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;

public class UserDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public UserDAO(){ //DB����
		try{
			String dbURL = "jdbc:mysql://localhost:3306/STOCKIT";	//DB�ּ�, ��Ʈ �⺻3306
			String dbID = "root";									
			String dbPassword = "root";								//DB ���� pw 
			Class.forName("com.mysql.jdbc.Driver");					
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword); //����
		}catch (Exception e){
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword){				//�α��� method
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()){
				if(rs.getString(1).equals(userPassword)){
					return 1;											//����� pw�� �Է��� pw ������ 1 ��ȯ
				}
				else
					return 0;											//pw�ٸ��� 0 ��ȯ
			}
			return -1;													//���̵� �ٸ��� -1 ��ȯ
		}catch (Exception e){
			e.printStackTrace();
		}
		return -2;														//DB����
	}
	public int register(User user){										//ȸ������ method
		String SQL = "INSERT INTO USER VALUES (?, ?, ?)";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());						//���̺� ID,PW,Name������ �����
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����
	}
}	
