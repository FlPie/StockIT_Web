<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.DriverManager" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String id = (String)session.getAttribute("id");
	UserDAO user = new UserDAO();
	user.quit(id);
	session.invalidate();
	out.println("<script>");
	out.println("alert('회원 탈퇴 되었습니다.')");
	out.println("location.href='main.jsp'");
	out.println("</script>");
	%>
</body>
</html>