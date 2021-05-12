<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>main</title>
<link rel="stylesheet" href="resources/css/login.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/Js/bootstrap.min.js">

</head>
<body>
	<h2>현재 고객님의 소중한 물건 배송현황은?</h2>
	<c:forEach var="list" items="${list}">
		<h3>제품번호${list.orderNo}는 ${list.orderStatus} 상태 입니다.</h3>
		<a>해당제품 송장번호는${list.deliveryNum}입니다.</a>
	</c:forEach>
</body>
</html>