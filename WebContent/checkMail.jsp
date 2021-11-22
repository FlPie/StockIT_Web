<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>

<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class = "user.User" scope = "page"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String userEmail = request.getParameter("userEmail"); //password_find에서 받은 email
		session.setAttribute("InpEmail",userEmail); 		  //세션에 저장
		
		PrintWriter script = response.getWriter();
		UserDAO userDAO = new UserDAO();
		int result = userDAO.checkMail(userEmail);			  //checkMail 메서드 실행
		if (result == 1){									  //1이면 메일 보내는 jsp로 이동
		script.println("<script>");		
		script.println("location.href = 'sendMail.jsp'");
		script.println("</script>");
		
		
		}else{												//1아니면 재입력 
			script.println("<script>");
			script.println("alert('잘못된 이메일 입력입니다.')");			
			script.println("history.back()");
			script.println("</script>");
		}
		
	%>
</body>
</html>