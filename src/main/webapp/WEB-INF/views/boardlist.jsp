<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"
   isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/bootstrap-theme.min.css">

  <div id="root">
    <div class="col-xs-12 col-sm-12">
      <h2>&nbsp;</h2> 
      <h2 class="text-center">게시판</h2>
      </div>        
           
        <div>      
          <p>&nbsp;</p>
		<section class="container">
         <form role="form" method="get" name="boardlist"  action="boardlist.do">
           		<label for="condition">검색조건</label>
			<select name="condition" id="condition">
				<option value="title" <c:if test="${condition eq 'title' }">selected</c:if>>제목</option>
				<option value="writer" <c:if test="${condition eq 'writer' }">selected</c:if>>작성자</option>
				<option value="content" <c:if test="${condition eq 'content' }">selected</c:if>>내용</option>
				
			</select>
           		<input type="text" name="keyword" id="keyword"
				placeholder="검색어 ..." value="${keyword }"/>
				<button type="submit">검색</button>
              <table class="table table-hover">
              <thead>
                  <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>등록일</th>
                  </tr>
                  </thead>
                  <c:forEach items="${list}" var = "list">
                     <tr>
                        <td><fmt:formatNumber value="${list.ROWNUM}" type="number"/></td>
                        <td><a href="boardread.do?bno=${list.bno}"><c:out value="${list.title}" /></a></td>
                        <td><c:out value="${list.writer}" /></td>
                  <td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd hh:mm:ss"/></td> 
                     </tr>
                  </c:forEach>
                  
               </table>
            </form>
      </section>
      <hr />
	<div class="container">
      <a class="btn btn-default pull-right" href ="boardwrite.do" >글쓰기</a>
	</div>
   	<div class="text-center">
   	<ul class="pagination">
   		<li><a href="#">1</a></li>
   		<li><a href="#">2</a></li>
   		<li><a href="#">3</a></li>
   		<li><a href="#">4</a></li>
   		<li><a href="#">5</a></li>
   	</ul>
   	</div>
   </div>
</div>
