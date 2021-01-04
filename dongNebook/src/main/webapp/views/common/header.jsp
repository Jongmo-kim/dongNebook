<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header>
    <div class="menu">
       <div class="logo"><a href="/"><img src="../image/header/logo.png"></a></div>
        <ul class="menu-frame">
            <li class="menu1" id="menu-start"><a href="#">조장님</a>
                <div class="sub-frame">
                    <ul class="sub" id="menu-sub-start">
                        	<li><a href="/views/rental/rental_loc.jsp">상호대차페이지</a></li>
							<li><a href="/book/bookList.do?reqPage=1">북리스트페이지</a></li>
                    </ul>
                    <ul class="sub">
                        <li><a href="/notice/noticeList.do?reqPage=1">공지사항 리스트</a></li>
                    </ul>
                    <ul class="sub">
                        <li><a href="/common/mailSendFrm.do">메일보내기 </a></li>
						<li><a href="/views/common/test.jsp">테스트페이지</a></li>
						<li><a href="/book/searchBookFrm.do">책 검색하기</a></li>
                    </ul>
                    <ul class="sub">
                        <li><a href="#">메뉴</a></li>
                    </ul>
               </div>
            </li>
            <li class="menu1"><a href="#">공지사항</a>

            </li>
            <li class="menu1"><a href="#">common</a>

            </li>
            <li class="menu1"><a href="#">남은 메뉴</a>

            </li>
        </ul>
        <div class="member-sign">
        <c:choose>
			<c:when test="${loginUser == null }">
				<a href="/user/signupFrm.do">회원가입</a>
				<a href="/user/loginFrm.do">로그인</a>
				<a href="/user/idSearchFrm.do">ID 찾기</a>
				<a href="/user/pwSearchFrm.do">비밀번호 찾기</a>
			</c:when>
			<c:otherwise>
				<a href="/user/mypageFrm.do">마이페이지</a>
				<a href="/user/logout.do">로그아웃</a>
				<a href="/user/delete.do?userNo=${loginUser.userNo }">회원탈퇴</a>
			</c:otherwise>
		</c:choose>
    </div>
    </div>
</header>
