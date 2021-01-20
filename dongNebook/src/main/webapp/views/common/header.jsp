<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.fa-clipboard, .fa-bell {
	cursor: pointer;
}
</style>
<header>
	<div class="header">
		<div class="menu-frame">
			<div>
				<div class="main-img">
					<a href="/"> <img src="../image/header/DongNeBook2nd.png">
					</a>
				</div>
				<div class="main-menu">
					<ul class="menu-list">
						<li><a href="/book/searchBookFrm.do">Book</a></li>
						<li><a href="/calendar/calendarView.do">Service</a></li>
						<li><a href="/notice/noticeList.do?reqPage=1">Notice</a></li>
					</ul>
				</div>



				<div class="mem-sel">
					<ul>
						<c:choose>
							<c:when test="${loginUser == null }">
								<c:choose>
									<c:when test="${loginAdmin == null }">
										<li><a href="/user/loginFrm.do">로그인</a></li>
										<li><a href="/user/signupFrm.do">회원가입</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="/aladin/searchInAladin.do">관리자</a></li>
										<li><a href="/admin/logout.do">로그아웃</a></li>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<li><a href="/user/mypageFrm.do">마이페이지</a></li>
								<li>
									<!-- <i class="fas fa-clipboard"></i> --> <a href="#">도서 추천</a>
								</li>
								<li><a href="/user/logout.do">로그아웃</a></li>
								<li><a onclick="openWindow()"> <!-- <i class="fas fa-bell"></i> -->
										<i class="fas fa-lg fa-bell"></i>
								</a></li>
								<%-- <li>
			                        	<a href="/user/delete.do?userNo=${loginUser.userNo }">Withdrawal</a>
			                        </li> --%>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="search-frame"></div>
</header>
