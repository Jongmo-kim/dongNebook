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
</style>
</head>
<body>
	<div class="alert-wrap">
	</div>
	<c:if test="${sessionScope.loginUser !=null}">
		<input type="hidden" id="userNo" value=${sessionScope.loginUser.userNo }>
	</c:if>
	<jsp:include page="/views/common/header2.jsp" />
	
	 <div class="content">
       <div class="img-main">

            <div>

                <!--가로--> <img class="d-block w-100" src="../image/index/img.png" alt="First slide">

            </div>


        </div>

        <div class="sub-description">
            <p>대출순위</p>
        </div>
        <div class="sub-item">
            <div>
                <div class="book-rank-frame">
                	<div class="book-rank"></div>
                    <div class="book-img"><img src="https://image.aladin.co.kr/product/24788/21/cover/k342631735_1.jpg"></div>
                    <div class="book-info"></div>
                </div>
                <div class="book-rank-frame">
                <div class="book-rank"></div>
                    <div class="book-img"></div>
                    <div class="book-info"></div>
                </div>
                <div class="book-rank-frame">
                <div class="book-rank"></div>
                    <div class="book-img"></div>
                    <div class="book-info"></div>
                </div>
                <div class="book-rank-frame">
                <div class="book-rank"></div>
                    <div class="book-img"></div>
                    <div class="book-info"></div>
                </div>
                <div class="book-rank-frame">
                <div class="book-rank"></div>
                    <div class="book-img"></div>
                    <div class="book-info"></div>
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
					
						/*var rank= document.getElementsByClassName("book-img");
						console.log(data);
					for(var i=0;i<5;i++){
						let cover500 = data.item[i].cover.replace(/coversum/g,'cover500');
						console.log(i);
						console.log(rank[i]);
						rank[i].innerHTML='<img src="' +cover500+ '" />';
						
						
					}*/
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
	function openWindow(){
		if(${loginUser!=null}){
			var ret = window.open("/chat/chatRoom.do?chatUser=admin", "PopupWin", "width=500,height=600,left=12000");			
		}else{
			alert("놉");
		}
	}
</script>
</body>

</html>
