<%--
  Created by IntelliJ IDEA.
  User: SJ
  Date: 2021-11-22
  Time: 오전 7:11
  To change this template use File | Settings | File Templates.
--%>
<%-- todo: - 이미지 사이즈에 따라 뉴스 카드들의 사이즈가 달라지는 것 수정
           - 현재는 네이버 금융의 뉴스 > 주요뉴스만을 크롤링 해오는 상황.
           - 추가적으로 다른 사이트의 뉴스를 크롤링 하는 기능을 추가할지 고민해봐야 함. --%>
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
  // 필요한 뉴스의 개수가 부족한 경우 자동적으로 뉴스를 크롤링
  if(size < 10) {
    response.sendRedirect("crawlNews.jsp");
    return;
  }
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
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
      <h2 class="h2">뉴스</h2>
      <a href="crawlNews.jsp" class="btn btn-outline-primary">뉴스 업데이트</a>
    </div>
  </div>
  <div class="row">
    <div class="col-7 mx-auto">
      <% b = list.get(randNum.pop()); %>
      <a href="<%= b.getLink() %>" id="news1" class="card mx-auto my-3 text-decoration-none text-dark">
        <img src="<%= b.getImgPath() %>" class="card-img-top">
        <%-- todo: 이미지에 따라 제목이 잘 보이지 않는 문제 해결 --%>
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
              <img src="<%= b.getImgPath() %>" class="card-img-top" alt="">
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
              <img src="<%= b.getImgPath() %>" class="card-img-top" alt="">
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
              <img src="<%= b.getImgPath() %>" class="card-img-top" alt="">
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
        <img src="<%=b.getImgPath()%>" class="card-img-top" alt="">
        <div class="card-body">
          <h5 class="card-title"><%=b.getTitle()%></h5>
        </div>
      </a>
    </div>
    <div class="col-4 mt-3 mx-auto">
      <% b = list.get(randNum.pop()); %>
      <a href="<%=b.getLink()%>" id="news6" class="row card mb-3 text-decoration-none text-dark">
        <img src="<%=b.getImgPath()%>" class="card-img-top" alt="">
        <div class="card-body">
          <h5 class="card-title"><%=b.getTitle()%></h5>
        </div>
      </a>
    </div>
    <div class="col-4 mt-3 mx-auto">
      <% b = list.get(randNum.pop()); %>
      <a href="<%=b.getLink()%>" id="news7" class="row card mb-3 text-decoration-none text-dark">
        <img src="<%=b.getImgPath()%>" class="card-img-top" alt="">
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
        <img src="<%=b.getImgPath()%>" class="card-img-top" alt="">
        <div class="card-body">
          <h5 class="card-title"><%=b.getTitle()%></h5>
        </div>
      </a>
    </div>
    <div class="col-4 mt-3 mx-auto">
      <% b = list.get(randNum.pop()); %>
      <a href="<%=b.getLink()%>" id="news9" class="row card mb-3 text-decoration-none text-dark">
        <img src="<%=b.getImgPath()%>" class="card-img-top" alt="">
        <div class="card-body">
          <h5 class="card-title"><%=b.getTitle()%></h5>
        </div>
      </a>
    </div>
    <div class="col-4 mt-3 mx-auto">
      <% b = list.get(randNum.pop()); %>
      <a href="<%=b.getLink()%>" id="news10" class="row card mb-3 text-decoration-none text-dark">
        <img src="<%=b.getImgPath()%>" class="card-img-top" alt="">
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
