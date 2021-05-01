<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/bootstrap-theme.min.css">
<style>
	  /* .jb-border {
        border: 1px solid #bcbcbc;
      }
      .jb-table-cell {
        padding: 0px 100px;
        height: 80px;
      } */
      /* .num1 {
      	width: 33%;
      }
      .num2 {
      	width: 33%;
      }
      .num3 {
      	width: 33%;
      } */
    </style>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
</head>
<body>
<body>
	<div class="container">
            <form method="post" action="order.do" name="formbox">
            <c:choose>
                <c:when test="${!empty userInfo.id}">
                    <h3>${userInfo.name}님의장바구니입니다.</h3>
                    <input type="hidden" value="shop_db.customer_cart" name="table">
                </c:when>
                <c:when test="${empty userInfo.id}">
                    <h3>(비)회원님의장바구니입니다.</h3>
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
                                        <td><input type="checkbox" name="box" 
                                            class="checkSelect" id="checkSelect" value="${list.idx}"></td>
                                        <td class="text-center"><img src="resources/images/close/${list.prodCode}.jpg" width="120px" height="110px"> </td>
                                        <!-- <td class="text-center"><img src="resources/images/CT001.jpg" alt="상품" title="사진" width="100px" height="100px" vertical-align: bo></td> -->
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
                    <button class="btn btn-light btn-lg" onclick="location.href = 'index.do'">홈으로</button>
                </div>
            </div>
          </form>
                    <a href="javascript:hi()">확인점검</a>
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

function hi() {
		if($("input:checkbox[name='box']").is(":checked")==false) {
			alert("하나정도는 선택하자");
			return;
		}
}
</script>


	<!-- $(document).ready(function() {
	console.log("jQuery 시작"); /* 제이쿼리 실행여부 확인 */
})
let arr = $('.checkSelect').is('checked');

console.log("checkSelect 출력 : " + arr);

var send_array = Array();
var send_cnt = 0;
var chkbox = $(".checkSelect");

for(i=0;i<chkbox.length;i++) {
    if (chkbox[i].checked == true){
        send_array[send_cnt] = chkbox[i].value;
        send_cnt++;
        send_array = $('checkSelect').is('chekced');
        console.log("출력1 : " + send_array);
        
    }
    console.log("출력2 : " + send_array);
}


사용예정

</script> -->

</body>
</html>