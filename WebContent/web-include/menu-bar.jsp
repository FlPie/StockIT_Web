<%--
  Created by IntelliJ IDEA.
  User: SJ
  Date: 2021-11-09
  Time: 오후 5:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="menu-bar_style.css">
    <script src="menu-bar_script.js" defer></script>
</head>
<body>
<div class="menu-bar">
    <a href="#" class="link">메인페이지</a>
    <a href="#" class="link">관심종목</a>
    <div class="dropdown" data-dropdown>
        <button class="link" data-dropdown-button>주식</button>
        <div class="dropdown-menu information-grid">
            <div class="dropdown-links">
                <a href="#" class="link">국내주식</a>
                <a href="#" class="link">해외주식</a>
            </div>
        </div>
    </div>
    <a href="#" class="link">뉴스</a>
</div>
</body>
</html>
