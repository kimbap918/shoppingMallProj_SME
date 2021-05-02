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
			<h2>User list</h2>
			<br>
			<form action="userList.do" method="get">
			<label for="condition">검색조건</label>
			<select name="condition" id="condition">
				<option value="id" <c:if test="${condition eq 'id' }">selected</c:if>>유저id</option>
				<option value="name" <c:if test="${condition eq 'name' }">selected</c:if>>유저명</option>
				<option value="custRank" <c:if test="${condition eq 'custRank' }">selected</c:if>>유저등급</option>
			</select>
			<input type="text" name="keyword" id="keyword"
				placeholder="검색어 ..." value="${keyword }"/>
			<button type="submit">검색</button>
			</form>
			<div class="table-responsive">
					<table class="table table-hover"> 
					<colgroup>
						<col style="width: auto;" />
						<col style="width: 15%;" />
						<col style="width: 10%;" />
						<col style="width: 20%;" />
						<col style="width: 10%;" />
						<col style="width: 15%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
					</colgroup>
					<thead>
						<tr>
							<th>유저ID</th>
							<th>유저PWD</th>
							<th>유저이름</th>
							<th>EMAIL</th>
							<th>유저등급</th>
							<th>가입일</th>
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
							<!-- forEach 돌리는 곳에는 id를 안써야한다. 반복분이 돌아가면서 id값이 겹치기 때문에! -->
							<c:set var="name" value="id" scope="page"/>
								<c:forEach var="list" items="${list}">
									<tr>
										<td><c:out value="${list.id}" /></td>
										<td><c:out value="${list.pwd}" /></td>
										<td><c:out value="${list.name}"/></td>
										<td><c:out value="${list.email}" /></td>
										<td><input type="text" name="custRank" size="5" value="${list.custRank}"/></td>
										<td><c:out value="${list.joinDate}" /></td>
										<td>
											<button name="delUserBtn">삭제하기</button>
										</td>
										<td>
											<button name="modUserBtn">수정하기</button>
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
    $('button[name=delUserBtn]').click(function (){
    	// this -> button의 가장 가까운 tr을 찾고, tr의 자식의 0번째 값(0번째 td값)의 text를 가져온다.
        let id = $(this).closest("tr").children().eq(0).text();
        console.log(id);	// 내가 클릭한 놈 id 잘 가져왔나 web 콘솔에 띄우기
    //삭제하기 버튼 누르면 임의의 form 생성 후 controller에 전송
        if(confirm(id + "님을 정말로 삭제하시겠습니까?")){
        let delForm = $('<form></form>');
        delForm.attr("name","listDelete");
        delForm.attr("method","get");
        delForm.attr("action","listDelete.do");

        delForm.append($('<input>', {type: 'hidden', name: 'id', value : id }));
        delForm.appendTo('body');
        delForm.submit();
        }
    });
     </script>
     <script>
      $('button[name = modUserBtn]').click(function (){
    	  let id = $(this).closest("tr").children().eq(0).text();
          let custRank = $(this).closest("tr").children().eq(4).children().val();
          console.log(custRank);	
          if(confirm(id + "님 정보를 수정하시겠습니까?")){
          let modForm = $('<form></form>');
          modForm.attr("name","modUserList");
          modForm.attr("method","post");
          modForm.attr("action","modUserList.do");

          modForm.append($('<input>', {type: 'hidden', name: 'id', value : id }));
          modForm.append($('<input>', {type: 'hidden', name: 'custRank', value : custRank }));
          modForm.appendTo('body');
          modForm.submit();
          }
      });
      </script>
</body>
</html>


