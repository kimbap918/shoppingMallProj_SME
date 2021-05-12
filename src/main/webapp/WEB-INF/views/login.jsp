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
	<div class="container login-container">
		<div class="row">
			<div class="col-md-6 login_form">
				<h3>로그인</h3>
				<form class="form" action="loginCheck.do" method="post">
					<div class="form-group">
						<input name="id" type="text" placeholder="id"><br>
					</div>
					<div class="form-group">
						<input name="pwd" type="password" placeholder="pwd"><br>
					</div>
					<div class="login_one">
						<input type="checkbox">로그인 저장<br>
						<div class="form-group">
							<input type="submit" class="btnSubmit" value="접속">
						</div>
					</div>

					<a href="join.do" class="joinpage">아직도 회원이 아니신가요?</a> <br>
					<c:if test="${msg == false}">
						<p style="color: #f00;">
							로그인에 실패했습니다.<br> 아이디 또는 비밀번호를 다시 입력해주십시오.
						</p>
					</c:if>
				</form>
			</div>
		</div>
	</div>
</body>
</html>