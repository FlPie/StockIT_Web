<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class = "user.User" scope = "page"/>
<jsp:setProperty name="user" property = "userID" />
<jsp:setProperty name="user" property = "userPassword" />
<jsp:setProperty name="user" property = "userName" />	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null){	//하나라도 입력 안된다면 다시 입력
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력 안된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else{
			UserDAO userDAO = new UserDAO();
			int result = userDAO.register(user);		//입력한 유저의 정보 register 메서드로 보내서 DB에 저장
			if (result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다.')");		//ID는 유일성을 가짐 -> DB에 이미 존재하는 ID면 다시입력
				script.println("history.back()");
				script.println("</script>");
			}else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'login.jsp'");	   //정상적으로 회원가입 -> login페이지로 이동하여 로그인
				script.println("</script>");
			}
			
		}	
	%>
</body>
</html>