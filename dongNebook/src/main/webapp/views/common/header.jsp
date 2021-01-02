<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h3>common</h3>
<ul>
	<li><a href="/common/mailSendFrm.do">메일보내기 </a></li>
	<li><a href="/views/common/test.jsp">테스트페이지</a></li>
	<li><a href="/book/searchBookFrm.do">책 검색하기</a></li>
</ul>
<c:choose>
<c:when test="${loginUser == null }">
<hr>
<h3>user</h3>
<ul>
	<li><a href="/user/signupFrm.do">회원가입</a></li>
	<li><a href="/user/loginFrm.do">로그인</a></li>
	<li><a href="/user/idSearchFrm.do">ID 찾기</a></li>
	<li><a href="/user/pwSearchFrm.do">비밀번호 찾기</a></li>
</ul>
</c:when>
<c:otherwise>
<hr>
<h3>user</h3>
<ul>
	<li><a href="/user/mypageFrm.do">마이페이지</a></li>
	<li><a href="/user/logout.do">로그아웃</a></li>
	<li><a href="/user/delete.do?userNo=${loginUser.userNo }">회원탈퇴</a></li>
</ul> 
</c:otherwise>
</c:choose>
