<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<style>
.error {
	color: red;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<!-- <div class="d-flex justify-content-center"> -->

				<form:form action="login" method="post" name="login"
					modelAttribute="login">

					<div class="form-group">
						<label for="username">Username</label>
						<form:input type="text" class="form-control" path="username"
							placeholder="Please enter your username as email id " />
						<form:errors path="username" class="error" />
					</div>

					<div class="form-group">
						<label for="Password">Password</label>
						<form:input type="password" class="form-control" path="password" />
						<form:errors path="password" class="error" />
					</div>

					<div class="form-group error">
						<c:out value="${message}"></c:out>
					</div>

					<br>
					<button type="submit" class="btn btn-primary">Submit</button>
					<br>New Member then register here <a
						href="<%=request.getContextPath()%>/register">Register</a>
					<br>Forget Password <a
						href="<%=request.getContextPath()%>/forgetpassword">Forgot
						Password</a>
				</form:form>
			</div>
		</div>
	</div>
	<!--  	</div>-->
</body>
</html>