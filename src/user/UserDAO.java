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
			String dbPassword = "1234";								//DB ���� pw 
			Class.forName("com.mysql.jdbc.Driver");					
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword); //����
		}catch (Exception e){
			e.printStackTrace();
		}
	}
	public ResultSet save(String userID)
	{
    	String sql="select * from user where userID=?";	
    	try {
    		PreparedStatement pstmt = conn.prepareStatement(sql);	
    		pstmt.setString(1, userID);
    		rs = pstmt.executeQuery();
    	}catch (Exception e){
			e.printStackTrace();
		}
    	return rs;
	}
	public void change_name(String userID, String userName)
	{
		String SQL = "SELECT * FROM USER WHERE userID = ?";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				if(rs.getString(1).equals(userID))
				{
					SQL="update user set userName=? where userID=?";
	
					pstmt=conn.prepareStatement(SQL);
	
					pstmt.setString(1, userName);
	
					pstmt.setString(2, userID);
	
					pstmt.executeUpdate();
				}
			}
		}catch (Exception e){
			e.printStackTrace();
		}

	}
	public void change_password(String userID, String userPassword)
	{
		String SQL = "SELECT * FROM USER WHERE userID = ?";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				if(rs.getString(1).equals(userID))
				{
					SQL="update user set userPassword=? where userID=?";
	
					pstmt=conn.prepareStatement(SQL);
	
					pstmt.setString(1, userPassword);
	
					pstmt.setString(2, userID);
	
					pstmt.executeUpdate();
				}
			}
		}catch (Exception e){
			e.printStackTrace();
		}

	}
	public void quit(String userID)
	{
		String SQL="DELETE FROM USER WHERE userID = ?";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.executeUpdate();
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
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?)";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());						//���̺� ID,PW,Name������ �����
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserEmail());
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����
	}
}	
