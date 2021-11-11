<%--
  Created by IntelliJ IDEA.
  User: SJ
  Date: 2021-11-10
  Time: 오전 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<%--타이틀바--%>
<header class="py-3 mb-3 border-bottom">
    <div class="container-fluid d-grid gap-3 align-items-center align-middle" style="grid-template-columns: 100px 2fr 1fr 50px;">
<%--        todo: link to 메인페이지-->--%>
        <a href="#" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
            <b style="font-size: 20px; font-family: Arial">Stock It</b>
        </a>
        <div class="d-flex align-items-center align-middle">
<%--            todo: link to 검색페이지--%>
            <form class="w-100 me-3">
                <input type="search" class="form-control" placeholder="Search..." aria-label="Search">
            </form>
        </div>
        <div><%-- white bar --%></div>
        <div class="flex-shrink-0 align-item-center align-middle">
<%--            todo: link to 마이페이지-->--%>
            <a href="#" class="d-block link-dark text-decoration-none" id="main-page-user" aria-expanded="false">
                <img src="./icons/NicePng_chen-png_3026464.png" alt="User" class="rounded-circle" width="32" height="32">
            </a>
        </div>
    </div>
</header>
<%--메뉴바--%>
<div class="m-4">
    <nav class="navbar navbar-expand-sm navbar-light bg-light">
        <div class="container-fluid">
            <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div id="navbarCollapse" class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="nav-item">
<%--                        todo: link to 메인페이지-->--%>
                        <a href="#" class="nav-link">메인페이지</a>
                    </li>
                    <li class="nav-item">
<%--                        todo: link to 메인페이지-->--%>
                        <a href="#" class="nav-link">관심종목</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">주식</a>
                        <div class="dropdown-menu">
<%--                            todo: link to 국내주식-->--%>
                            <a href="#" class="dropdown-item">국내주식</a>
<%--                            todo: link to 해외주식-->--%>
                            <a href="#" class="dropdown-item">해외주식</a>
                        </div>
                    </li>
                    <li class="nav-item">
<%--                        todo: link to 뉴스-->--%>
                        <a href="#" class="nav-link">뉴스</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>
</body>
</html>