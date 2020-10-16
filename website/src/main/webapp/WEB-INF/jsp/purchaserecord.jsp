<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">


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

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">

<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>

<title>Insert title here</title>
<script>
	$(document).ready(function() {
		$('#purchase').DataTable({
			"order" : [ [ 0, "asc" ] ],
			"lengthMenu" : [ [ 4, 8, 12, -1 ], [ 4, 8, 12, "All" ] ]

		});
	});
</script>
</head>
<body>
	
	<div class="top">
		<table class="table table-bordered specific" border="2" width="70%"
			cellpadding="2" id="purchase">
			<thead class="bg-primary text-dark">
				<tr>
					<th scope="col">orderid</th>
					<th scope="col">productid</th>
					<th scope="col">customerid</th>
					<th scope="col">ordertime</th>
					<th scope="col">productprice</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="purchase" items="${list}">
					<tr>
						<td>${purchase.orderid}</td>
						<td>${purchase.productid}</td>
						<td>${purchase.customerid}</td>
						<td>${purchase.ordertime}</td>
						<td>${purchase.productprice}</td>
						<!-- <td><button type="button" class="btn btn-primary" name="view" value="${emp1.id}" id="view">view</button>
					</td>-->
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>