<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class = "user.User" scope = "page"/>
<jsp:setProperty name="user" property = "userID" />			
<jsp:setProperty name="user" property = "userPassword" />	<%-- 로그인 form에서 받은 id, pw 저장 --%> 

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<%

		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserID(), user.getUserPassword());	//입력한 id,pw를 login메서드로 보냄
		if (result == 1){
			session.setAttribute("id", user.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'mypage.jsp'");   //로그인 성공시 mypage.jsp로 이동(메인 페이지 만들어지면 메인으로 이동)
			script.println("</script>");
			}else if(result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");			//pw 입력 실패 전 페이지로 이동
			script.println("history.back()");
			script.println("</script>");
		}else if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");		//ID 입력 실패 전 페이지로 이동
			script.println("history.back()");
			script.println("</script>");
		}else if(result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류')");			//이외의 다른 오류
			script.println("history.back()");
			script.println("</script>");
		}
		
	%>
</body>
</html>