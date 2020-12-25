<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<c:choose>
<c:when test="${loginUser == null }">
<ul>
	<li><a href="/user/signupFrm.do">회원가입</a></li>
	<li><a href="/user/loginFrm.do">로그인</a></li>
</ul>
</c:when>
<c:otherwise>
<ul>
	<li><a href="/user/mypageFrm.do">마이페이지</a></li>
	<li><a href="/user/logout.do">로그아웃</a></li>
	<li><a href="/user/delete.do?userNo=${loginUser.userNo }">회원탈퇴</a></li>
</ul> 
</c:otherwise>
</c:choose>
