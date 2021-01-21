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
       <div class="img-main">

            <div style="position:relative">

                <!--가로--> <img class="d-block w-100" src="../image/index/img.png" alt="First slide">
				<div class="searchBox">
		<div class="searchFrm" ">
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
                    <div class="book-img"></div>
                    <div class="book-info">
                    	<h3 class="book-title"></h3>
                    	<h4 class="autor"></h4>
                    </div>
                </div>
                <div class="book-rank-frame">
                <div class="book-rank"></div>
                    <div class="book-img"></div>
                    <div class="book-info">
                    	<h3 class="book-title"></h3>
                    	<h4 class="autor"></h4>
                    </div>
                </div>
                <div class="book-rank-frame">
                <div class="book-rank"></div>
                    <div class="book-img"></div>
                    <div class="book-info">
                    	<h3 class="book-title"></h3>
                    	<h4 class="autor"></h4>
                    </div>
                </div>
                <div class="book-rank-frame">
                <div class="book-rank"></div>
                    <div class="book-img"></div>
                    <div class="book-info">
                    	<h3 class="book-title"></h3>
                    	<h4 class="autor"></h4>
                    </div>
                </div>
                <div class="book-rank-frame">
                <div class="book-rank"></div>
                    <div class="book-img"></div>
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
				console.log(data);
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
				  		console.log(data);
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
						console.log(data);
						console.log(data[0]);
					for(var i=0;i<5;i++){
						//let cover500 = data.item[i].cover.replace(/coversum/g,'cover500');
						console.log(i);
						console.log(data[i].bookName.length);
						console.log(data[i].bookWriter);
						var bookName=data[i].bookName;
						var bookWriter;
						if(data[i].bookWriter==undefined){
							console.log("언디파인");
							bookWriter="작가미상";
							console.log("언디파인:"+bookWriter);
						}else{							
							bookWriter=data[i].bookWriter;
						}
						if(bookName.length>10){
							console.log("넘는다");
							bookName= data[i].bookName.substring(0,9)+"...";
							
							console.log(bookName);
						}
						if(bookWriter.length>13){
							bookWriter=data[i].bookWriter.substring(0,13)+"...";
							console.log("... 작가:"+bookWriter);
						}
						rank[i].innerHTML='<img src="' +data[i].imageurl+ '" />';
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
	</script>
	<script>
	


</script>
</body>

</html>
