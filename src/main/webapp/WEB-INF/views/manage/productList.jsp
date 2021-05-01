<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원 목록</title>
	<link rel="stylesheet" href="resources/css/bootstrap.css">
</head>
<body>
<article>
	<div class="container">
		<h2>product list</h2>
		<br>
		<form action="productList.do" method="get">
		<label for="condition">검색조건</label>
		<select name="condition" id="condition">
			<option value="product_code" <c:if test="${condition eq 'product_code' }">selected</c:if>>제품코드</option>
			<option value="color_name" <c:if test="${condition eq 'color_name' }">selected</c:if>>색상</option>
			<option value="gender" <c:if test="${condition eq 'gender' }">selected</c:if>>성별</option>
		</select>
		<input type="text" name="keyword" id="keyword"
			placeholder="검색어 ..." value="${keyword }"/>
		<button type="submit">검색</button>
		</form>
		<div class="table-responsive">
			<table class="table table-hover"> 
				<colgroup>
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
				</colgroup>
				<thead>
					<tr>
						<th>제품코드</th>
						<th>색상</th>
						<th>성별</th>
						<th>S 사이즈</th>
						<th>M 사이즈</th>
						<th>L 사이즈</th>
						<th>XL 사이즈</th>
						<th>F 사이즈</th>
						<th>전체 사이즈 재고</th>
						<th>생산일</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="5" align="center">데이터가 없습니다.</td>
							</tr>
						</c:when>
						<c:when test="${!empty list}">
							<c:forEach var="list" items="${list}">
								<tr>
									<td><c:out value="${list.product_code}" /></td>
									<td><c:out value="${list.color_name}" /></td>
									<td><c:out value="${list.gender}" /></td>
									<td><c:out value="${list.s}" /></td>
									<td><c:out value="${list.m}" /></td>
									<td><c:out value="${list.l}" /></td>
									<td><c:out value="${list.xl}" /></td>
									<td><c:out value="${list.f}" /></td>
									<td><c:out value="${list.total}" /></td>
									<td><c:out value="${list.manufacture_day}" /></td>
									<td>
										<button name="delProdBtn">삭제하기</button>
									</td>
									<td>
										<button name="revProdBtn">수정하기</button>
									</td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
			</table>
			<form name="manageHome" action="manage.do" method="GET">
			<input type="submit" name="submit" value="관리자 메인으로" class="manage">
			</form>
		</div>
	</div>
</article>
     <script>
    //버튼이 있는 해당 row의 발주코드(pk값)을 찾아서 전달해주는 놈임
    $('button[name=delProdBtn]').click(function (){
    	// this -> button의 가장 가까운 tr을 찾고, tr의 자식의 0번째 값(0번째 td값)의 text를 가져온다.
        let product_code = $(this).closest("tr").children().eq(0).text();
        console.log(product_code);	// 내가 클릭한 놈 id 잘 가져왔나 web 콘솔에 띄우기
    //삭제하기 버튼 누르면 임의의 form 생성 후 controller에 전송
        if(confirm("정말로 삭제하시겠습니까?")){
        let delForm = $('<form></form>');
        delForm.attr("name","prodListDelete");
        delForm.attr("method","get");
        delForm.attr("action","prodListDelete.do");

        delForm.append($('<input>', {type: 'hidden', name: 'product_code', value : product_code }));
        delForm.appendTo('body');
        delForm.submit();
        }
    });
      </script>
</body>
</html>