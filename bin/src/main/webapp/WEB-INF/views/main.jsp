<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
response.setHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setDateHeader("Expires", 0L);
%> <!-- 뒤로가기 캐시 삭제 -->
    <link rel="stylesheet" href="resources/css/main.css"> 
	<section class="main_slides">
        <h2 class="hidden">main_slides</h2>
        <ul>
            <li class="slide slide1">
                <div class="container slide_contents">
                    <div class="contents jumbotron">
                        <h2>SME쇼핑몰</h2>
                        <h3>환영합니다</h3>
                        <p>저희가 코트의 중심입니다!</p>
                    </div>
                </div>
            </li>
            <li class="slide slide2">
                <div class="container slide_contents">
                    <div class="contents jumbotron">
                        <h2>코트추천</h2>
                        <h3>SME의 자신작 보러가기</h3>
                        <p>코트란 이런 것이다..</p>
                        <div class="price_order">
                            <span class="price">Price : 9193000원 부터..</span>
                            <a class="order_now" href="detail.do?product_code='SHY001'">Order now</a>
                        </div>
                    </div>
                </div>
            </li>
            <li class="slide slide3">
                <div class="container slide_contents">
                    <div class="contents jumbotron">
                        <h2>아직공백임다</h2>
                        <h3>여기는 없소요</h3>
                        <p>추가할께요..</p>
                    </div>
                </div>
            </li>
        </ul>
    </section>
    
    <main class="container">
    <br>
    <br>
    <br>
        <section class="new_arrivals">
            <h2 class="content_title"><span>멋진</span> 상품들</h2>
            <p class="content_desc">SME의 자랑 코트들입니다!</p>
            <ul class="new_arrivals_list row">
             <c:forEach var="list" items="${list}" varStatus="sts">
                <li id="product_02" class="col-md-3">
                    <div class="list_contents">
                        <div class="default">
                            <img src="resources/images/coat_0${sts.index}.jpg" alt="코트">       
                            <h3>${list.product_name}</h3> 
                            <h4><fmt:formatNumber pattern="#,###" value="${list.product_price}" />부터..</h4>
                        </div>
                        <div class="hover">
                            <p>sizes :<span class="size">s - m - l - xl - f</span></p>
                            <p class="color">
                                <span class="red">red</span>
                                <span class="darkmagenta">darkmagenta</span>
                                <span class="lightskyblue">lightskyblue</span>
                                <span class="lightgreen">lightgreen</span>
                            </p>
                            <hr/>
                            <ul>
                                <li><a href="detail.do?product_code=${list.product_code}" class="sprites share">제품자세히보기</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
              </c:forEach>
            </ul>
        </section>
