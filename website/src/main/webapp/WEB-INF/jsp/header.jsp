<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	.color1{
		background-color:black;
	}
	
</style>
</head>
<body>	
	<nav class="navbar navbar-expand-lg navbar-light bg-dark">
  <a class="navbar-brand text-white" href="#">RGems</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link text-white" href="<%=request.getContextPath()%>/addproduct">AddProduct <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-white" href="<%=request.getContextPath()%>/viewlist">ViewProduct</a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-white" href="<%=request.getContextPath()%>/productlist">ProductList  </a>
      <!-- ${sessionScope.username} --> 
      </li>
      <li class="nav-item">
        <a class="nav-link text-white" href="<%=request.getContextPath()%>/dashboard">Dashboard  </a>
      <!-- ${sessionScope.username} --> 
      </li>   
    </ul>
     
  </div>
  <ul class="navbar-nav ml-md-auto">   
	      <li class="nav-item  " >
	        <a class="nav-link text-white" href="<%=request.getContextPath()%>/shoppingcart">Shopping Cart</a>
	      </li>
	      <li class="nav-item  " >
	        <a class="nav-link text-white" href="<%=request.getContextPath()%>/logout">Logout</a>
	      </li>
    </ul>
</nav>
</body>
</html>