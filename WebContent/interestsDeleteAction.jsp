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
	Connection conn = null;
	PreparedStatement pstmt= null;
	String sql = null;
	ResultSet rs = null;
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/STOCKIT?serverTimezone=UTC";
		conn = DriverManager.getConnection(url,"root","0000");
	
		String SQL = "DELETE FROM interest where userId = ? AND symbol = ?";
	
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, id);						
		pstmt.setString(2, symbol);
		pstmt.executeUpdate();
		}catch(Exception e){
			out.println("DB ���� ���� �Դϴ�.:" +e.getMessage());	
		}
	
	
	script.println("<script>");
	script.println("alert('�������񿡼� �����Ǿ����ϴ�.')");		
	script.println("history.back()");
	script.println("</script>");
%>

	
</body>
</html>