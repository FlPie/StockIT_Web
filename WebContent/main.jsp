<%--
  Created by IntelliJ IDEA.
  User: SJ
  Date: 2021-11-15
  Time: 오후 4:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="news.*" %>
<%@ page import="stock.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="newsdao" class="news.NewsDao" />
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
            <div class="row p-auto mt-2 mb-4 mx-2">
                <div class="col-12">
                    <div class="d-flex pt-3 justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                        <h2 class="h2">주요증시</h2>
                    </div>
                    <div class="col-11 overflow-auto" id="stock-chart-container">
                        <c:import url="stock-chart.jsp">
                            <c:param name="ticker" value="^KS11"/>
                            <c:param name="width" value="document.getElementById('stock-chart-container').clientWidth"/>
                            <c:param name="height" value="300"/>
                        </c:import>
                    </div>
                </div>
            </div>
            <%--뉴스--%>
            <div class="row p-auto mt-2 mx-2">
                <%
                    List<NewsBean> list = newsdao.getNews();
                    int size = list.size();
                    // 뉴스의 개수가 6개보다 적으면 자동으로 뉴스 크롤링
                    if(size < 6) {
                        response.sendRedirect("crawlNews.jsp");
                        return;
                    }
                    // 랜덤한 숫자 배열 생성
                    // 배열의 크기는 페이지에서 표시말 뉴스 개수
                    Random rand = new Random();
                    Set<Integer> generate = new TreeSet<>();
                    while (generate.size() < 6) {
                        generate.add(rand.nextInt(size));
                    }
                    Stack<Integer> randNum = new Stack<Integer>();
                    for(Integer i : generate) {
                        randNum.push(i);
                    }
                    NewsBean b;
                %>
                <div class="col-12 ">
                    <div class="d-flex pt-3 justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                        <h2 class="h2">뉴스</h2>
                    </div>
                    <div class="col-12" id="news-grid">
                        <div class="row">
                            <% b = list.get(randNum.pop()); %>
                            <a href="<%= b.getLink() %>" id="main-news1" class="col-7 card mb-3 mx-auto text-decoration-none text-dark">
                                <img src="<%= b.getImgPath() %>" class="card-img-top" alt="">
                                <div class="card-body">
                                    <h5 class="card-title"><%= b.getTitle() %></h5>
                                </div>
                            </a>
                            <div class="col-4 mb-3 mx-auto">
                                <% b = list.get(randNum.pop()); %>
                                <a href="<%= b.getLink() %>" id="main-news2" class="row card mb-3 text-decoration-none text-dark">
                                    <img src="<%= b.getImgPath() %>" class="card-img-top" alt="">
                                    <div class="card-body">
                                        <h5 class="card-title"><%= b.getTitle() %></h5>
                                    </div>
                                </a>
                                <% b = list.get(randNum.pop()); %>
                                <a href="<%= b.getLink() %>" id="main-news3" class="row card text-decoration-none text-dark">
                                    <img src="<%= b.getImgPath() %>" class="card-img-top" alt="">
                                    <div class="card-body">
                                        <h5 class="card-title"><%= b.getTitle() %></h5>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="row mx-auto">
                            <% b = list.get(randNum.pop()); %>
                            <a href="<%= b.getLink() %>" id="main-news4" class="card col-12 mb-3 text-decoration-none text-dark">
                                <div class="row">
                                    <div class="col-4">
                                        <img src="<%= b.getImgPath() %>" class="card-img-top" alt="">
                                    </div>
                                    <div class="col-8">
                                        <div class="card-body">
                                            <h5 class="card-title"><%= b.getTitle() %></h5>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <% b = list.get(randNum.pop()); %>
                            <a href="<%= b.getLink() %>" id="main-news5" class="card col-12 mb-3 text-decoration-none text-dark">
                                <div class="row">
                                    <div class="col-4">
                                        <img src="<%= b.getImgPath() %>" class="card-img-top" alt="">
                                    </div>
                                    <div class="col-8">
                                        <div class="card-body">
                                            <h5 class="card-title"><%= b.getTitle() %></h5>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <% b = list.get(randNum.pop()); %>
                            <a href="<%= b.getLink() %>" id="main-news6" class="card col-12 mb-3 text-decoration-none text-dark">
                                <div class="row">
                                    <div class="col-4">
                                        <img src="<%= b.getImgPath() %>" class="card-img-top" alt="">
                                    </div>
                                    <div class="col-8">
                                        <div class="card-body">
                                            <h5 class="card-title"><%= b.getTitle() %></h5>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-2 float-right mx-auto" id="sidebar">
            <div class="row mb-2 border">
                <div class="d-flex pt-3 justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                    <h4>국내주식-시가총액순</h4>
                </div>
                <table class="table table-striped">
                    <thead>
                        <th scope="col">#</th>
                        <th scope="col">주식</th>
                    </thead>
                    <%
                        StockDao stockdao = new StockDao();
                        List<StockBean> stockList = stockdao.getTopMarketCap("KS", 10);
                        StockBean stockB;
                        int count = 0;
                    %>
                    <tbody>
                        <c:forEach var="cnt1" begin="1" end="10">
                            <%
                                stockB = stockList.get(count++);
                            %>
                            <tr>
                                <th scope="row">${cnt1}</th>
                                <td>
                                    <a href="detail.jsp?ticker=<%= stockB.getSymbol()%>" class="text-decoration-none text-dark">
                                    <%= stockB.getName() %>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="row my-2 border">
                <div class="d-flex pt-3 justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                    <h4>국내주식-거래량순</h4>
                </div>
                <table class="table table-striped">
                    <thead>
                        <th scope="col">#</th>
                        <th scope="col">주식</th>
                    </thead>
                    <%
                        stockList = stockdao.getTopVolumeCap("KS", 10);
                        count = 0;
                    %>
                    <tbody>
                        <c:forEach var="cnt2" begin="1" end="10">
                            <%
                                stockB = stockList.get(count++);
                            %>
                            <tr>
                                <th scope="row">${cnt2}</th>
                                <td><a href="detail.jsp?ticker=<%=stockB.getSymbol()%>" class="text-decoration-none text-dark">
                                    <%=stockB.getName()%>
                                </a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="row my-2 border">
                <div class="d-flex pt-3 justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                    <h4>해외주식-시가총액순</h4>
                </div>
                <table class="table table-striped">
                    <thead>
                        <th scope="col">#</th>
                        <th scope="col">주식</th>
                    </thead>
                    <%
                        stockList = stockdao.getTopMarketCap("Nasdaq", 10);
                        count = 0;
                    %>
                    <tbody>
                        <c:forEach var="cnt3" begin="1" end="10">
                            <%
                                stockB = stockList.get(count++);
                            %>
                            <tr>
                                <th scope="row">${cnt3}</th>
                                <td><a href="detail.jsp?ticker=<%= stockB.getSymbol() %>" class="text-decoration-none text-dark">
                                    <%= stockB.getName() %>
                                </a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<c:import url="footer.jsp"></c:import>
</body>
</html>
