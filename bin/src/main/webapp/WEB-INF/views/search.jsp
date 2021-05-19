<%@ page language="java" contentType="text/html; charset= UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<div class="container">
	<h2>상품목록</h2>
	<table class="table">
		<thead>
			<tr>
				<th class="text-center">재품이름</th>
				<th class="text-center">사이즈</th>
				<th class="text-center">가격</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${list}">
				<tr>
					<td><img src="resources/images/close/${list.product_code}.jpg"
						width="120px" height="110px"></td>
					<td align="center"><a
						href="detail.do?product_code=${list.product_code}">${list.product_name}</a><br>
					</td>
					<td class="text-center">${list.prodName}</td>
					<td><fmt:formatNumber value="${list.product_price}"
							pattern="###,###,###" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>