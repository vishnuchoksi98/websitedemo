<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	
<style type="text/css">
	.error{
	color:red;
	}
</style>
</head>
<body>
	<div class="container w-25">
		<form:form action="forgetpassword" method="post" name="forgetpassword"
			modelAttribute="forgetpassword">


			<div class="form-group">
				<label for="Email">Please Enter Email</label>
				<form:input type="text" class="form-control" id="username"
					path="username" />
			</div>

			<br>
			<button type="submit" class="btn btn-primary">Submit</button>
			<br>
			<div class="error">
			<c:out value="${ error}"></c:out></div>
			If you Remember then <a href="<%=request.getContextPath()%>/login">Login</a>
		</form:form>
	</div>
</body>
</html>