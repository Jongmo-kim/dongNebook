<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동네 북</title>
<jsp:include page="/views/common/linkHead.jsp"/>
<link href="../css/index/index.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="/js/index/index.js"></script>
<style>
	.alert{
		margin-bottom: 2px;
	}
</style>
</head>
<body>
	<div class="alert-wrap">
	</div>
	<c:if test="${sessionScope.loginUser !=null}">
		<input type="hidden" id="userNo" value=${sessionScope.loginUser.userNo }>
	</c:if>
	<jsp:include page="/views/common/header.jsp" />
	
	 <div class="content">
        <div class="imgMain"><img class="mainImg" src="../image/index/main2.jpg">
            <div>
                <input type="text" placeholder="검색어를 입력하세요.">
                <input type="image" src="../image/index/search.webp" alt="submit" name="Submit" value="Submit"  align="absmiddle">
            </div>
        </div>
        <div class="content2">
            <div>달력</div>
            <div>공지</div>
        </div>
        <br>
        <div class="book">
            <ul class="navi">
                <li class="tab" onclick="selectTab(0);">새로운 책</li>
                <li class="tab" onclick="selectTab(1);">대출 순위</li>
            </ul>
            <div class="contents">
               <div class="bookContent">
                <ul>
                   <li>
                   <div>
                   <div class="bookImg"><a href = "#">책 사진</a></div>
                	<div class="info">
                	<p><a href=#>제목</a></p>
                	</div>
                   </div>
                   </li>
                   
                   <li><div>
                   <div class="bookImg"><a href = "#">책 사진</a></div>
                	<div class="info">
                	<p><a href=#>제목</a></p>
                	</div>
                   </div></li>
                   <li><div>
                   <div class="bookImg"><a href = "#">책 사진</a></div>
                	<div class="info">
                	<p><a href=#>제목</a></p>
                	</div>
                   </div></li>
                   <li><div>
                   <div class="bookImg"><a href = "#">책 사진</a></div>
                	<div class="info">
                	<p><a href=#>제목</a></p>
                	</div>
                   </div></li>
                   <li><div>
                   <div class="bookImg"><a href = "#">책 사진</a></div>
                	<div class="info">
                	<p><a href=#>제목</a></p>
                	</div>
                   </div></li>
               </ul>
                </div>
                <div class="bookContent">
               <ul>
                   <li><div>
                   <div class="bookImg"><a href = "#">책 사진</a></div>
                	<div class="info">
                	<p><a href=#>제목2</a></p>
                	</div>
                   </div></li>
                   <li><div>
                   <div class="bookImg"><a href = "#">책 사진</a></div>
                	<div class="info">
                	<p><a href=#>제목2</a></p>
                	</div>
                   </div></li>
                   <li><div>
                   <div class="bookImg"><a href = "#">책 사진</a></div>
                	<div class="info">
                	<p><a href=#>제목2</a></p>
                	</div>
                   </div></li>
                   <li><div>
                   <div class="bookImg"><a href = "#">책 사진</a></div>
                	<div class="info">
                	<p><a href=#>제목2</a></p>
                	</div>
                   </div></li>
                   <li><div>
                   <div class="bookImg"><a href = "#">책 사진</a></div>
                	<div class="info">
                	<p><a href=#>제목2</a></p>
                	</div>
                   </div></li>
               </ul>
               </div>
            </div>
         </div>
    </div>
    <br>
    <jsp:include page="/views/common/footer.jsp" />
    
	<script>
		$(function(){
			var userNo = $("#userNo").val();
			if(!(typeof userNo == "undefined")){
				$.ajax({
				    url: '/alert/alertList.do',
				    method: 'get',
				    data : {userNo:userNo},
				  	success:function(data){
				  		//console.log(data.length);
				  		console.log(data);
				  		var num = 0;
				  		$(data).each(function(index, item){
							var alertt = "<div class='alert alert-primary alert-dismissible fade show alert-div' role='alert'></div>";
							var strongg = "'<strong>"+data[index].bookName+"</strong>' 의 반납일이 1일 남았습니다.";
							var buttonn = "<button type='button' class='close' data-dismiss='alert' aria-label='close' value='"+data[index].bookRentalNo+"'></button>";
							var spann = "<span aria-hidden='true' class='close-btn'>&times;</span>";
							
							if(data[index].chk==0){
								$(".alert-wrap").append(alertt);
								$(".alert-div").eq(num).append(strongg);
								$(".alert-div").eq(num).append(buttonn);
								$(".close").eq(num).append(spann);
								num++;
							}
				  		});
				  	}
				}); 
			}
		});
		
		//$(".clost-btn").click(function(){}); 를 사용하면 동적으로 생성된 태그들은 이벤트 적용이 되지 않음.
		$(document).on("click",".close",function(){  
			//close-btn을 클릭하면 ajax로 해당 bookRentalNo를 넘겨서 alert에서 검색 후 read를 1로 변경함. 알림은 read가 0일때만 띄워줌
			var idx = $(".close").index(this);
			var bookRentalNo = $(".close").eq(idx).val();
			$.ajax({
				url : "/alert/countChk.do",
				type : "get",
				data : {bookRentalNo : bookRentalNo},
				success:function(data){
					if(data<0){
						alert("알림 삭제 실패.\n관리자에게 문의하세요.");
					}
				}
			});
		});
	</script>
</body>
</html>
