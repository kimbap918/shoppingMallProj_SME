<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/bootstrap-theme.min.css">

      <div id="container" class="container">
         <header>
            <h1> 게시판</h1>
         </header>
         <hr />
       
         <section id="container">
              <form name="readForm" onsubmit="return false;">
              
                        <div class="form-group">
                           <label for="bno" >글 번호</label>
                           <input type="text" class= "form-control2" id="bno" name="bno" value="${boardread.bno}" readonly/>
                        </div>
                        <div class="form-group">
                           <label for="title" class="col-sm-2 control-label">제목</label>
                           <input type="text" class= "form-control" id="title" name="title" value="${boardread.title}"/>
                        </div>
                    
                        <div class="form-group">
                           <label for="content" class="col-sm-2 control-label">내용</label>
                           <textarea style="resize: none;"  class= "form-control"id="content" name="content"><c:out value="${boardread.content}" /></textarea>
                        </div>
                    
                        <div class="form-group">
                           <label for="writer" class="col-sm-2 control-label">작성자</label>
                           <input type="text" class= "form-control3" id="writer" name="writer" value="${boardread.writer}"readonly />
                        </div>
                 
   						<div class="form-group">                 
                           <label for="regdate" class="col-sm-2 control-label">작성날짜</label>
                           <fmt:formatDate value="${boardread.regdate}" pattern="yyyy-MM-dd"/>               
                             </div>
      
               <div>
                  <c:if test="${userInfo.name eq boardread.writer}">
                     <button class="update_btn btn-primary"  id="boardupdate_btn"name="boardupdate_btn" >수정</button>
                     <button class="delete_btn btn-primary" id = "boarddelete_btn" name="boarddelete_btn">삭제</button>
                </c:if>
                  <button class="boardlist_btn btn-primary" onclick=" location.href = 'boardlist.do' ; " name="boardlist_btn">목록</button>
               </div>
            </form>  
         </section>
         <hr />
      </div>
      
      
         <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
          <script type="text/javascript">
   /*
          $(document).ready(function(){
         let delForm = $("form[name='readForm']");
/*      
         // 수정 
         $('button[name=boardupdate_btn]').click(function(){
         <!--    let delForm = $('<form></form>'); -->
             delForm.attr("name","boardupdateview");
             delForm.attr("method", "get");
             delForm.attr("action", "boardupdateview.do");
            delForm.append($('<input>', {type: 'hidden', name: 'bno', value : boardupdate.bno }));
             delForm.appendTo('body');
             delForm.submit();            
         });
*/         
         // 삭제
   /*      $('button[name=boardupdelete_btn]').click(function(){
         <!--    let delForm = $('<form></form>');  -->
             delForm.attr("name","boarddelete");
             delForm.attr("method", "get");
             delForm.attr("action", "boarddelete.do");
             delForm.append($('<input>', {type: 'hidden', name: 'bno', value : boardread.bno }));
              delForm.appendTo('body')
             delForm.submit();
         })
         
         // 취소
         $("button[name=boardlist_btn]").click(function(){
            
            location.href = "boardlist.do";
         });
      });
      
         */   
         
         $("#boarddelete_btn").click(function() {
            let bno = $("#bno").val();

            if(confirm("해당 글을 삭제할거냐")){
               // alert(bno + $('#writer').val());   값이 정상적으로 받아와지나 1차 확인용 알랏
               console.log(bno);
            }else return;
            
            $.ajax({
               type : 'POST',
               async : true,
               data : bno,
               url : "boarddelete.do",
               dataType : "json",
               contentType : "application/json; charset=UTF-8",
               success : function(xml) {
                  if (xml.code === 200) {

                     alert("삭제되었습니다.");
                     location.href = 'boardlist.do' ;

                  } else {
                     alert("삭제 실패. 다시 시도하세요");
                  }
               },
               error : function(error) {

                  alert("error : 성규 잘하자?", error);
               }
            });
         });
      
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
         
      
         $('#boardupdate_btn').click(function(){
               
            let data = $('form[name=readForm]').serializeObject();

               if(!confirm("해당 글을 수정할거냐")){
               //   alert(bno + $('#writer').val());   //값이 정상적으로 받아와지나 1차 확인용 알랏
                  return;
               }
               $.ajax({
                  type : "post",
                  async : false, //false인 경우 동기식으로 처리한다.
                  url : "boardupdate.do",
                  data : data,
                  dataType : "json",
                  success : function(xml) { 
                        if (xml.code == 200) {

                                 alert("수정되었습니다.");
                                 location.href = 'boardlist.do' ;

                              } else {
                                 console.log(xml.code + ':: error');
                                 alert("수정 실패. 다시 시도하세요");
                              }
                           },
                           error : function(error) {

                           }
                        });
                     });
                  
  </script>
   </body>
</html>