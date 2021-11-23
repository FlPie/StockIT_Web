<%--
  Created by IntelliJ IDEA.
  User: SJ
  Date: 2021-11-22
  Time: 오후 8:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ page import="news.NewsDao" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    NewsDao d = new NewsDao();
    d.crawlAndInsertNews();
%>
<%--
todo: 단순히 뉴스페이지로 돌아가는 것이 아니라 호출한 페이지로 이동하도록 수정하면 좋음
      구현이 정 어려우면 뉴스 크롤링이 필요한 페이지별로 따로따로 크롤링 페이지를 생성
--%>
<c:redirect url="news.jsp"/>
</body>
</html>
