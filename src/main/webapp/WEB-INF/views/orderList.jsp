<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<link rel="stylesheet" href="resources/css/bootstrap.css">
	<article>
	<div class="container">
		<h2>Order list</h2>
	<br>
	<form action="orderList.do" method="get">
		<label for="condition">검색조건</label>
		<select name="condition" id="condition">
			<option value="custName" <c:if test="${condition eq 'custName' }">selected</c:if>>고객명</option>
			<option value="orderStatus" <c:if test="${condition eq 'orderStatus' }">selected</c:if>>배송상태</option>
			<option value="orderNo" <c:if test="${condition eq 'orderNo' }">selected</c:if>>주문번호</option>
		</select>
		<input type="text" name="keyword" id="keyword"
			placeholder="검색어 ..." value="${keyword }"/>
		<button type="submit">검색</button>
	</form><!-- condition이라는 파라미터 명으로 넘어간다. -->
		<div class="table-responsive">
			<table class="table table-hover"> 
				<colgroup>
					<col style="width: 5%;" />
					<col style="width: 5%;" />
					<col style="width: 10%;" />
					<col style="width: 5%;" />
					<col style="width: 3%;" />
					<col style="width: 12%;" />
					<col style="width: Auto;" />
					<col style="width: 3%;" />
					<col style="width: 10%;" />
					<col style="width: 6%;" />
					<col style="width: 6%;" />
					<col style="width: 6%;" />
					<col style="width: 5%;" />
					<col style="width: 5%;" />
					<col style="width: 7%;" />
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>유저ID</th>
						<th>유저명</th>
						<th>전화번호</th>
						<th>제품코드</th>
						<th>제품명</th>
						<th>사이즈</th>
						<th>컬러</th>
						<th>주소1</th>
						<th>주소2</th>
						<th>주소3</th>
						<th>주문수량</th>
						<th>주문시각</th>
						<th>배송번호</th>
						<th>배송상태</th>
						
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
									<td><c:out value="${list.orderNo}" /></td>
									<td><c:out value="${list.custId}" /></td>
									<td><c:out value="${list.custName}" /></td>
									<td><c:out value="${list.phone}" /></td>
									<td><c:out value="${list.prodCode}" /></td>
									<td><c:out value="${list.prodName}" /></td>
									<td><c:out value="${list.size}" /></td>
									<td><c:out value="${list.color}" /></td>
									<td><c:out value="${list.addr}" /></td>
									<td><c:out value="${list.addr2}" /></td>
									<td><c:out value="${list.addr4}" /></td>
									<td><c:out value="${list.qty}" /></td>
									<td><c:out value="${list.orderTime}" /></td>
									<td><c:out value="${list.deliveryNum}" /></td>
									<td><input type="text" name="orderStatus" size="5" value="${list.orderStatus}"/></td>
									<td>
										<button name="delOrderBtn">삭제하기</button>
									</td>
									<td>
										<button name="modOrderBtn">수정하기</button>
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
 <script src="https://code.jquery.com/jquery-3.5.1.js"
      integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
      crossorigin="anonymous"></script>
      <script>
      
    //버튼이 있는 해당 row의 발주코드(pk값)을 찾아서 전달해주는 놈임
    $('button[name=delOrderBtn]').click(function (){
    	// this -> button의 가장 가까운 tr을 찾고, tr의 자식의 0번째 값(0번째 td값)의 text를 가져온다.
        let orderNo = $(this).closest("tr").children().eq(0).text();
        console.log(orderNo);	// 내가 클릭한 놈 id 잘 가져왔나 web 콘솔에 띄우기
    //삭제하기 버튼 누르면 임의의 form 생성 후 controller에 전송
        if(confirm(orderNo + "의 주문 정보를 정말로 삭제하시겠습니까?")){
        let delForm = $('<form></form>');
        delForm.attr("name","orderListDelete");
        delForm.attr("method","get");
        delForm.attr("action","orderListDelete.do");

        delForm.append($('<input>', {type: 'hidden', name: 'orderNo', value : orderNo }));
        delForm.appendTo('body');
        delForm.submit();
        }
    });
      </script>
      <script>
      $('button[name = modOrderBtn]').click(function (){
    	  let orderNo = $(this).closest("tr").children().eq(0).text();
          let orderStatus = $(this).closest("tr").children().eq(14).children().val();
          console.log(orderStatus);	
          if(confirm("주문번호" + orderNo + "의 배송 정보를 수정하시겠습니까?")){
          let modForm = $('<form></form>');
          modForm.attr("name","modOrderList");
          modForm.attr("method","post");
          modForm.attr("action","modOrderList.do");

          modForm.append($('<input>', {type: 'hidden', name: 'orderNo', value : orderNo }));
          modForm.append($('<input>', {type: 'hidden', name: 'orderStatus', value : orderStatus }));
          modForm.appendTo('body');
          modForm.submit();
          }
      });
      </script>