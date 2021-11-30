<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import = "user.UserDAO" %>
<%@ page import="stock.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import = "java.io.PrintWriter" %>
<html>

<head>
    <title>관심종목</title>
    <style type="text/css">
    .page{
    	text-align:center;
    	margin:0 auto;
    }
    #container{
    			margin-left: auto;
                margin-right: auto;
                width: 80%;
                height: 37%;
                position: relative;
    }
    
    
    </style>
</head>
<body>

<%!
	int count = 0;
	int i;
	Connection conn = null;
	PreparedStatement pstmt= null;
	String sql = null;
	ResultSet rs = null;
	ArrayList<String> SymbolList = new ArrayList<String>();
%>
<%
	String id = (String)session.getAttribute("id");	//아이디로 구분할것
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/STOCKIT?serverTimezone=UTC";
		conn = DriverManager.getConnection(url,"root","0000");
	
		String SQL = "SELECT symbol FROM interest WHERE userid = ?";
	
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, id);						
		rs = pstmt.executeQuery();
		
		while(rs.next()){
            SymbolList.add(rs.getString("Symbol"));		//종목코드들을 담은 어레이리스트
			}	
	}catch(Exception e){
		out.println("DB 연동 오류 입니다.:" +e.getMessage());	
		}
	
	count = SymbolList.size(); //리스트 내부 값의 개수
	
%>
<jsp:include page="header.jsp"/>
<%--use container-fluid for large page--%>
<%--<div class="container-fluid">--%>

<div id = "container" class ="border p-3 shadow">
<div class =  "title">
	<h3>관심 종목</h3>
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
      <th scope="col">시가총액</th>
    </tr>
  </thead>

<%
    StockDao stockdao = new StockDao();
    StockBean stockB;
	List<StockBean> interestList;
                                        						
%>   
  <tbody>
  	<% for(i=0;i < count;i++){
  		interestList = stockdao.search(SymbolList.get(i));
        stockB = interestList.get(0);
 	%>  
 		<tr>
        	<th scope="row"><%=i+1 %></th>
            <td><a href="detail.jsp?ticker=<%= stockB.getSymbol()%>" class="text-decoration-none text-dark"><%= stockB.getName() %></a></td>
            <td><%= stockB.getLastSale() %></td>
            <td><%= stockB.getVolume()%></td>
			<td>고가</td>
			<td>저가</td>								<!-- 고가 저가는 아직 DB에 추가되지 않음 -->
			<td><%= stockB.getMarketCap()%></td>
        </tr>
	<%
  	}
  	
  	SymbolList.clear();
    %> 
 </tbody>
</table>


</div>
<c:import url="footer.jsp"></c:import>
</body>
</html>
