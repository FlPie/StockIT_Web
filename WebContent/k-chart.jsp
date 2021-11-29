<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="stock.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>국내 주식</title>
    <style type="text/css">
    .page{
    	text-align:center;
    	margin:0 auto;
    }
    .container{
    	margin:0 auto;
    }
    
    
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<%--use container-fluid for large page--%>
<%--<div class="container-fluid">--%>

<div class = "container">
<div class =  "title">
	<h3>국내 주식 - 시가 총액 순위</h3>
</div>
<table class="table table-striped">
  <thead>              
    <tr>
      <th scope="col">순위</th>
      <th scope="col">종목</th>
      <th scope="col">현가</th>
      <th scope="col">거래량</th>
      <th scope="col">고가</th>
      <th scope="col">저가</th>
      <th scope="col">시총</th>
    </tr>
  </thead>
<%
                       	StockDao stockdao = new StockDao();
                        List<StockBean> stockList = stockdao.getTopMarketCap("KS", 15);
                        StockBean stockB;
                        int count = 0;
                        int a = 1;
						
%>   
  <tbody>
  	<c:forEach var="cnt1" begin= "1" end="15">
     <%stockB = stockList.get(count++);%>
                            <tr>
                                <th scope="row">${cnt1}</th>
                                <td>
                                    <a href="detail.jsp?ticker=<%= stockB.getSymbol()%>" class="text-decoration-none text-dark">
                                    <%= stockB.getName() %>
                                    </a>
                                </td>
                             
						   
						      <td><%= stockB.getLastSale() %></td>
						      <td><%= stockB.getVolume()%></td>
						      <td>고가</td>
						      <td>저가</td>								<!-- 고가 저가는 아직 DB에 추가되지 않음 -->
						      <td><%= stockB.getMarketCap()%></td>
              				</tr>
  	</c:forEach>
  </tbody>
</table>
<div class = "page">
<nav aria-label="Page navigation example">
  <ul class="pagination">
    																	<!-- 페이징 기능 구현 필요함! -->
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link" href="#">4</a></li>
    <li class="page-item"><a class="page-link" href="#">5</a></li>
    <li class="page-item"><a class="page-link" href="#">6</a></li>
    <li class="page-item"><a class="page-link" href="#">7</a></li>
    <li class="page-item"><a class="page-link" href="#">8</a></li>
    <li class="page-item"><a class="page-link" href="#">9</a></li>
    <li class="page-item"><a class="page-link" href="#">10</a></li>
  </ul>
</nav>
</div>
</div>

</body>
</html>
