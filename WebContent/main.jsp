<%--
  Created by IntelliJ IDEA.
  User: SJ
  Date: 2021-11-15
  Time: 오후 4:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<%--use container-fluid for large page--%>
<%--<div class="container-fluid">--%>
<div class="container">
    <div class="row">
        <div class="col-9 border mx-auto" id="main-content">
<%--            주요증시--%>
            <div class="row mt-2 mb-4 mx-2">
                <div class="col-12">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                        <h2 class="h2">주요증시</h2>
                    </div>
                    <div class="col-11 overflow-auto" id="stock-chart-container">
                        <c:import url="stock-chart.jsp">
                            <c:param name="ticker" value="05930.KS"/>
                            <c:param name="width" value="document.getElementById('stock-chart-container').clientWidth"/>
                            <c:param name="height" value="300"/>
                        </c:import>
                    </div>
                </div>
            </div>
<%--            뉴스--%>
<%--            todo: 뉴스 데이터 서버에서 받아와서 처리하도록 변경--%>
            <div class="row mt-2 mx-2">
                <div class="col-12 ">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                        <h2 class="h2">뉴스</h2>
                    </div>
                    <div class="col-12" id="news-grid">
                        <div class="row">
                            <a href="#" id="main-news1" class="col-7 card mb-3 mx-auto text-decoration-none text-dark">
                                <img src="./img/Test_image.jpg" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">뉴스1</h5>
                                </div>
                            </a>
                            <div class="col-4 mb-3 mx-auto">
                                <a href="#" id="main-news2" class="row card mb-3 text-decoration-none text-dark">
                                    <img src="./img/Test_image.jpg" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">뉴스2</h5>
                                    </div>
                                </a>
                                <a href="#" id="main-news3" class="row card text-decoration-none text-dark">
                                    <img src="./img/Test_image.jpg" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">뉴스3</h5>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="row mx-auto">
                            <a href="#" id="main-news4" class="card col-12 mb-3 text-decoration-none text-dark">
                                <div class="row">
                                    <div class="col-4">
                                        <img src="./img/Test_image.jpg" class="card-img-top" alt="...">
                                    </div>
                                    <div class="col-8">
                                        <div class="card-body">
                                            <h5 class="card-title">뉴스4</h5>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <a href="#" id="main-news5" class="card col-12 mb-3 text-decoration-none text-dark">
                                <div class="row">
                                    <div class="col-4">
                                        <img src="./img/Test_image.jpg" class="card-img-top" alt="...">
                                    </div>
                                    <div class="col-8">
                                        <div class="card-body">
                                            <h5 class="card-title">뉴스5</h5>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <a href="#" id="main-news6" class="card col-12 mb-3 text-decoration-none text-dark">
                                <div class="row">
                                    <div class="col-4">
                                        <img src="./img/Test_image.jpg" class="card-img-top" alt="...">
                                    </div>
                                    <div class="col-8">
                                        <div class="card-body">
                                            <h5 class="card-title">뉴스6</h5>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<%--        todo: 주식 테이블 데이터 서버에서 받아와서 처리하도록 변경--%>
        <div class="col-2 border float-right mx-auto" id="sidebar">
            <div class="row mt-2">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                    <h4>인기항목</h4>
                </div>
                <table class="table table-striped">
                    <thead>
                        <th scope="col">#</th>
                        <th scope="col">주식</th>
                    </thead>
                    <tbody>
                        <c:forEach var="cnt1" begin="1" end="10">
                            <tr>
                                <th scope="row">${cnt1}</th>
                                <td>
                                    <a href="#" class="text-decoration-none text-dark">
                                    삼성전자
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="row mt-2">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                    <h4>급상승</h4>
                </div>
                <table class="table table-striped">
                    <thead>
                        <th scope="col">#</th>
                        <th scope="col">주식</th>
                    </thead>
                    <tbody>
                        <c:forEach var="cnt2" begin="1" end="10">
                            <tr>
                                <th scope="row">${cnt2}</th>
                                <td><a href="#" class="text-decoration-none text-dark">
                                    삼성전자
                                </a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="row mt-2">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                    <h4>거래량</h4>
                </div>
                <table class="table table-striped">
                    <thead>
                        <th scope="col">#</th>
                        <th scope="col">주식</th>
                    </thead>
                    <tbody>
                        <c:forEach var="cnt3" begin="1" end="10">
                            <tr>
                                <th scope="row">${cnt3}</th>
                                <td><a href="#" class="text-decoration-none text-dark">
                                    삼성전자
                                </a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<footer>
    <br><h4>this is end of the page</h4><br>
</footer>
</body>
</html>
