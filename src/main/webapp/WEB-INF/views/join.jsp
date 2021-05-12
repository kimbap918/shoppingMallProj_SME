<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>main</title>
<link rel="stylesheet" type="text/css" href="resources/css/join.css">
<link rel="stylesheet" href="resources/css/bootstrap.css">




</head>

<body>
	<div class="row">

		<div class="col-xs-12 col-sm-12">
			<h2>&nbsp;</h2>
			<h2 class="text-center">회원가입</h2>
		</div>

		<div class="col-xs-3 col-sm-3"></div>
		<div class="col-xs-8 col-sm-8">

			<div>
				<p>&nbsp;</p>
				<FORM name="" method="post" onsubmit="return validate();"
					class="form-horizontal" action="joinCheck.do">


					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label for="userid">아이디</label>
						</div>
						<div class="col-sm-3 text-left">
							<input type="text" class="form-control" name="id" id="my_id"
								placeholder="ID">
						</div>
						<div class="col-sm-3">
							<input type="button" id="idck" value="중복확인" class="btn-seong" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label for="userpwd">비밀번호</label>
						</div>
						<div class="col-sm-6">
							<input type="password" class="form-control" name="pwd"
								id="my_pwd" placeholder="PassWord">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label for="pwd">비밀번호 확인</label>
						</div>
						<div class="col-sm-6">
							<input type="password" class="form-control" name="pwd"
								id="my_pwd2" placeholder="PassWord">
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label for="email">이메일</label>
						</div>
						<div class="col-sm-6">
							<input type="email" class="form-control" name="email"
								id="my_mail" placeholder="seonggyu@gmail.com">
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label for="name">이름</label>
						</div>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="name" id="my_name"
								placeholder="이성규">
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label for="birth">생년원일</label>
						</div>
						<div class="col-sm-6">
							<input type="date" class="form-control" name="birth" id="birth"
								placeholder="ex)19930521">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label id="contact">전화번호</label>
						</div>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="contact"
								id="contact" placeholder="-없이 입력해주세요">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label for="address">주소 입력</label>
						</div>
						<div class="col-sm-3">
							<input type="text" id="postcode" placeholder="우편번호" name="addr4"
								class="form-control" placeholder="06267">
						</div>
						<div class="col-sm-3">
							<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"
								class="btn-seong">
						</div>
					</div>


					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label for="addr">도로명주소</label>
						</div>
						<div class="col-sm-6">
							<input type="text" id="addr" placeholder="도로명주소" name="addr"
								class="form-control" placeholder="256-32">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label for="addr3">지번주소</label>

						</div>
						<span id="guide" style="color: #999; display: none"></span>
						<div class="col-sm-6">
							<input type="text" id="addr3" placeholder="지번주소" name="addr3"
								class="form-control" placeholder="256-32">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label for="addr5">참고주소</label>
						</div>
						<div class="col-sm-6">
							<input type="text" id="extraAddress" placeholder="참고주소"
								name="addr5" class="form-control" placeholder="256-32">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label for="addr2">상세주소</label>
						</div>
						<div class="col-sm-6">
							<input type="text" id="addr2" placeholder="상세주소" name="addr2"
								class="form-control" placeholder="256-32">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label for="mem_gender">성별 </label>
						</div>
						<input type="radio" id="sexy" name="sex" value="남">남 <input
							type="radio" id="sexx" name="sex" value="여">여
					</div>


					<div class="form-group">
						<div class="col-sm-12  text-center">
							<input type="submit" id="join" value="회원가입" class="btn-seong">

						</div>
					</div>

				</FORM>
			</div>
		</div>

	</div>
	<!-- >div id="helper">
		<a href="#" class="up"><p>↑</p></a> <a href=""><p>■</p></a> <a
			href="#down_test" class="down"><p>↓</p></a>
	</div  -->

	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>

	<script>
		//아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
		let idck = 0;
		//idck 버튼을 클릭했을 때 
		$("#idck").click(function() {
			//userid 를 param.
			let id = $("#my_id").val();

			console.log(id);

			$.ajax({
				type : 'POST',
				async : true,
				data : id,
				url : "idcheck.do",
				dataType : "json",
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					if (data.cnt > 0) {

						alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
						//아이디가 존재할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
						$("#divInputId").addClass("has-error")
						$("#divInputId").removeClass("has-success")
						$("#my_id").focus();

					} else {
						alert("사용가능한 아이디입니다.");
						//아이디가 존재할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
						$("#divInputId").addClass("has-success")
						$("#divInputId").removeClass("has-error")
						$("#pwd").focus();
						//아이디가 중복하지 않으면  idck = 1 
						idck = 1;

					}
				},
				error : function(error) {

					alert("error : 상식적으로 id를 입력하고 중복체크를 해야지 돌빡 혜지같은놈", error);
				}
			});
		});
	</script>


	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
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
							document.getElementById('postcode').value = data.zonecode;
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
	<script type="text/javascript">
		function validate() {
			//event.preventDefault();
			var objID = document.getElementById("my_id");
			var objPwd1 = document.getElementById("my_pwd");
			var objPwd2 = document.getElementById("my_pwd2");
			var objEmail = document.getElementById("my_mail");
			var objName = document.getElementById("my_name");

			//아이디와 패스워드 값 데이터 정규화 공식
			var regul1 = /^[a-zA-Z0-9]{4,12}$/;
			//이메일 값 데이터 유효성 체크
			//[]안에 있는 값만 쓰겠다

			//이메일 정규화 공식
			var regul2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
			//이름 정규화 공식
			var regul3 = /^[가-힝a-zA-Z]{2,}$/;
			//var email = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);

			//아이디 입력 하지 않았을 경우
			if ((objID.value) == "") {
				alert("아이디를 입력하지 않았습니다.");
				objID.focus();
				return false;
			}
			//아이디 유효성 검사
			//내가 입력한 데이터를 검사하는 check()
			//만약 내가 아이디에 정규화 방식을 하나라도 지키지 않으면 if문 안으로 들어가서 alert message를 띄움
			if (!check(regul1, objID, "아이디는 4~12자의 대소문자와 숫자로만 입력 가능합니다.")) {
				return false;//반환 할 곳 없이 if문 탈출
			}
			//비밀번호 입력 하지 않았을 경우
			if ((objPwd1.value) == "") {
				alert("비밀번호를 입력해 주세요");
				objPwd1.focus();
				return false;
			}
			if ((objPwd2.value == "")) {
				alert("비밀번호를 입력해 주세요");
				objPwd2.focus();
				return false;
			}

			//비밀번호 유효성 검사
			//만약 내가 비밀번호에 정규화 방식을 하나라도 지키지 않으면 if문 안으로 들어가서 alert message를 띄움
			if (!check(regul1, objPwd1, "비밀번호는 4~12자의 대소문자와 숫자로만 입력 가능합니다.")) {
				return false;
			}

			//비밀번호와 비밀번호 확인이 일치 하지 않을 경우
			if ((objPwd1.value) != (objPwd2.value)) {
				alert("비밀번호가 일치 하지 않습니다.");
				objPwd1.focus();
				objPwd2.focus();
				return false;
			}
			//이메일 입력 안했을 경우
			if ((objEmail.value) == "") {
				alert("이메일을 입력해 주세요");
				objEmail.focus();
				return false;
			}
			//이메일이 잘못된 경우
			if (!check(regul2, objEmail, "이메일을 잘못 입력 했습니다.")) {
				return false;
			}
			//이름 입력 안 한 경우
			if ((objName.value) == "") {
				alert("이름을 입력해 주세요");
				objName.focus();
				return false;
			}
			//이름에 특수 문자가 들어간 경우
			if (!check(regul3, objName, "이름이 잘못 되었습니다.")) {
				return false;
			}

		}
		function check(re, what, message) {//정규화데이터,아이템 id,메세지
			if (re.test(what.value)) {//what의 문자열에 re의 패턴이 있는지 나타내는 함수 test
				//만약 내가 입력한 곳의 값이 정규화 데이터를 썼다면 true를 반환해서 호출 된 곳으로 리턴됨
				return true;
			}
			alert(message);
			what.value = "";
			what.focus();
		}
	</script>
</body>

</html>