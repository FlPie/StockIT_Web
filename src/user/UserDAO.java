package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;
public class UserDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public UserDAO(){ 
		try{
			String dbURL = "jdbc:mysql://localhost:3306/STOCKIT";	
			String dbID = "root";									
			String dbPassword = "root";							
			Class.forName("com.mysql.jdbc.Driver");					
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword); 
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
	
	public void profile_image_upload(String userID, String fileName, String fileRealName) {

		String SQL = "SELECT * FROM IMAGE WHERE userID = ?";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				SQL="update image set filename=?, filerealname=? where userID=?";
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1,  fileName);
				pstmt.setString(2,  fileRealName);
				pstmt.setString(3,  userID);
				pstmt.executeUpdate();
			}
			else
			{
				SQL = "INSERT INTO IMAGE VALUES (?, ?, ?)";
				try {

					PreparedStatement pstmt = conn.prepareStatement(SQL);
					pstmt.setString(1,  userID);
					pstmt.setString(2,  fileName);
					pstmt.setString(3,  fileRealName);
					pstmt.executeUpdate();
			}catch (Exception e){
			e.printStackTrace();
			}
			}
		}catch (Exception e){
		e.printStackTrace();
		}
	}
	
	public String profile_image_get(String userID)
	{
		String Dir = null;
		String SQL = "SELECT * FROM IMAGE WHERE userID = ?";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next() && (rs.getString(3) != null))
				{
					Dir = "profile_image/" + rs.getString(3); // 나중에 파일 합칠 때 경로 변경 필요
				}
			else
				{
					Dir = "https://via.placeholder.com/150";
				}
		}
		catch (Exception e){
			e.printStackTrace();
		}	
		return Dir;
	}
	public int login(String userID, String userPassword){				
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()){
				if(rs.getString(1).equals(userPassword)){
					return 1;											
				}
				else
					return 0;											
			}
			return -1;													
		}catch (Exception e){
			e.printStackTrace();
		}
		return -2;														
	}
	public int register(User user){										
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?)";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());						
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserEmail());
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1; 
	}
}	
