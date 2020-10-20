<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<title>Insert title here</title>
<style>
.color1 {
	background-color: black;
}
</style>
</head>
<body>
	 <nav class="navbar navbar-expand-lg navbar-light bg-dark">
		<a class="navbar-brand text-white" href="#">RGems</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link text-white"
					href="<%=request.getContextPath()%>/addproduct">AddProduct <span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link text-white"
					href="<%=request.getContextPath()%>/viewlist">ViewProduct</a></li>
				<li class="nav-item"><a class="nav-link text-white"
					href="<%=request.getContextPath()%>/productlist">ProductList </a> <!-- ${sessionScope.username}-->
				</li>
				<li class="nav-item"><a class="nav-link text-white"
					href="<%=request.getContextPath()%>/dashboard">Dashboard </a> <!-- ${sessionScope.username} -->
				</li>
			</ul>

		</div>
		<ul class="navbar-nav ml-md-auto">
			<li class="nav-item "><a class="nav-link " 
				href="<%=request.getContextPath()%>/shoppingcart"><i class="fa fa-shopping-cart " style="font-size:30px;color:lightblue"></i><span class="cart-badge" style="color:white;vertical-align: top;" id="counter">0</span></a>
			</li>
			<li class="nav-item  "><a class="nav-link text-white"
				href="<%=request.getContextPath()%>/logout">Logout</a></li>
			
		</ul>
	</nav>
	
</body>

<script type="text/javascript">
	$(function() {
		$.ajax({
			url : '${pageContext.request.contextPath}/shoppingcartcounter/',
			success : function(data, status) {
				console.log(data + " " + status);
				if (data == 0) {
					$('#counter').html(0);
				} else {
					$('#counter').html(data);
				}

			}
		});
	});
</script>

</html>