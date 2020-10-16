<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
	.error{
	color:red;
	}
</style>
<link href="<%=request.getContextPath()%>/resources/assets/js/validate.js">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	
	<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	
	<style>
		.error{
		color:red;
		}
	</style>
	
	<script type="text/javascript">
	
	$(document).ready(function() {
		$("#email").change(function() {
			var selected1 = $('#email').val();
			console.log(selected1);
			$.ajax({
				url : '${pageContext.request.contextPath}/register/validation',
				data:{email:selected1},
				type:'POST',
				async: true,
				success : function(data) {
							console.log(data);
						if(data=="email is already exist"){
							$("#emailresult").html(data);
							//alert("wrong");
							return false;
						}
						else{
							return true;
						}
						
						//$(':input[type="submit"]').prop('disabled', true);
						//$(':input[type="submit"]').prop('disabled', false);	
						
						//return false;
							},
							/*error:function(){
								$(':input[type="submit"]').prop('disabled', false);	
							}*/
			});
		});
	});
	</script>
</head>
<body>
	<div class="d-flex justify-content-center">
	<form:form action="register" method="post" modelAttribute="user">
		<!-- action="save" -->
		
		<div class="form-group">
			<label for="fullname">Full Name</label>
			<form:input path="fullname" class="form-control" type="text" /><form:errors path="fullname" class="error"/>
		</div>

		<div class="form-group">
			<label for="Email">Email</label>
			<form:input type="text" class="form-control" id="email" path="email" /><form:errors path="email" class="error"/>
			 <span id="emailresult" class="error"></span>
		</div>

		<div class="form-group">
			<label for="Phone no">Phone no</label>
			<form:input type="text" class="form-control" path="phoneno"/>
			<form:errors path="phoneno" class="error"/>
		</div>

		<div class="form-group">
			<label for="Password">Password</label>
			<form:input type="password" class="form-control" path="password"
				placeholder="" /><form:errors path="password" class="error"/>
		</div>

		<br>
		<button type="submit" name="submit" class="btn btn-primary" >Submit</button>
		<br>
	Already have an account then click <a href="<%=request.getContextPath()%>/login"> login</a>
	</form:form>
	</div>
</body>
</html>