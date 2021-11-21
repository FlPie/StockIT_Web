<%--
  Created by IntelliJ IDEA.
  User: SJ
  Date: 2021-11-22
  Time: 오전 7:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Title</title>
</head>
<body>
<c:import url="header.jsp"></c:import>
<div class="container">
  <div class="row">
    <div class="col-7 mx-auto">
      <a href="#" id="news1" class="card mx-auto my-3 text-decoration-none text-dark">
        <img src="img/Test_image.jpg" class="card-img-top">
        <div class="card-img-overlay">
          <h3 class="card-title">뉴스1</h3>
        </div>
      </a>
    </div>
    <div class="col-5 mx-auto">
      <div class="row">
        <a href="#" id="news2" class="card col-11 mx-auto mt-3 mb-1 text-decoration-none text-dark">
          <div class="row">
            <div class="col-6">
              <img src="./img/Test_image.jpg" class="card-img-top" alt="...">
            </div>
            <div class="col-6">
              <div class="card-body">
                <h5 class="card-title">뉴스2</h5>
              </div>
            </div>
          </div>
        </a>
        <a href="#" id="news3" class="card col-11 mx-auto my-2 text-decoration-none text-dark">
          <div class="row">
            <div class="col-6">
              <img src="./img/Test_image.jpg" class="card-img-top" alt="...">
            </div>
            <div class="col-6">
              <div class="card-body">
                <h5 class="card-title">뉴스3</h5>
              </div>
            </div>
          </div>
        </a>
        <a href="#" id="news4" class="card col-11 mx-auto my-2 text-decoration-none text-dark">
          <div class="row">
            <div class="col-6">
              <img src="./img/Test_image.jpg" class="card-img-top" alt="...">
            </div>
            <div class="col-6">
              <div class="card-body">
                <h5 class="card-title">뉴스4</h5>
              </div>
            </div>
          </div>
        </a>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-4 mt-3 mx-auto">
      <a href="#" id="news5" class="row card mb-3 text-decoration-none text-dark">
        <img src="./img/Test_image.jpg" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">뉴스5</h5>
        </div>
      </a>
    </div>
    <div class="col-4 mt-3 mx-auto">
      <a href="#" id="news6" class="row card mb-3 text-decoration-none text-dark">
        <img src="./img/Test_image.jpg" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">뉴스6</h5>
        </div>
      </a>
    </div>
    <div class="col-4 mt-3 mx-auto">
      <a href="#" id="news7" class="row card mb-3 text-decoration-none text-dark">
        <img src="./img/Test_image.jpg" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">뉴스7</h5>
        </div>
      </a>
    </div>
  </div>
  <div class="row">
    <div class="col-4 mt-3 mx-auto">
      <a href="#" id="news8" class="row card mb-3 text-decoration-none text-dark">
        <img src="./img/Test_image.jpg" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">뉴스8</h5>
        </div>
      </a>
    </div>
    <div class="col-4 mt-3 mx-auto">
      <a href="#" id="news9" class="row card mb-3 text-decoration-none text-dark">
        <img src="./img/Test_image.jpg" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">뉴스9</h5>
        </div>
      </a>
    </div>
    <div class="col-4 mt-3 mx-auto">
      <a href="#" id="news10" class="row card mb-3 text-decoration-none text-dark">
        <img src="./img/Test_image.jpg" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">뉴스10</h5>
        </div>
      </a>
    </div>
  </div>
</div>
<c:import url="footer.jsp"></c:import>
</body>
</html>
