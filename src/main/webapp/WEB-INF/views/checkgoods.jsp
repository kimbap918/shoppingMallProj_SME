<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.wrap{
	
	background-image : url('backg.jpg');
	position : relative;
  	min-height: 100vh;
  	text-align: center;
}

.subject{
	padding-top : 10%;
}
</style>
</head>
<body>
<div class="wrap">
<div class="subject">
	<h2>배송조회</h2>
	<form action="myitem.do" method="post">
	<input type="text" name="orderNo" placeholder="주문번호를 입력하세요">
	<input type="submit" value="확인하기">
	</form>
	</div>
	</div>
</body>
</html>