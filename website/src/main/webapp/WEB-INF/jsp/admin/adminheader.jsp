<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-dark">
		<a class="navbar-brand text-white" href="<%=request.getContextPath()%>/adminhome">Home</a>
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
					href="<%=request.getContextPath()%>/viewlist">ViewProducts</a></li>
				<li class="nav-item"><a class="nav-link text-white"
					href="<%=request.getContextPath()%>/dashboard">Dashboard </a></li>
			</ul>
		</div>
		<ul class="navbar-nav ml-md-auto">
			<li class="nav-item  "><a class="nav-link text-white"
				href="<%=request.getContextPath()%>/logout">Logout</a></li>
		</ul>
	</nav>

</body>
</html>