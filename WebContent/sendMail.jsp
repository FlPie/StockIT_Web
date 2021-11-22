<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.mail.internet.*"%>
<%@ page language="java" import="java.sql.*"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@ page import = "java.io.PrintWriter" %>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@ page import = "user.UserDAO" %>
<%@page import="mail.SMTPAuthenticator"%>

<%! public int getRandom(){
	int random = 0;
	random = (int)Math.floor((Math.random()*9999-1000+1)) + 1000;
	return random;
	}
%> 
<%
request.setCharacterEncoding("utf-8");
//현재는 지메일로만 메일 보낼수있음
int randNum = getRandom();
String certificationNum = Integer.toString(randNum);
String host = "http://localhost:8005/proj1/"; //사이트 주소 
String from = "관리자 메일";	//메일을 보낼 관리자의 메일 
String to = (String)session.getAttribute("InpEmail");;//메일을 받을 이메일 계정 -> 입력한 이메일
String subject = "비밀번호 변경을 위한 인증번호를 확인하세요"; //메일 제목
String content = certificationNum; 						  //메일 내용 일단 1111로 설정해놓음
session.setAttribute("authNum",content);	      //보낸 인증번호를 세션에 저장
 
Properties p = new Properties(); // 정보를 담을 객체

p.put("mail.smtp.user", from);			  //메일을 보내는 주소
p.put("mail.smtp.host","smtp.gmail.com"); // STMP
p.put("mail.smtp.ssl.protocols", "TLSv1.2"); 
p.put("mail.smtp.port", "465");
p.put("mail.smtp.starttls.enable", "true");
p.put("mail.smtp.auth", "true");
p.put("mail.smtp.debug", "true");
p.put("mail.smtp.socketFactory.port", "465");
p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
p.put("mail.smtp.socketFactory.fallback", "false");
// SMTP 서버에 접속하기 위한 정보들
 
try{
    Authenticator auth = new SMTPAuthenticator();
    Session ses = Session.getInstance(p, auth);
     
    ses.setDebug(true);
     
    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
    msg.setSubject(subject); // 제목
     
    Address fromAddr = new InternetAddress(from);
    msg.setFrom(fromAddr); // 보내는 사람
     
    Address toAddr = new InternetAddress(to);
    msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
     
    msg.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩
     
    Transport.send(msg); // 전송
} catch(Exception e){
    e.printStackTrace();
    out.println("<script>alert('메일 발송 실패!');history.back();</script>");
    // 오류 발생시 뒤로 돌아가도록
    return;
}
 
out.println("<script>alert('메일 발송 성공!');history.back();</script>");
// 성공 시
%>