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
<%
   StockDao stockdao = new StockDao();
   List<StockBean> stockList;
   int control;
   if(request.getParameter("control") == null){	
		control = 1;
   }else{
	   control = Integer.parseInt(request.getParameter("control"));
   }
   
   if(control == 1){ //control 1이면 시가총액 순 차트 출력, 2면 거래량 순 차트 출력
	   stockList = stockdao.getTopMarketCap("KS", 151); //미리 150개의 주식 정보를 리스트로 받아둠 - 시가총액 순으로
   }else{		
	   stockList = stockdao.getTopVolumeCap("KS", 151); //미리 150개의 주식 정보를 리스트로 받아둠 - 거래량 순으로
   }
   StockBean stockB;
%>
<body>
<jsp:include page="header.jsp"/>
<%--use container-fluid for large page--%>
<%--<div class="container-fluid">--%>

<div class = "container shadow p-3">
<div class =  "title">
<%if(control == 1){ %>
	<h3>국내 주식 - 시가 총액 순위</h3>
<%}else{ %>
	<h3>국내 주식 - 거래량 순위</h3>
<%} %>	
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
   int start;	//시작점
   int end;		//끝점
   
   if(request.getParameter("begin") == null){	//만약 받은게 없으면 자동으로 1~15
		start = 1;end = 15;
	}else{
	 	start = Integer.parseInt(request.getParameter("begin"));	//받은 begin과 end 값으로 구간을 정해줌
	 	end = Integer.parseInt(request.getParameter("end"));
	}
   int count = start-1;
%>   
  <tbody>
  	<c:forEach var="cnt1" begin= "<%=start %>" end="<%=end %>">		<!-- 정해진 구간값으로 반복문을 돌려서 리스트를 특정구간을 순회함 -->
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
    																	
   	<li class="page-item"><a class="page-link" href="k-chart.jsp?begin=1&end=15&control=<%=control%>">1</a></li>		
    <li class="page-item"><a class="page-link" href="k-chart.jsp?begin=16&end=30&control=<%=control%>">2</a></li>
    <li class="page-item"><a class="page-link" href="k-chart.jsp?begin=31&end=45&control=<%=control%>">3</a></li>
    <li class="page-item"><a class="page-link" href="k-chart.jsp?begin=46&end=60&control=<%=control%>">4</a></li>
    <li class="page-item"><a class="page-link" href="k-chart.jsp?begin=61&end=75&control=<%=control%>">5</a></li>
    <li class="page-item"><a class="page-link" href="k-chart.jsp?begin=76&end=90&control=<%=control%>">6</a></li>
    <li class="page-item"><a class="page-link" href="k-chart.jsp?begin=91&end=105&control=<%=control%>">7</a></li>
    <li class="page-item"><a class="page-link" href="k-chart.jsp?begin=106&end=120&control=<%=control%>">8</a></li>
    <li class="page-item"><a class="page-link" href="k-chart.jsp?begin=120&end=135&control=<%=control%>">9</a></li>
    <li class="page-item"><a class="page-link" href="k-chart.jsp?begin=136&end=150&control=<%=control%>">10</a></li>
    <li class="page-item"><a class="page-link" href="k-chart.jsp?control=1">시가총액 순</a></li>
    <li class="page-item"><a class="page-link" href="k-chart.jsp?control=2">거래량 순</a></li>
  </ul>
</nav>
</div>
</div>

<c:import url="footer.jsp"></c:import>
</body>
</html>
