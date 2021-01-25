<!-- @author 진수경 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<jsp:include page="/views/common/linkHead.jsp"/>
<style>
.main-wrap{
	width:1200px;
	margin:0 auto;
}
table{
text-align:center;
}
table>tbody>tr>td{
cursor: pointer;}
.adminSideMenu li:nth-child(6) a{
   	background:#a8dba8;
	color:white;
}
#noticeTitle{
	cursor: pointer;
}
.page:hover, .previous:hover, .next:hover{
	text-decoration: none;
	color:#a8dba8;
}
.pagination{
	margin : 0 auto;
	margin-top : 50px;
	margin-bottom : 50px;
	
	}
	.pagination>li>a{
        color: #79bd9a;
        border:none;
        }
	.pagination>li>.selectPage{
	color: black; 
	border:none;
	}
	.pagination>li>a:hover{
	color : #79bd9a;
	}
.SideMenu li:nth-child(5) a{
background:#a8dba8;
	color:white;
}
.admin-button{
	text-align: right;

    margin-bottom: 5rem;
}
.notice-table{
	margin-bottom:3rem !important;
}
</style>
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	<div class="contents-frame">
	<div class="contents">
	<c:choose>
	<c:when test="${sessionScope.loginAdmin !=null}">
	<jsp:include page="/views/common/adminSide.jsp" />
	</c:when>
	<c:otherwise>
		<jsp:include page="/views/common/userSide.jsp" />
	</c:otherwise>
	</c:choose>
	<div class="admin-contents">
	
	<div id="main-container" class="main-container nav-effect-1">
	<h1 style="font-size:30px;">공지사항</h1>
	<hr>
	<table class="table table-hover notice-table">
		<tr>
			<c:if test="${sessionScope.loginAdmin!=null}">
				<th style="width:5%;"><input type="checkbox" class="allCheck"></th>
			</c:if>
			<th style="width:10%;">번호</th><th style="width:50%;">제목</th><th style="width:20%;">작성자</th><th style="width:15%;">작성일</th>
		</tr>
		<c:forEach items="${list }" var ="n">
			<tr>
				<c:if test="${sessionScope.loginAdmin!=null}">
					<td><input type="checkbox" name="noticeCheck" value=${n.noticeNo }></td>
				</c:if>
				<td onclick="noticeView(${n.noticeNo});">${n.rNum }</td><td id="noticeTitle" onclick="noticeView(${n.noticeNo});">${n.noticeTitle }</td><td onclick="noticeView(${n.noticeNo});">${n.noticeWriter }</td><td onclick="noticeView(${n.noticeNo});">${n.enrollDate }</td>			
			</tr>
		</c:forEach>
	</table>
	<c:if test="${sessionScope.loginAdmin!=null}">
	<div class="admin-button">
		<button onclick="insertNotice();" class="btn btn-lg btn-primary">작성하기</button>
		<button onclick="deleteNotice();" class="btn btn-lg btn-danger">삭제하기</button>
	</div>
	</c:if>
	<%-- <p style="text-align:center">${pageNavi }</p> --%>
	<div class = "pagination justify-content-center" id="pageNavi">${pageNavi }</div>
	</div>
	</div>
	
	</div>
	</div>
	
	<script>
		function noticeView(noticeNo){
			location.href="/notice/noticeView.do?noticeNo="+noticeNo;
		}
		$(function(){
			$(".allCheck").click(function (){
				//전체 체크
				if($(".allCheck").is(":checked") == true){
					$("input:checkbox[name=noticeCheck]").prop("checked",true);
				}
				//전체 체크 해제
				if($(".allCheck").is(":checked") == false){
					$("input:checkbox[name=noticeCheck]").prop("checked", false);
				}
			});
		});
		function insertNotice(){
			location.href="/notice/noticeFrm.do";
		}
		
		function deleteNotice(){
			//몇 번째 체크박스가 체크되어 있는지 확인
			var arr = new Array();
			$("input:checkbox[name=noticeCheck]:checked").each(function(idx,item){
			    arr.push($("input:checkbox[name=noticeCheck]:checked").eq(idx).val());
			});
			if(arr.length != 0){
				location.href="/notice/deleteNotice.do?noticeNo="+arr;
			} else {
				alert("삭제할 게시글을 선택하세요.");
			}
		}
	</script>
</body>
</html>