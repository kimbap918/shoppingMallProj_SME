<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/bootstrap-theme.min.css">
</head>

<body>
	<div class="row">

		<div class="col-xs-12 col-sm-12">
			<h2>&nbsp;</h2>
			<h2 class="text-center">내 상세정보</h2>
		</div>

		<div class="col-xs-3 col-sm-3"></div>
		<div class="col-xs-8 col-sm-8">

			<div>
				<p>&nbsp;</p>

				<form class="form-horizontal" name="frm_mod_member" method="post">

					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label for="id">아이디</label>
						</div>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="id" id="id"
								value="${sessionScope.userInfo.id }" readonly />
						</div>

					</div>

					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label id="pwd">비밀번호</label>
						</div>
						<div class="col-sm-6">
							<input type="password" class="form-control" name="pwd" id="pwd"
								value="${sessionScope.userInfo.pwd }" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label id="name">이름</label>
						</div>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="name" id="name"
								value="${sessionScope.userInfo.name }">
						</div>
					</div>


					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label id="contact">전화번호</label>
						</div>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="contact"
								id="contact" value="${sessionScope.userInfo.contact}">
						</div>
					</div>


					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label id="email">이메일</label>
						</div>
						<div class="col-sm-6">
							<input type="email" class="form-control" name="email" id="email"
								value="${sessionScope.userInfo.email }" />
						</div>
					</div>


					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label for="address">주소 입력</label>
						</div>
						<div class="col-sm-3">
							<input type="text" id="postcode" placeholder="우편번호" name="addr4"
								class="form-control" value="${sessionScope.userInfo.addr4 }">
						</div>
						<div class="col-sm-3">
							<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"
								class="btn btn-primary">
						</div>
					</div>


					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label for="addr">도로명주소</label>
						</div>
						<div class="col-sm-6">
							<input type="text" id="addr" placeholder="도로명주소" name="addr"
								class="form-control" value="${sessionScope.userInfo.addr }">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label for="addr3">지번주소</label>

						</div>
						<span id="guide" style="color: #999; display: none"></span>
						<div class="col-sm-6">
							<input type="text" id="addr3" placeholder="지번주소" name="addr3"
								class="form-control" value="${sessionScope.userInfo.addr3 }">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label for="addr5">참고주소</label>
						</div>
						<div class="col-sm-6">
							<input type="text" id="extraAddress" placeholder="참고주소"
								name="addr5" class="form-control"
								value="${sessionScope.userInfo.addr5 }">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label for="addr2">상세주소</label>
						</div>
						<div class="col-sm-6">
							<input type="text" id="addr2" placeholder="상세주소" name="addr2"
								class="form-control" value="${sessionScope.userInfo.addr2 }">
						</div>
					</div>


					<div class="form-group">
						<div class="col-sm-12  text-center">
							<input type="button" class="btn btn-primary" value="수정하기"
								id="modMemeberButton" />

						</div>
					</div>


				</form>
			</div>
		</div>

	</div>


	<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous">
		
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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

		function fn_modify_member_info() {
			var value;

			// let modMemberInfo = []; 

			var frm_mod_member = document.frm_mod_member;

		}

		$('#modMemeberButton')
				.click(
						function() {

							let data = $('form[name=frm_mod_member]')
									.serializeObject();

							$
									.ajax({
										type : "post",
										async : false, //false인 경우 동기식으로 처리한다.
										url : "modMember.do",
										data : data,
										dataType : "json",
										success : function(xml) {
											if (xml.code == 200) {
												alert("회원 정보를 수정했습니다.");
												location.href = '${pageContext.request.contextPath}/'; //<- 여기에 이동할 mapping 주소 적어주세요
											} else {
												console.log(xml.code
														+ ':: error');
												alert("다시 시도해 주세요.");
											}
										},
										error : function(request, status, error) {
											console.log("code:" + status + "\n"
													+ "message:"
													+ request.responseText
													+ "\n" + "error:" + error);
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
