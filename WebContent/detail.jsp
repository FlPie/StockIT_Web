<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="stock.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>세부 정보</title>
    <style>
    	#button{margin:auto;}
    </style>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String symbol = request.getParameter("ticker");

StockDao stockdao = new StockDao();
List<StockBean> stockList = stockdao.search(symbol);
StockBean stockB;
stockB = stockList.get(0);
%>
<jsp:include page="header.jsp"/>
<%--use container-fluid for large page--%>
<%--<div class="container-fluid">--%>
<div class="container">
    <div class="row">
        <div class="col-8 border mx-auto" id="main-content">
<%--            주요증시--%>
            <div class="row mt-2 mb-4 mx-2">
                <div class="col-12">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                        <h3 class="h3"><%= stockB.getName() %></h3>
                        <h3 class="h3"><%= stockB.getSymbol() %></h3>
                    </div>
                    <div class="col-11 overflow-auto" id="detail-container">
              			<table class="table table-bordered" style = "text-align:center;vertical-align: middle;">
						    <tr>
						      <td scope="col" rowspan = "4" ><h3><%=stockB.getLastSale() %></h3></td>
						      <th scope="col">전일가</th>
						      <th scope="col">고가</th>
						    </tr>
						    <tr>
						      <td id="previousClose">-</td>
						      <td id="dayHigh">-</td>
						    </tr>
						    <tr>
						      <th>시가</th>
						      <th>저가</th>
						    </tr>
							<tr>			      
						      <td id="open">-</td>
						      <td id="dayLow">-</td>
						    </tr>
						</table>
                    </div>
                </div>
            </div>
                <%-- 주식 차트에서 해당 기능을 지원하고 있기 때문에 삭제하였다.%>
<%--            <div class="row mt-2 mx-2">--%>
<%--                <div class="col-12 ">--%>
<%--                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3">--%>
<%--                        <h4 class="h4">차트 변경 버튼</h4>--%>
<%--                    </div>--%>
<%--                    <div  class="col-12" id = "chart-change-button">--%>
<%--                        <div class="row mx-auto">--%>
<%--                                <div id = "button">	 <!-- 지금 보니까 주식차트가 마우스로 늘이고 줄이는게 가능하여 이런 버튼이 필요한지 의문이 들음 기능 삭제할수도 있음 -->			--%>
<%--									<button type="button" class="btn btn-outline-secondary" onclick = "#"> &nbsp; &nbsp;1일 &nbsp; &nbsp;</button>--%>
<%--									<button type="button" class="btn btn-outline-secondary" onclick = "#"> &nbsp; &nbsp;3일 &nbsp; &nbsp;</button>--%>
<%--									<button type="button" class="btn btn-outline-secondary" onclick = "#"> &nbsp; &nbsp;7일 &nbsp; &nbsp;</button>--%>
<%--									<button type="button" class="btn btn-outline-secondary" onclick = "#"> &nbsp; &nbsp;1달 &nbsp; &nbsp;</button>--%>
<%--									<button type="button" class="btn btn-outline-secondary" onclick = "#"> &nbsp; &nbsp;3달 &nbsp; &nbsp;</button>--%>
<%--									<button type="button" class="btn btn-outline-secondary" onclick = "#"> &nbsp; &nbsp;1년 &nbsp; &nbsp;</button>	--%>
<%--                                </div>--%>
<%--                          	<div class = "row">--%>
<%--                          		--%>
<%--                          	</div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <br>			--%>
            <div class="row mt-2 mb-4 mx-2">
                <div class="col-12">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                        <h4 class="h4">차트</h4>
                    </div>
                    <div class="col-11 overflow-auto" id="stock-chart-container">
                        <c:import url="stock-chart.jsp">
                            <c:param name="ticker" value="005930.KS"/>
                            <c:param name="width" value="document.getElementById('stock-chart-container').clientWidth"/>
                            <c:param name="height" value="300"/>
                        </c:import>
                    </div>
                </div>
            </div>


        </div>
        <div class="col-3 border float-right mx-auto" id="sidebar">
            <div class="row mt-3">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                    <h4>상세 정보</h4>
                </div>
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">정보</th>
                        <th scope="col">#</th>
                    </tr>
                    </thead>
                    <tbody>                      
                            <tr>
                                <th scope="row"><p>시가총액</p></th>
                                <td>
									<p id="marketCap">-</p>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><p>거래량</p></th>
                                <td>
									<p id="volume">-</p>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><p>52주 저가</p></th>
                                <td>
                                    <p id="fiftyTwoWeekLow">-</p>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><p>52주 고가</p></th>
                                <td>
                                    <p id="fiftyTwoWeekHigh">-</p>
                                </td>
                            </tr>
                          	<tr>
                                <th scope="row"><p>배당률</p></th>
                                <td>
									<p id="dividendRate">-</p>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><p>배당수익률</p></th>
                                <td>
									<p id="dividendYield">-</p>
                                </td>
                            </tr>
                           <tr>
                                <td scope="row">                              
                                	<a href="interestsAction.jsp?ticker=<%= stockB.getSymbol()%>" class="text-decoration-none text-dark">
                                   	<button type="button" class="btn btn-outline-secondary">
                                   		관심 종목 등록
                                    </button> 
                                    </a>
                                   
                                </td>
                                <td scope="row">                                
                                	<a href="interestsDeleteAction.jsp?ticker=<%= stockB.getSymbol()%>" class="text-decoration-none text-dark">
                                   	<button type="button" class="btn btn-outline-secondary">
                                   		관심 종목 해제
                                    </button> 
                                    </a>
                                   
                                </td>                                
                            </tr>
                                                                                 
                    </tbody>
                </table>
            </div>


        </div>
    </div>
</div>
<c:import url="footer.jsp"></c:import>
<script>
    let symbol = "<%=symbol%>";
    let url = "https://stock-data-yahoo-finance-alternative.p.rapidapi.com/v11/finance/quoteSummary/"+ symbol +"?modules=summaryDetail%2Cprice"
    async function getData(url) {
        let response = await fetch(url, {
            "method": "GET",
            "headers": {
                "x-rapidapi-host": "stock-data-yahoo-finance-alternative.p.rapidapi.com",
                "x-rapidapi-key": "6f2184902dmsh04c4abc73b2555ap1dd393jsn3a945887a54f"
            }
        })
        let json = await response.json();
        let data = await json.quoteSummary.result[0].summaryDetail;
        return data;
    }
    getData(url).then(data => {
        console.log(data);
        document.getElementById('previousClose').innerHTML = data.previousClose.fmt;
        document.getElementById('open').innerHTML = data.open.fmt;
        document.getElementById('dayLow').innerHTML = data.dayLow.fmt;
        document.getElementById('dayHigh').innerHTML = data.dayHigh.fmt;
        document.getElementById('marketCap').innerHTML = data.marketCap.fmt;
        document.getElementById('volume').innerHTML = data.volume.fmt;
        document.getElementById('dividendRate').innerHTML = data.dividendRate.fmt;
        document.getElementById('dividendYield').innerHTML = data.dividendYield.fmt;
        document.getElementById('fiftyTwoWeekLow').innerHTML = data.fiftyTwoWeekLow.fmt;
        document.getElementById('fiftyTwoWeekHigh').innerHTML = data.fiftyTwoWeekHigh.fmt;
    });
</script>
</body>
</html>