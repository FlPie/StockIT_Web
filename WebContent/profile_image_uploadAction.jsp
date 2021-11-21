<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

				String uploadDir = this.getClass().getResource("").getPath();
				uploadDir = uploadDir.substring(1,uploadDir.indexOf(".metadata"))+"proj1/src/main/webapp/profile_image";
				String id = (String)session.getAttribute("id");
				
				int maxSize = 1024 * 1024 * 100;
				String encoding = "UTF-8";
				MultipartRequest multipartRequest = new MultipartRequest(request, uploadDir, maxSize, encoding,	new DefaultFileRenamePolicy());
		
				String fileName = multipartRequest.getOriginalFileName("file");
				String fileRealName = multipartRequest.getFilesystemName("file");	
				UserDAO user = new UserDAO();
				user.profile_image_upload(id, fileName, fileRealName);
				out.println("<script>");
				out.println("alert('프로필사진이 변경되었습니다.')");			//마이 페이지로 이동
				out.println("location.href='mypage.jsp'");
				out.println("</script>");

	%>
</body>
</html>