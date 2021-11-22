<%--
  Created by IntelliJ IDEA.
  User: SJ
  Date: 2021-11-22
  Time: 오후 8:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ page import="news.NewsDao" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    NewsDao d = new NewsDao();
    d.crawlAndInsertNews();
%>
</body>
</html>
