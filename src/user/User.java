package user;

public class User {//사용자 정보 관리용
	private String userID;
	private String userPassword;
	private String userName;
	private String userEmail;
	
	
	public String getUserID() {	//get set 메서드들
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = this.userID + userEmail;
	}
	
	
	
	
}
