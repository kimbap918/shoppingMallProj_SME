<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%
 request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>구매단계2</title>
</head>
<body>
<%
String test = session.getId();
System.out.println("세션아이디 " + test);
%>
<div class="container">
<div class="panel-heading">주문정보</div>
<form action="bill.do" method="post">
<table class="table">
<thead>
<tr>
<th>제품이미지</th>
<th>재품이름</th>
<th>사이즈</th>
<th>색상</th>
<th>수량</th>
<th>가격</th>
</tr>
</thead>
<c:forEach items="${list}" var="list">
<!-- 여기에 idx값을 호출한 이유는 앞에서 체크를 통해 한것처럼 해당 번호를
	참고하여 반복문을 돌리기 위한것 실제로 전달되는 값은 아니다 -->
<input type="hidden" name="check" value="${list.idx}">
<input type="hidden" name="prodCode" value="${list.prodCode}">
<input type="hidden" name="name" value="${list.prodName}">
<input type="hidden" name="size" value="${list.size}">
<input type="hidden" name="color" value="${list.color}">
<input type="hidden" name="qty" value="${list.count}">
<input type="hidden" name="price" value="${list.price}">
<tbody>
<tr>
<td><img src="resources/image/${list.prodCode}.jpg" alt="상품"
      title="사진" width="150px" height="150px"></td>
<td>${list.prodName}</td>
<td>${list.size}</td>
<td>${list.color}</td>
<td>${list.count}</td>
<td><fmt:formatNumber value="${list.price}" pattern="#,###" /></td>
</tr>
<c:set var="sum" value="${sum + (list.price * list.count)}"/>
</tbody>
</c:forEach>
</table>

<!-- 사용자의 연락처, 주소 입력장소 -->
<div class="panel-heading">주문자 정보</div>
<table class="table">
<colgroup>
<col style="width: 110px">
<col />
</colgroup>
<tbody>
<tr>
<th scope="row"></th>
<tr class="dot_line">
<td class="fixed_join">이름</td>
<td><input type="text" name="custName" value="${sessionScope.userInfo.name }"></td>
</tr>
<td class="fixed_join">휴대폰번호</td>
<td><input type="text" name="phone" value="${sessionScope.userInfo.contact}"></td>
</tr>
</table>

<!-- 배송지 작정장소 -->
<div class="panel-heading">배송지 정보</div>
<table class="table">
<colgroup>
<col style="width: 110px">
<col />
</colgroup>
<tbody>
<tr>
<th scope="row"><div class="txt-l">주소</div></th>
<tr>
<td>
<input type="text" id="addr4" name="addr4" size=5 value="${sessionScope.userInfo.addr4 }"> 
<input type="button" onclick="execDaumPostcode()" value="우편번호찾기">
<br>도로 주소:<input type="text" id="addr" name="addr" size="50" value="${sessionScope.userInfo.addr }">
<br>지번 주소:<input type="text" id="addr3" name="addr3" size="50" value="${sessionScope.userInfo.addr3 }">
<br>참고 주소:<input type="text" id="extraAddress" name="addr5" size="50"	value="${sessionScope.userInfo.addr5 }">
<br>상세 주소: <input type="text" id="addr2" name="addr2" size="50" value="${sessionScope.userInfo.addr2 }" />
</td>
</tr>
</table>

<!-- 총 금액 합산 -->
<div class="panel-heading">전체가격</div>
<table class="table">
<thead>
<tr>
<th>상품금액</th>
<th>배송비</th>
<th>할인금액</th>
<th>결제금액</th>
</thead>
<tbody>
<tr>
<div><td><strong>210000000</strong></td></div>
<div><td><strong>250000</strong></td></div>
<div><td><strong>0</strong></td></div>
<div><td><strong>210000000</strong></td></div>
</tr>
</tbody>
</table>

<div class="panel-heading">결제정보</div>
<table>
<colgroup>
<col style="width: 110px">
<col />
</colgroup>
<tbody>
<tr>
<th scope="row"><div class="txt-l">결제방법</div></th>
<td>
<ul class="pay-method">
<li><input type="radio" class="chk-rdo" name="radio_paymethod" value="B" checked='checked'/> <label for="무통장입금">무통장입금
</label><em><span class="op-bank-dc-price fc-red"></span></em>
<select name="pay_data" class="w280 MK_bank_select_list MK_pay_add_choice">
<option value='' disabled="disabled">입금 계좌번호 선택(반드시 주문자 성함으로 입금)</option>
<option value="농협 999-9999-9999-99 (예금주:(주)SME)" >농협 999-9999-9999-99 (예금주:(주)SME)</option>
<option value="하나은행 999-999999-99999 (예금주:(주)SME)" >하나은행 999-999999-99999 (예금주:(주)SME)</option>  
<option value="기업은행 999-999999-99-999 (예금주:(주)SME)" >기업은행 999-999999-99-999 (예금주:(주)SME)</option>                       
<option value="국민은행 999999-99-999999 (예금주:(주)SME)" >국민은행 999999-99-999999 (예금주:(주)SME)</option>                       
<option value="우리은행 9999-999-999999 (예금주:(주)SME)" >우리은행 9999-999-999999 (예금주:(주)SME)</option>
</select>  
</li>
<li><input type="radio" class="chk-rdo" name="radio_paymethod" value="PAYCO" /> 페이코(PAYCO)</li>
<li><input type="radio" class="chk-rdo" name="radio_paymethod" value="C" /> 신용카드</li>
<li><input type="radio" class="chk-rdo" name="radio_paymethod" value="D" /> 휴대폰 결제</li>
<li><input type="radio" class="chk-rdo" name="radio_paymethod" value="KAKAOPAY" /> 카카오페이(KAKAOPAY)<em><span class="op-card-dc-price fc-red"></span></em></li>
</ul>
</td>
</tr> 
</tbody>
</table>
<!-- shipStat는 배송상태로써 order.jsp에서 결제를 할 경우
	가장 처음 상태인 배송준비 상태이므로 값을 0으로 히든타입으로 해서 보낸다. -->
