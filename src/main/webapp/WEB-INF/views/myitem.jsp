<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<body>
<h1>현재 고객님의 소중한 물건 배송현황은?</h1>
<c:forEach var="list" items="${list}">
<h2>제품번호${list.orderNo}는 ${list.orderStatus} 상태 입니다.</h2>
해당제품 송장번호는${list.deliveryNum}입니다.
</c:forEach>
</body>