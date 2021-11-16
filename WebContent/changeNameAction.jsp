<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		PrintWriter script = response.getWriter();
		String Name = request.getParameter("nickname_text");
		String id = (String)session.getAttribute("id");
		UserDAO user = new UserDAO();
		user.change_name(id, Name);
		script.println("<script>");
		script.println("alert('닉네임이 변경되었습니다.')");			//마이 페이지로 이동
		script.println("location.href='mypage.jsp'");
		script.println("</script>");
	%>
</body>
</html>