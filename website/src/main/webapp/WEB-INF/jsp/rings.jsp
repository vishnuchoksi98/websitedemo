<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	isELIgnored="false" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<title>Insert title here</title>
<style>
.round {
	margin-left: 40px;
	margin-top: 30px;
}
</style>
</head>
<body>
	<div class="">
		<table>
			<tr>
			</tr>
		</table>
	</div>

	<div class="card round" style="width: 18rem;">
		<!-- <img width="50%" height="50%"
			src="<%=request.getContextPath()%>/resources/${command.getFilename()}"
			alt="Card image cap">-->
			
			<img width="50%" height="50%"
			src="<%=request.getContextPath()%>/getStudentPhoto/<c:out value='${command.getId()}'></c:out>"
			alt="Card image cap">
			
		<div class="card-body">
			<h5 class="card-title">
				<c:out value="${command.getName()}"></c:out>
			</h5>
			<p class="card-text">
				Price:
				<c:out value="${command.getPrice()}"></c:out>.Rs
			</p>
			<p class="card-text">
				Gold:
				<c:out value="${command.getGweight()}"></c:out>gm
				</p>
				<a href="#" class="btn btn-primary">Buy Now</a>
		</div>
	</div>
</body>
</html>