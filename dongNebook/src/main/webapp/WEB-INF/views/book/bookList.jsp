<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/views/common/linkHead.jsp"/>
<link type="text/css" rel="stylesheet" href="/css/book/bookList.css?v=<%=System.currentTimeMillis()%>">
</head>
<style>
	h1 {
  font-weight: normal;
  font-size: 40px;
  font-weight: normal;
}


.select-hidden {
  display: none;
  visibility: hidden;
  padding-right: 10px;
}

.select {
  cursor: pointer;
  display: inline-block;
  position: relative;
  font-size: 16px;
  color: #fff;
  width: 220px;
  height: 40px;
}

.select-styled {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  background-color: #24b1c2;
  padding: 8px 15px;
  -moz-transition: all 0.2s ease-in;
  -o-transition: all 0.2s ease-in;
  -webkit-transition: all 0.2s ease-in;
  transition: all 0.2s ease-in;
}

.select-styled:after {
  content: "";
  width: 0;
  height: 0;
  border: 7px solid transparent;
  border-color: #fff transparent transparent transparent;
  position: absolute;
  top: 16px;
  right: 10px;
}

.select-styled:hover { background-color: #22a9b9; }

.select-styled:active, .select-styled.active { background-color: #209dac; }

.select-styled:active:after, .select-styled.active:after {
  top: 9px;
  border-color: transparent transparent #fff transparent;
}

.select-options {
  display: none;
  position: absolute;
  top: 100%;
  right: 0;
  left: 0;
  z-index: 999;
  margin: 0;
  padding: 0;
  list-style: none;
  background-color: #209dac;
}

.select-options li {
  margin: 0;
  padding: 12px 0;
  text-indent: 15px;
  border-top: 1px solid #1c8a97;
  -moz-transition: all 0.15s ease-in;
  -o-transition: all 0.15s ease-in;
  -webkit-transition: all 0.15s ease-in;
  transition: all 0.15s ease-in;
}

.select-options li:hover {
  color: #24b1c2;
  background: #fff;
}
.modal-content{
	width:82% !important;
}
.modal{
	width:30% !important;
	    top: 200px !important;
    left: 1400px !important;
}
#year{
	    width: 50%;
    border: 2px solid;
    /* border-radius: 2%; */
    background: #24b1c2;
    color: white;
    height: 34px;
}
.select-options li[rel="hide"] { display: none; }
</style>
<body>
<jsp:include page="/views/common/header.jsp" />
   <div class="contents-frame">
      <div class="contents">
   <jsp:include page="/views/common/adminSide.jsp" />
   <div class="admin-contents">
   <div id="main-container" class="main-container nav-effect-1">
         <h1 style="font-size:30px;">책 리스트</h1>
         <hr>
         <div class="list-contents">
         <table class="bookListTable" border=1>
            <tr class="table-header">
                 <th>책번호</th>
                 <th>이미지</th>
                 <th>제목</th>
                 <th>카테고리</th>
                 <th>출판사</th>
                 <th>수정</th>
                 
             </tr>
            <c:forEach items="${list }" var ="b">
               <tr>
                  <td>${b.bookNo }</td><td><img src=${b.imageurl}></td><td><p>${b.bookName }</p><p>${b.bookWriter }</p><p>${b.ISBN }</p></td><td>${b.bookKind }</td><td>${b.bookPublisher }</td><td><button type="button" class="pbtn success" data-toggle="modal" data-target="#myModal" onclick="updateInform(${b.bookNo },'${b.bookName}','${b.bookKind}','${b.bookWriter}','${b.bookPublisher}','${b.bookIntroduce}',${b.bookCount })"><i class="fas fa-edit"></i></button><button class="pbtn success pp" onclick="location.href='/book/bookDelete.do?bookNo=${b.bookNo}'"><i class="fas fa-trash-alt"></i></button></td>         
               </tr>
               
               <!-- The Modal -->
               <div class="modal" id="myModal">
                 <div class="modal-dialog">
                   <div class="modal-content">
               
                     <!-- Modal Header -->
                     <div class="modal-header">
                       <h4 class="modal-title" id="bookName"></h4><br>
                       
                       
                       <button type="button" class="close" data-dismiss="modal">&times;</button>
                     </div>
               
                     <!-- Modal body -->
                     <form action="/book/updateBook.do">
                        <div class="modal-body">
                        <input type="hidden" name="bookNo" id="no">
                        <input type="hidden" name="bookCount" id="count">
                           <select id="year" onchange="sel(this)">
							  <option  id="bookCount" value="0">변경하기</option>
							  <option value="1">변경: 1</option>
							  <option value="2">변경: 2</option>
							  <option value="3">변경: 3</option>
							  <option value="4">변경: 4</option>
							  <option value="5">변경: 5</option>
							  <option value="6">변경: 6</option>
							  <option value="7">변경: 7</option>
							  <option value="8">변경: 8</option>
							  <option value="9">변경: 9</option>
							  <option value="10">변경: 10</option>
							</select>
                        </div>
                     <!-- Modal footer -->
                     <div class="modal-footer">
                     <h5 id="count" style="position: absolute;left: 12px;"></h5>
                        <button type="submit" class="btn btn-primary" id="submit" onclick="updateCnt()">수정</button>
                     </div>
                  </form>
               
                   </div>
                 </div>
               </div>
            </c:forEach>
         </table>
      </div>
         <div class = "pagination justify-content-center" id="pageNavi">${pageNavi }</div>
      </div>
      </div>
   </div>
</div>
   <script>
   $('.close').click(function() {
	   location.reload();
	   });
   window.onload=function(){
	   
   }
  function updateCnt(){
	  var cnt= document.getElementById("count").value;
	  if(cnt>0){
		  document.getElementById("submit").setAttribute("type","submit");
	  }else{
		  alert("수량을 선택하여 주세요");
		  document.getElementById("submit").setAttribute("type","button");  
	  }
  }
 	function sel(e){
 		document.getElementById("count").value=e.value;
 	}

      function updateInform(bookNo,bookName,bookKind,bookWriter,bookPublisher,bookIntroduce,bookCount){
         
         document.getElementById("no").value=bookNo;
         document.getElementById("bookName").innerHTML=bookName;
        // document.getElementById("count").innerHTML="보유수량:"+bookCount;
         document.getElementById("bookCount").innerHTML="보유수량:"+bookCount;
         //document.getElementById("bookKind").value=bookKind;
         //document.getElementById("bookWriter").value=bookWriter;
         //document.getElementById("bookPublisher").value=bookPublisher;
         //document.getElementById("bookIntroduce").value=bookIntroduce;
      }
   </script>
  <!--  <script type="text/javascript">
<!-- $('select').each(function(){
    var $this = $(this), numberOfOptions = $(this).children('option').length;
  
    $this.addClass('select-hidden'); 
    $this.wrap('<div class="select"></div>');
    $this.after('<div class="select-styled"></div>');

    var $styledSelect = $this.next('div.select-styled');
    $styledSelect.text($this.children('option').eq(0).text());
  
    var $list = $('<ul />', {
        'class': 'select-options'
    }).insertAfter($styledSelect);
  
    for (var i = 0; i < numberOfOptions; i++) {
        $('<li />', {
            text: $this.children('option').eq(i).text(),
            rel: $this.children('option').eq(i).val()
        }).appendTo($list);
    }
  
    var $listItems = $list.children('li');

 
  
  $styledSelect.click(function(e) {
     if($('.select-options').is(':visible')) {
        e.stopPropagation();
        $styledSelect.text($(this).text()).removeClass('active');
        $this.val($(this).attr('rel'));
      
        $list.hide();
        //console.log($this.val());   

     } else {
        e.stopPropagation();
        $('div.select-styled.active').each(function(){
            $(this).removeClass('active').next('ul.select-options').hide();
        });
        $(this).toggleClass('active').next('ul.select-options').toggle();
     }//end if
    });
  
    $listItems.click(function(e) {
        e.stopPropagation();
        $styledSelect.text($(this).text()).removeClass('active');
        $this.val($(this).attr('rel'));
        $list.hide();
        //console.log($this.val());
    });
    
    $(document).click(function() {
        $styledSelect.removeClass('active');
        $list.hide();
    });

});
</script>*/--> 
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
 -->
</script>
</body>
</html>