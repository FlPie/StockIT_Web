<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		PrintWriter script = response.getWriter();
		String password = (String)request.getParameter("password");
		String password_check = (String)request.getParameter("password_check");
		String id = (String)session.getAttribute("id");
		if(!(password.equals(password_check)))
		{
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");			//pw 입력 실패 전 페이지로 이동
			script.println("history.back()");
			script.println("</script>");
		}
		else
		{
			UserDAO user = new UserDAO();
			user.change_password(id, password);
			script.println("<script>");
			script.println("alert('비밀번호가 변경되었습니다.')");			//마이 페이지로 이동
			script.println("location.href='mypage.jsp'");
			script.println("</script>");
		}
	%>
</body>
</html>