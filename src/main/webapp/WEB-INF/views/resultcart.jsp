<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/bootstrap-theme.min.css">
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
</head>
	<div class="container">
            <form method="post" action="order.do" onSubmit="return RequiredBox(this)">
            <c:choose>
                <c:when test="${!empty userInfo.id}">
                    <h3>${userInfo.name}님의 장바구니입니다.</h3>
                    <input type="hidden" value="shop_db.customer_cart" name="table">
                </c:when>
                <c:when test="${empty userInfo.id}">
                    <h3>비회원님의 장바구니입니다.</h3>
                    <input type="hidden" value="shop_db.noncustomer_cart" name="table">
                </c:when>
            </c:choose>

            <!-- <div class="table-responsive"> -->
                <table class="table">
                    <thead>
                        <tr class="">
                            <th><input type="checkbox" id="checkall"><label for="checkall">전체선택</label></th>
                            <th class="text-center">제품정보</th>
                            <th class="text-center">재품이름</th>
                            <th class="text-center">사이즈</th>
                            <th class="text-center">색상</th>
                            <th class="text-center">수량</th>
                            <th class="text-center">가격</th>
                            <th class="text-center">삭제</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${!empty list}">
                                <c:forEach items="${list}" var="list">
                                    <tr>
                                        <td><input type="checkbox" name="box" class="checkSelect" id="checkSelect" value="${list.idx}"></td>
                                        <td class="text-center"><img src="resources/images/close/${list.prodCode}.jpg" width="120px" height="110px"></td>
                                        <td class="text-center"> ${list.prodName}</td>
                                        <td class="text-center">${list.size}</td>
                                        <td class="text-center">${list.color}</td>
                                        <td class="text-center">${list.count}</td>
                                        <td class="text-center"><fmt:formatNumber value="${list.price}" pattern="#,###" /></td>
                                        <td class="text-center"><input type="button"
                                            onclick="location.href='delcart.do?idx=${list.idx}'" value="x"></td>
                                    </tr>
                                </c:forEach>
                            </c:when>

                            <c:when test="${empty list}">
                                <td></td>
                                <td></td>
                                <td></td>
                                <td class="text-center">장바구니가 비었어요!</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <!-- 시간부족으로; -->
                            </c:when>
                            <c:otherwise>
                                <p>오류가 발생했어요, 다시 실행시켜 주시겠어요?</p>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            <!-- </div> -->

            <div class="row">
                <div class="col">
                    <input type="submit" class="btn btn-warning btn-lg" value="구매하기">
                    <button type="submit" class="btn btn-light btn-lg" onclick="location.href = 'index.do'">홈으로</button>
                </div>
            </div>
          </form>
        </div>

	<script>
	
	/* 값 넣는 기능 */
function check() {

	let arr = [];
	$('.checkSelect').each(function(i, e) {
	if ($(e).is(':checked')) {
		arr.push($(e).val());
		}
	});

	console.log("출력 : " + arr);
	console.log("출력 : " + $('checkSelect'));
	console.log("출력 1 :", arr);
	console.log("출력 2 :", $('checkSelect'));

	return false;
	}
	/* 체크기능 */
	$(document).ready(function(){
    //최상단 체크박스 클릭
    $("#checkall").click(function(){
        //클릭되었으면
        if($("#checkall").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=box]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=box]").prop("checked",false);
        }
    })
})

function RequiredBox() {

		var hi =  $("input:checkbox[name='box']").is(":checked");
		
		if(!hi){
			alert("하나이상선택해주세요");
			return false;
		}
}
	</script>