<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 쓰기</title>
<jsp:include page="/views/common/linkHead.jsp"/>
<link rel="stylesheet" href="/lib/choices/choices.min.css" type="text/css">
<script src="/lib/choices/choices.min.js" type="text/javascript"></script>


</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	<h2>리뷰 쓰기</h2>
	<hr>
	<div class="content">
	<form action="/review/write.do" method="post">
		<input type="hidden" name="userNo" value="${sessionScope.loginUser.userNo }">
		<textarea rows="5" name="content" cols="50" style="resize:none;">왕</textarea>
		
		<select class="form-control" name="choices" id="choices" placeholder="This is a placeholder" multiple>
<option value="">Choose a city</option>
<optgroup label="UK">
<option value="London">London</option>
<option value="Manchester">Manchester</option>
<option value="Liverpool">Liverpool</option>
</optgroup>
<optgroup label="FR">
<option value="Paris">Paris</option>
<option value="Lyon">Lyon</option>
<option value="Marseille">Marseille</option>
</optgroup>
<optgroup label="DE" >
<option value="Hamburg">Hamburg</option>
<option value="Munich">Munich</option>
<option value="Berlin">Berlin</option>
</optgroup>
<optgroup label="US">
<option value="New York">New York</option>
<option value="Washington" disabled>Washington</option>
<option value="Michigan">Michigan</option>
</optgroup>
<optgroup label="SP">
<option value="Madrid">Madrid</option>
<option value="Barcelona">Barcelona</option>
<option value="Malaga">Malaga</option>
</optgroup>
<optgroup label="CA">
<option value="Montreal">Montreal</option>
<option value="Toronto">Toronto</option>
<option value="Vancouver">Vancouver</option>
</optgroup>
</select>
		<button>제출하기</button>
	</form>
	</div>
	<script>
    var multipleDefault = new Choices(
            document.getElementById('choices')
          );
	</script>
</body>
</html>