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
		String Name = request.getParameter("nickname_text");
		String id = (String)session.getAttribute("id");
		UserDAO user = new UserDAO();
		user.change_name(id, Name);
		response.sendRedirect("mypage.jsp");
	%>
</body>
</html>