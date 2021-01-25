<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동네 북</title>
<jsp:include page="/views/common/linkHead.jsp"/>
<link href="../css/index/index2.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="/js/index/index.js"></script>
<style>
	.alert{
		margin-bottom: 2px;
	}
	.autor{
		
	}
.container {
  	width: 80%;
    height: 80%;
    margin: 0 auto;
    text-align: center;
    padding-top: 20px;
    z-index: 1;
    padding-left: 23px;
    perspective: 3000px;
}

.container .book {
 width: 180px;
    height: 270px;
    position: relative;
    display: block;
    /* width: 400px; */
    /* height: 550px; */
   
    border-radius: 2px 4px 4px 2px;
    background: linear-gradient(45deg, #DAD5DC 0%, #f2ebf4 100%);
    font-family: acumin-pro, sans-serif;
    -webkit-box-shadow: 13px 13px 8px 0px rgba(151, 146, 153,0.6);
    -moz-box-shadow: 13px 13px 8px 0px rgba(151, 146, 153,0.6);
    box-shadow: 13px 13px 8px 0px rgba(151, 146, 153,0.6);
    font-weight: 400;
    color: #2b2b2b;
    -webkit-transform-style: preserve-3d;
    -moz-transform-style: preserve-3d;
    transform-style: preserve-3d;
    -webkit-transition: -webkit-transform .5s;
    -moz-transition: -moz-transform .5s;
    transition: transform .5s;
}

.container .book:hover {
  -webkit-transform: rotate3d(0,1,0,35deg);
  -moz-transform: rotate3d(0,1,0,35deg);
  transform: rotate3d(0,1,0,35deg);
}

.container .book > div,
.container .front > div {
  display: block;
  position: absolute;
}


.container .front {
  -webkit-transform-style: preserve-3d;
  -moz-transform-style: preserve-3d;
  transform-style: preserve-3d;
  -webkit-transform-origin: 0% 50%;
  -moz-transform-origin: 0% 50%;
  transform-origin: 0% 50%;
  -webkit-transition: -webkit-transform .5s;
  -moz-transition: -moz-transform .5s;
  transition: transform .5s;
  -webkit-transform: translate3d(0,0,20px);
  -moz-transform: translate3d(0,0,20px);
  transform: translate3d(0,0,20px);
  z-index: 10;
}

.container .front > div {
  width: 400px;
  height: 550px;
}

.container .left-side{
  width: 40px;
  left: -20px;
  height: 270px;
  background-color: rgba(232,229,234);
  -webkit-transform: rotate3d(0,1,0,-90deg);
  -moz-transform: rotate3d(0,1,0,-90deg);
  transform: rotate3d(0,1,0,-90deg);
}

.container .front > div {
  border-radius: 0 3px 3px 0;
  box-shadow: 
    inset 4px 0 10px rgba(0, 0, 0, 0.1);
}

.container .front:after {
  content: '';
  position: absolute;
  top: 1px;
  bottom: 1px;
  left: -1px;
  width: 1px;
}

.container .cover:after {
  content: '';
  position: absolute;
  top: 0;
  left: 10px;
  bottom: 0;
  width: 3px;
  background: rgba(0,0,0,0.1);
  box-shadow: 1px 0 3px rgba(255, 255, 255, 0.1);
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
	<jsp:include page="/views/common/linkReview.jsp" />
	<jsp:include page="/views/common/reviewModal.jsp" />
	 <div class="content">
       <div class="img-main">

            <div style="position:relative">

                <!--가로-->
                <!-- <img class="d-block w-100" src="../image/index/img.png" alt="First slide"> -->
                <img class="d-block w-100" src="../image/index/greenwinter.jpg" alt="First slide">
				<div class="searchBox">
		<div class="searchFrm">
			<form action="/book/searchBook.do" name="searchBook" method="get" >
				<input type="hidden" name="reqPage" value="1">
				<div class="inputField">
					<input type="hidden" name="searchKeyword" value="전체">
					<input type="text" id="searchFrm" name="inputStr" autocomplete="off">
					<div class="icon-wrap">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
							<path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path>
						</svg>
					</div>
				</div>
				
			</form>
		</div>
		<div class="guessedBox">
			
		</div>
	</div>
            </div>


        </div>

        <div class="sub-description">
        <div>
            <p>대출베스트</p>
            </div>
        </div>
        <div class="sub-item">
            <div>
                <div class="book-rank-frame" id="rank-first-frame">
                	<div class="book-rank"></div>
                    <div class="container">
						<div class="book">
							<div class="book-img"></div>
						<div class="front">
				
						</div>
						<div class="left-side">
						
					</div>
					</div>
                    <input type="hidden" class="book-no">
					</div>
                    <div class="book-info">
                    	<h3 class="book-title"></h3>
                    	<h4 class="autor"></h4>
                    </div>
                </div>
                <div class="book-rank-frame">
                <div class="book-rank"></div>
                    <div class="container">
						<div class="book">
							<div class="book-img"></div>
						<div class="front">
				
						</div>
						<div class="left-side">
						
					</div>
					</div>
                    <input type="hidden" class="book-no">
					</div>
                    <div class="book-info">
                    	<h3 class="book-title"></h3>
                    	<h4 class="autor"></h4>
                    </div>
                </div>
                <div class="book-rank-frame">
                <div class="book-rank"></div>
                    <div class="container">
						<div class="book">
							<div class="book-img"></div>
						<div class="front">
				
						</div>
						<div class="left-side">
						
					</div>
					</div>
                    <input type="hidden" class="book-no">
					</div>
                    <div class="book-info">
                    	<h3 class="book-title"></h3>
                    	<h4 class="autor"></h4>
                    </div>
                </div>
                <div class="book-rank-frame">
                <div class="book-rank"></div>
                    <div class="container">
						<div class="book">
							<div class="book-img"></div>
						<div class="front">
				
						</div>
						<div class="left-side">
						
					</div>
					</div>
                    <input type="hidden" class="book-no">
					</div>
                    <div class="book-info">
                    	<h3 class="book-title"></h3>
                    	<h4 class="autor"></h4>
                    </div>
                </div>
                <div class="book-rank-frame">
                <div class="book-rank"></div>
                    <div class="container">
						<div class="book">
							<div class="book-img"></div>
						<div class="front">
				
						</div>
						<div class="left-side">
						
					</div>
					</div>
                    <input type="hidden" class="book-no">
					</div>
                    <div class="book-info">
                    	<h3 class="book-title"></h3>
                    	<h4 class="autor"></h4>
                    </div>
                </div>
            </div>
        </div>

    </div>
    </div>
    <br>
    <jsp:include page="/views/common/footer2.jsp" />
    
  
  
 
	<script>
	 location.reload;
	$(function(){
		var userNo = $("#userNo").val();
	      if(!(typeof userNo == "undefined")){
	         $.ajax({
	            url : '/proposalAlert/proposalAlert.do',
	            method : 'get',
	            data : {userNo : userNo},
	            success : function(data){
	               
	                  var num = 0;
	                  $(data).each(function(index,item){
	                     
	                     if(data[index].isproposal=='n'){
	                        var alertt = "<div class='alert alert-danger alert-dismissible fade show alert-div' role='alert'></div>";
	                        var strongg = "신청하신 책 '<strong>"+data[index].bookName+"</strong>'이 반려되었습니다.";
	                        var buttonn = "<button type='button' class='close pdelete' data-dismiss='alert' aria-label='close' value='"+data[index].alertNo+"'></button>";
	                        var spann = "<span aria-hidden='true' class='close-btn'>&times;</span>";
	                        
	                        if(data[index].chk==0){
	                           $(".alert-wrap").append(alertt);
	                           $(".alert-div").eq(num).append(strongg);
	                           $(".alert-div").eq(num).append(buttonn);
	                           $(".close").eq(num).append(spann);
	                           num++;
	                        }
	                     }else{
	                        var alertt = "<div class='alert alert-info alert-dismissible fade show alert-div' role='alert'></div>";
	                        var strongg = "신청하신 책 '<strong>"+data[index].bookName+"</strong>'이 승인되었습니다.";
	                        var buttonn = "<button type='button' class='close pdelete' data-dismiss='alert' aria-label='close' value='"+data[index].alertNo+"'></button>";
	                        var spann = "<span aria-hidden='true' class='close-btn'>&times;</span>";
	                        
	                        if(data[index].chk==0){
	                           $(".alert-wrap").append(alertt);
	                           $(".alert-div").eq(num).append(strongg);
	                           $(".alert-div").eq(num).append(buttonn);
	                           $(".close").eq(num).append(spann);
	                           num++;
	                        }
	                     }
	                     
	                  });
	            }
	            
	         });
	      };
	   });
	
	$(document).on("click",".pdelete",function(){ 
		
		var idx = $(".pdelete").index(this);
		var alertNo = $(".pdelete").eq(idx).val();
		$.ajax({
			url : "/proposalAlert/deleteP.do",
			type : "get",
			data : {alertNo : alertNo},
			success:function(data){
				
				if(data == '0'){
					alert("알림 삭제 실패.\n관리자에게 문의하세요.");
				}
			}
		});
	});
	
		$(function(){
			var userNo = $("#userNo").val();
			if(!(typeof userNo == "undefined")){
				$.ajax({
				    url: '/alert/alertList.do',
				    method: 'get',
				    data : {userNo:userNo},
				  	success:function(data){
				  		//console.log(data.length);
				  		
				  		var num = 0;
				  		$(data).each(function(index, item){
							var alertt = "<div class='alert alert-primary alert-dismissible fade show alert-div' role='alert'></div>";
							var strongg = "'<strong>"+data[index].bookName+"</strong>' 의 반납일이 1일 남았습니다.";
							var buttonn = "<button type='button' class='close returnAlert' data-dismiss='alert' aria-label='close' value='"+data[index].bookRentalNo+"'></button>";
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
			$.ajax({
				url : "/rank/rankFive.do",
				type : "get",
				data : {},
				success:function(data){
					
						var rank= document.getElementsByClassName("book-img");
						var title= document.getElementsByClassName("book-title");
						var autor= document.getElementsByClassName("autor");
						var number=document.getElementsByClassName("book-no");
						
					for(var i=0;i<5;i++){
						//let cover500 = data.item[i].cover.replace(/coversum/g,'cover500');
						
						var bookName=data[i].bookName;
						var bookWriter;
						if(data[i].bookWriter==undefined){
							
							bookWriter="작가미상";
							
						}else{							
							bookWriter=data[i].bookWriter;
						}
						if(bookName.length>10){
							
							bookName= data[i].bookName.substring(0,9)+"...";
							
							
						}
						if(bookWriter.length>13){
							bookWriter=data[i].bookWriter.substring(0,13)+"...";
							
						}
						rank[i].innerHTML='<img src="' +data[i].imageurl+ '" />';
						number[i].value=data[i].bookNo;
						title[i].innerHTML=bookName;
						autor[i].innerHTML=bookWriter;
						
					}
				}
			});
		});
		
		//$(".clost-btn").click(function(){}); 를 사용하면 동적으로 생성된 태그들은 이벤트 적용이 되지 않음.
		$(document).on("click",".returnAlert",function(){  
			//close-btn을 클릭하면 ajax로 해당 bookRentalNo를 넘겨서 alert에서 검색 후 read를 1로 변경함. 알림은 read가 0일때만 띄워줌
			var idx = $(".returnAlert").index(this);
			var bookRentalNo = $(".returnAlert").eq(idx).val();
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
		$('.book').click(function(){
			$(this).next().trigger('click');
		});
		$('.book-no').click(function(){
			location.href="/book/selectOneBook.do?bookNo="+$(this).val()+"";
		});
	</script>
	<script>
	


</script>
</body>

</html>