<input type="hidden" value="0" name="shipStat"> 
<input name="custId" type="hidden" size="20" value="${sessionScope.userInfo.id }">
<div class="col-sm-3" style="text-align:center;">
<input type="submit" class="btn btn-light btn-lg" value="결제하기">
<button type="button" class="btn btn-light btn-lg" onclick="location.href = 'index.do'">주문취소</button>
</div>
</form>

</div>


<!-- 아래는 스크립트 -->
	<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
<script src="https://code.jquery.com/jquery-3.5.1.js" 
        integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
        crossorigin="anonymous"> </script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>	 

<script>
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
jQuery.fn.serializeObject = function() {
	let obj = null;
	try {
		if (this[0].tagName) {
			let arr = this.serializeArray();
			if (arr) {
				obj = {};
				jQuery.each(arr, function() {
					obj[this.name] = this.value;
				});
			}
		}
	} catch (e) {
		alert(e.message);
	} finally {
	}
	return obj;
};

    function fn_modify_member_info(){
		var value;
		
		// let modMemberInfo = []; 
		
		
		var frm_mod_member = document.frm_mod_member;
		
    }
    
    $('#modMemeberButton').click(function(){
		
    	let data = $('form[name=frm_mod_member]').serializeObject();
		
		$.ajax({
			type : "post",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "modMember.do",
			data : data,
			dataType : "json",
			success : function(xml) { 
				if(xml.code == 200){
					alert("회원 정보를 수정했습니다.");
					location.href='${pageContext.request.contextPath}/'; //<- 여기에 이동할 mapping 주소 적어주세요
				}else{
					console.log(xml.code + ':: error');
					alert("다시 시도해 주세요.");	
				}
			},
			 error: function(request, status, error) {
		            console.log("code:" + status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	            alert('콘솔보셈');
	        }
		}); //end ajax
    });
  //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execDaumPostcode() {
    	new daum.Postcode(
    			{
    				oncomplete : function(data) {
    					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

    					// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
    					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
    					var roadAddr = data.roadAddress; // 도로명 주소 변수
    					var extraRoadAddr = ''; // 참고 항목 변수

    					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
    					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
    					if (data.bname !== ''
    							&& /[동|로|가]$/g.test(data.bname)) {
    						extraRoadAddr += data.bname;
    					}
    					// 건물명이 있고, 공동주택일 경우 추가한다.
    					if (data.buildingName !== ''
    							&& data.apartment === 'Y') {
    						extraRoadAddr += (extraRoadAddr !== '' ? ', '
    								+ data.buildingName : data.buildingName);
    					}
    					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
    					if (extraRoadAddr !== '') {
    						extraRoadAddr = ' (' + extraRoadAddr + ')';
    					}

    					// 우편번호와 주소 정보를 해당 필드에 넣는다.
    					document.getElementById('addr4').value = data.zonecode;
    					document.getElementById("addr").value = roadAddr;
    					document.getElementById("addr3").value = data.jibunAddress;

    					// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
    					if (roadAddr !== '') {
    						document.getElementById("extraAddress").value = extraRoadAddr;
    					} else {
    						document.getElementById("extraAddress").value = '';
    					}

    					var guideTextBox = document.getElementById("guide");
    					// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
    					if (data.autoRoadAddress) {
    						var expRoadAddr = data.autoRoadAddress
    								+ extraRoadAddr;
    						guideTextBox.innerHTML = '(예상 도로명 주소 : '
    								+ expRoadAddr + ')';
    						guideTextBox.style.display = 'block';

    					} else if (data.autoJibunAddress) {
    						var expJibunAddr = data.autoJibunAddress;
    						guideTextBox.innerHTML = '(예상 지번 주소 : '
    								+ expJibunAddr + ')';
    						guideTextBox.style.display = 'block';
    					} else {
    						guideTextBox.innerHTML = '';  
    						guideTextBox.style.display = 'none';
    					}
    				}
    			}).open();
    }	
</script>
</body>
</html>