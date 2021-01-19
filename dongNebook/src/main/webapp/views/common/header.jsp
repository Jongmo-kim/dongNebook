<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<header>
    <div class="nav-bar">
    	<div class="nav-board">
    		<i class="fas fa-clipboard"></i>
    	</div>
    	<div class="nav-chat">
    		
    		<a onclick="openWindow()">
    			<i class="fas fa-bell"></i>
    		</a>
    	</div>
    </div>
            <div class="header">
                <div class="menu-frame">
                    <div>
                        <div class="main-img">

							<a href="/">
                            	<img src="../image/header/DongNeBook2nd.png">
                        	</a>
                        </div>
                        <div class="main-menu">
                            <ul class="menu-list">
                                <li>
                                    <a href="/book/searchBookFrm.do">Book</a>
                                </li>
                                <li>
                                    <a href="/calendar/calendarView.do">Service</a>
                                </li>
                                <li>
                                    <a href="/notice/noticeList.do?reqPage=1">Notice</a>
                                </li>
                            </ul>
                        </div>

                        <div class="mem-sel">
                            <ul>
                            <c:choose>
								<c:when test="${loginUser == null }">
									<c:choose>
										<c:when test="${loginAdmin == null }">
			                                <li>
			                                    <a href="/user/loginFrm.do">Login</a>
			                                </li>
			                                <li>
			                                    <a href="/user/signupFrm.do">Join</a>
			                                </li>
			                             </c:when>
								<c:otherwise>
									<li>
			                            <a href="/aladin/searchInAladin.do">Admin</a>
			                        </li>
									<li>
			                        	<a href="/admin/logout.do">Logout</a>
			                        </li>
			                    </c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<li>
			                            <a href="/user/mypageFrm.do">MyPage</a>
			                        </li>
									<li>
			                        	<a href="/user/logout.do">Logout</a>
			                        </li>
			                        <li>
			                        	<a href="/user/delete.do?userNo=${loginUser.userNo }">
Withdrawal</a>
			                        </li>
			                        </c:otherwise>
								</c:choose>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="search-frame"></div>
</header>
