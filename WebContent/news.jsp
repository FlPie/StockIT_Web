<%--
  Created by IntelliJ IDEA.
  User: SJ
  Date: 2021-11-22
  Time: 오전 7:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="news.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="newsdao" class="news.NewsDao" />
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Title</title>
</head>
<body>
<%
  List<NewsBean> list = newsdao.getNews();
  int size = list.size();

  // 랜덤한 숫자 배열 생성
  // 배열의 크기는 페이지에서 표시말 뉴스 개수
  Random rand = new Random();
  Set<Integer> generate = new TreeSet<>();
  while (generate.size() < 10) {
    generate.add(rand.nextInt(size));
  }
  Stack<Integer> randNum = new Stack<Integer>();
  for(Integer i : generate) {
    randNum.push(i);
  }
  NewsBean b;
%>
<c:import url="header.jsp"/>
<div class="container">
  <div class="row">
    <div class="col-7 mx-auto">
      <% b = list.get(randNum.pop()); %>
      <a href="<%= b.getLink() %>" id="news1" class="card mx-auto my-3 text-decoration-none text-dark">
        <img src="<%= b.getImgPath() %>" class="card-img-top">
        <div class="card-img-overlay">
          <h3 class="card-title"><%= b.getTitle() %></h3>
        </div>
      </a>
    </div>
    <div class="col-5 mx-auto">
      <div class="row">
        <% b = list.get(randNum.pop()); %>
        <a href="<%= b.getLink() %>" id="news2" class="card col-11 mx-auto mt-3 mb-1 text-decoration-none text-dark">
          <div class="row">
            <div class="col-6">
              <img src="<%= b.getImgPath() %>" class="card-img-top">
            </div>
            <div class="col-6">
              <div class="card-body">
                <h5 class="card-title"><%= b.getTitle() %></h5>
              </div>
            </div>
          </div>
        </a>
        <% b = list.get(randNum.pop()); %>
        <a href="<%= b.getLink() %>" id="news3" class="card col-11 mx-auto my-2 text-decoration-none text-dark">
          <div class="row">
            <div class="col-6">
              <img src="<%= b.getImgPath() %>" class="card-img-top" alt="...">
            </div>
            <div class="col-6">
              <div class="card-body">
                <h5 class="card-title"><%= b.getTitle() %></h5>
              </div>
            </div>
          </div>
        </a>
        <% b = list.get(randNum.pop()); %>
        <a href="<%= b.getLink() %>" id="news4" class="card col-11 mx-auto my-2 text-decoration-none text-dark">
          <div class="row">
            <div class="col-6">
              <img src="<%= b.getImgPath() %>" class="card-img-top" alt="...">
            </div>
            <div class="col-6">
              <div class="card-body">
                <h5 class="card-title"><%=b.getTitle()%></h5>
              </div>
            </div>
          </div>
        </a>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-4 mt-3 mx-auto">
      <% b = list.get(randNum.pop()); %>
      <a href="<%=b.getLink()%>" id="news5" class="row card mb-3 text-decoration-none text-dark">
        <img src="<%=b.getImgPath()%>" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title"><%=b.getTitle()%></h5>
        </div>
      </a>
    </div>
    <div class="col-4 mt-3 mx-auto">
      <% b = list.get(randNum.pop()); %>
      <a href="<%=b.getLink()%>" id="news6" class="row card mb-3 text-decoration-none text-dark">
        <img src="<%=b.getImgPath()%>" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title"><%=b.getTitle()%></h5>
        </div>
      </a>
    </div>
    <div class="col-4 mt-3 mx-auto">
      <% b = list.get(randNum.pop()); %>
      <a href="<%=b.getLink()%>" id="news7" class="row card mb-3 text-decoration-none text-dark">
        <img src="<%=b.getImgPath()%>" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title"><%=b.getTitle()%></h5>
        </div>
      </a>
    </div>
  </div>
  <div class="row">
    <div class="col-4 mt-3 mx-auto">
      <% b = list.get(randNum.pop()); %>
      <a href="<%=b.getLink()%>" id="news8" class="row card mb-3 text-decoration-none text-dark">
        <img src="<%=b.getImgPath()%>" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title"><%=b.getTitle()%></h5>
        </div>
      </a>
    </div>
    <div class="col-4 mt-3 mx-auto">
      <% b = list.get(randNum.pop()); %>
      <a href="<%=b.getLink()%>" id="news9" class="row card mb-3 text-decoration-none text-dark">
        <img src="<%=b.getImgPath()%>" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title"><%=b.getTitle()%></h5>
        </div>
      </a>
    </div>
    <div class="col-4 mt-3 mx-auto">
      <% b = list.get(randNum.pop()); %>
      <a href="<%=b.getLink()%>" id="news10" class="row card mb-3 text-decoration-none text-dark">
        <img src="<%=b.getImgPath()%>" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title"><%=b.getTitle()%></h5>
        </div>
      </a>
    </div>
  </div>
</div>
<c:import url="footer.jsp"></c:import>
</body>
</html>
