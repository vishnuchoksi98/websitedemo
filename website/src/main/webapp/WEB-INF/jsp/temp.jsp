<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<style type="text/css">
</style>
<script>
$(document).ready(function() {
	$('#example').DataTable({
		"order" : [ [ 0, "asc" ] ],
		"lengthMenu" : [ [ 4, 8, 12, -1 ], [ 4, 8, 12, "All" ] ]
	});
});
</script>
</head>
<body>
	<!-- <h1>${command.getFile()}</h1> -->
	<!-- <img width="auto" src="<%=request.getContextPath()%>/resources/${filename}"/> -->

	<!-- <div class="container top">
		<table class="table table-bordered specific" border="2" width="70%"
			cellpadding="2" id="example">
			<thead class="bg-primary text-dark">
				<tr>
					<th scope="col">custmerid</th>
					<th scope="col">FullName</th>
					<th scope="col">email</th>
					<th scope="col">PhoneNo</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="emp1" items="${list}">
					<tr>
						<td>${emp1.customerid}</td>
						<td>${emp1.fullname}</td>
						<td>${emp1.email}</td>
						<td>${emp1.phoneno}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
-->

	<form name="forgetpassword" action="/forgetpassword" method="post">
		<input type="text" name="email">
	</form>

</body>
</html>