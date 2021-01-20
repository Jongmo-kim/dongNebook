<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<body>
<script>
	if('${result}' === 'true'){

	Swal.fire({
		  icon: 'success',
		  title: '${msg}',
		  text: '${subMsg}'
		}).then((result) => {
			location.href='${loc}';
		});
	} else {
		Swal.fire({
			  icon: 'error',
			  title: '${msg}',
			  text: '${subMsg}'
			}).then((result) => {
				location.href='${loc}';
			});
	}
</script>
</body>
</html>