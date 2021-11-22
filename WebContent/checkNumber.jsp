<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	PrintWriter script = response.getWriter();				
	String conNum = request.getParameter("confirm");		//입력받은 숫자
	String authNum = (String)session.getAttribute("authNum"); 
	
	if(conNum.equals(authNum)){							//입력받은 숫자를 세션에 저장된 인증번호와 비교
		script.println("<script>");
		script.println("alert('인증되었습니다.')");			//인증되면 리셋창으로 이동
		script.println("location.href = 'password_reset.jsp'");
		script.println("</script>");
	}else{
		script.println("<script>");
		script.println("alert('인증 실패')");			//재입력
		script.println("history.back()");
		script.println("</script>");
	}
%>
</body>
</html>