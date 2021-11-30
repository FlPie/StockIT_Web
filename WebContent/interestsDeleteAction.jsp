<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.io.PrintWriter" %>
<jsp:useBean id="user" class = "user.User" scope = "page"/>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
PrintWriter script = response.getWriter();

if(session.getAttribute("id") == null){
	response.sendRedirect("login.jsp");
}
String id = (String)session.getAttribute("id");
String symbol = request.getParameter("ticker");
%>

<%
	int delete_check = 0;
	Connection conn = null;
	PreparedStatement pstmt= null;
	String sql = null;
	ResultSet rs = null;
	Class.forName("com.mysql.cj.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/STOCKIT?serverTimezone=UTC";
	conn = DriverManager.getConnection(url,"root","0000");
	try{

		
		String SQL2 = "SELECT count(*) FROM interest where userId = ? AND symbol = ?";	
		pstmt = conn.prepareStatement(SQL2);
		pstmt.setString(1, id);						
		pstmt.setString(2, symbol);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
            delete_check = rs.getInt(1);		//중복체크
			}
		}catch(Exception e){
			out.println("DB 연동 오류 입니다.:" +e.getMessage());	
		}
	
	if(delete_check == 0){
		script.println("<script>");
		script.println("alert('관심종목으로 등록되있지 않은 종목입니다.')");		
		script.println("history.back()");
		script.println("</script>");
		
	}else{
		delete_check = 0;
		try{
			String SQL = "DELETE FROM interest where userId = ? AND symbol = ?";
		
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);						
			pstmt.setString(2, symbol);
			pstmt.executeUpdate();
			}catch(Exception e){
				out.println("DB 연동 오류 입니다.:" +e.getMessage());	
			}
	
	}
	script.println("<script>");
	script.println("alert('관심종목에서 해제되었습니다.')");		
	script.println("history.back()");
	script.println("</script>");
%>

	
</body>
</html>