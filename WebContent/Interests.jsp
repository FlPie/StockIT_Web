<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
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
<jsp:include page="header.jsp"/>
<%--use container-fluid for large page--%>
<%--<div class="container-fluid">--%>

<div id = "container" class ="border">
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
      <th scope="col">PER</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td><a href="#" class="text-decoration-none text-dark">삼성전자</a></td>
      <td>99999</td>
      <td>99999999</td>
      <td>99999</td>
      <td>99999</td>
      <td>9.99</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>하이닉스</td>
      <td>88888</td>
      <td>8888888</td>
      <td>88888</td>
      <td>88888</td>
      <td>8.88</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th scope="row">4</th>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th scope="row">5</th>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th scope="row">6</th>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th scope="row">7</th>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th scope="row">8</th>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th scope="row">9</th>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th scope="row">10</th>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
  </tbody>
</table>
<div class = "delete">
	<div class="d-grid gap-2 d-md-block">
  		<button class="btn btn-primary" type="button">삭제</button>
	</div>
</div>
</div>

</body>
</html>
