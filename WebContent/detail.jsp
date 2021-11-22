<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
    
    <style>
    	#button{margin:auto;}
    </style>
</head>
<body>
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
                        <h3 class="h3">삼성전자</h3>
                        <h3 class="h3">코스피</h3>
                    </div>
                    <div class="col-11 overflow-auto" id="detail-container">
              			<table class="table table-bordered" style = "text-align:center;vertical-align: middle;">
						    <tr>
						      <td scope="col" rowspan = "4" ><h3>70000</h3></td>
						      <th scope="col">전일가</th>
						      <th scope="col">고가</th>
						      <th scope="col">상한가</th>
						    </tr>		 
						    <tr>
						      <td>00000</td>
						      <td>00000</td>
						      <td>00000</td>
						    </tr>
						    <tr>
						      <th>시가</th>
						      <th>저가</th>
						      <th>하한가</th>
						    </tr>
							<tr>			      
						      <td>00000</td>
						      <td>00000</td>
						      <td>00000</td>
						    </tr>
						</table>
                    </div>
                </div>
            </div>
            <div class="row mt-2 mx-2">
                <div class="col-12 ">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3">
                        <h4 class="h4">차트 변경 버튼</h4>
                    </div>
                    <div  class="col-12" id = "chart-change-button">
                        <div class="row mx-auto">
                                <div id = "button">				
									<button type="button" class="btn btn-outline-secondary" onclick = "#"> &nbsp; &nbsp;1일 &nbsp; &nbsp;</button>
									<button type="button" class="btn btn-outline-secondary" onclick = "#"> &nbsp; &nbsp;3일 &nbsp; &nbsp;</button>
									<button type="button" class="btn btn-outline-secondary" onclick = "#"> &nbsp; &nbsp;7일 &nbsp; &nbsp;</button>
									<button type="button" class="btn btn-outline-secondary" onclick = "#"> &nbsp; &nbsp;1달 &nbsp; &nbsp;</button>
									<button type="button" class="btn btn-outline-secondary" onclick = "#"> &nbsp; &nbsp;3달 &nbsp; &nbsp;</button>
									<button type="button" class="btn btn-outline-secondary" onclick = "#"> &nbsp; &nbsp;1년 &nbsp; &nbsp;</button>	
                                </div>
                          	<div class = "row">
                          		
                          	</div>
                        </div>
                    </div>
                </div>
            </div>
            <br>			
            <div class="row mt-2 mb-4 mx-2">
                <div class="col-12">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                        <h4 class="h4">차트</h4>
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
									<p>446539700000000</p>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><p>시총 순위</p></th>
                                <td>
									<p>1위</p>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><p>상장주식수</p></th>
                                <td>
									<p>5969782550</p>
                                </td>
                            </tr>
                          	<tr>
                                <th scope="row"><p>aaa</p></th>
                                <td>
									<p>0000</p>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><p>bbb</p></th>
                                <td>
									<p>0000</p>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><p>ccc</p></th>
                                <td>
									<p>0000</p>
                                </td>
                            </tr>                                                     
                    </tbody>
                </table>
            </div>


        </div>
    </div>
</div>
<footer>
    <br><br>
</footer>
</body>
</html>