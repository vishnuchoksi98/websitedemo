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

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<title>Insert title here</title>
<style>
.color1 {
	background-color: black;
}

.specific {
	margin-top: 20px;
	margin-left: 50px;
}

.specifictable {
	margin-top: 20px;
}

.sizing {
	width: 200px;
	height: 20%;
	margin-left: 100px;
}

.leftspace {
	padding-left: 10px;
}
</style>
<script>
	
</script>
</head>
<body>
	<jsp:include page="adminheader.jsp" />

	<button type="button" class="btn btn-primary specific"
		data-toggle="modal" data-target="#exampleModal">Add user</button>


	<div class="container top">
		<a href="<%=request.getContextPath()%>/download">Export Data </a>
		<div class="d-flex flex-row ">
			<div class="border border-dark">
				<table class="table table-striped specifictable w-50" id="example">
				<h4>User Data</h4>
					<thead class="text-dark">
						<tr>
							<th scope="col">custmerid</th>
							<th scope="col">FullName</th>
							<th scope="col">email</th>
							<th scope="col">PhoneNo</th>
							<th scope="col">Status</th>
							<!-- <th scope="col">Edit User</th> -->
						</tr>
					</thead>
					<tbody>
						<c:forEach var="emp1" items="${list}">
							<tr scope="row">
								<td>${emp1.customerid}</td>
								<td>${emp1.fullname}</td>
								<td>${emp1.email}</td>
								<td>${emp1.phoneno}</td>
								<td><c:if test="${emp1.status == 0 }">
										<div class="custom-control custom-switch">
											<input type="checkbox" class="custom-control-input"
												id="${emp1.customerid}" value="${emp1.status }"
												name="status"> <label class="custom-control-label"
												for="${emp1.customerid}"></label>
										</div>
									</c:if> <c:if test="${emp1.status == 1 }">
										<div class="custom-control custom-switch">
											<input type="checkbox" class="custom-control-input"
												id="${emp1.customerid}" value="${emp1.status }" checked>
											<label class="custom-control-label" for="${emp1.customerid}"></label>
										</div>
									</c:if>
									</td>
								<!--  <td><button type="button" id="${emp1.customerid}" class="btn btn-primary custome"
								data-toggle="model" data-target="#exampleModal1" value="${emp1.customerid}">Edit
								User</button></td>--> 
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="ml-4 border border-dark">
				<table class="table table-striped specifictable w-50" id="example">
				<h4>Sales Data</h4>
					<thead class="text-dark">
						<tr>
							<th scope="col">CustomerName</th>
							<th scope="col">Price</th>
							<th scope="col">CustmerId</th>
							<th scope="col">ProductName</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="emp1" items="${saleslist}">
							<tr scope="row">
								<td>${emp1.get(0).toString()}</td>
								<td>${emp1.get(1).toString()}</td>
								<td>${emp1.get(2).toString()}</td>
								<td>${emp1.get(3).toString()}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>



	<!-- Modal -->
	  <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add user</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form:form action="adduser" method="post" modelAttribute="addusers">
						<td><form:hidden path="customerid" id="customerid"
								name="customerid" /></td>

						<div class="form-group">
							<label for="username">Full Name</label>
							<form:input path="userfullname" id="userfullname"
								class="form-control" type="text" />
						</div>

						<div class="form-group">
							<label for="Email">Email</label>
							<form:input type="text" class="form-control" id="email"
								path="useremail" />
							<span id="emailresult" class="error"></span>
						</div>

						<div class="form-group">
							<label for="Phone no">Phone no</label>
							<form:input type="text" class="form-control" path="userphoneno" />
						</div>

						<div class="form-group">
							<label for="Password">Password</label>
							<form:input type="password" class="form-control"
								path="userpassword" placeholder="" />
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">User Role</label>
							<form:select type="text" class="form-control" path="usercategory"
								placeholder="">
								<option value="admin">Admin</option>
								<option value="user">User</option>
							</form:select>

						</div>
						<button type="submit" class="btn btn-primary">Save</button>
					</form:form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>
	
	<div class="sizing">

		<div class="card border-left-primary shadow h-100 py-2 ">
			<div class="card-body">
				<div class="row no-gutters align-items-center">
					<div class="col mr-2">
						<div
							class="text-xs font-weight-bold text-primary text-uppercase mb-1 leftspace">Earnings
							(Monthly)</div>
						<div class="h5 mb-0 font-weight-bold text-gray-800 leftspace">
							<c:out value="${totalsale}"></c:out>
						</div>
					</div>
					<div class="col-auto">
						<i class="fas fa-calendar fa-2x text-gray-300"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$(document)
			.ready(
					function() {
						/*$('.custom-control').click(function() {
							alert("helo");
						});*/
						$("input.custom-control-input")
								.on(
										'change.bootstrapSwitch',
										function(event, state) {
											var x = $(this).attr("id");
											var y = $(this).val();
											console.log(x);
											console.log(y);

											$
													.ajax({
														url : '${pageContext.request.contextPath}/userstatechange',
														data : {
															id : x
														},
														type : 'POST',
														success : function(
																data, status) {
															console.log(data
																	+ " "
																	+ status);
														}
													});
										});
						
						$('.custome').click(function() {
							//alert($(this).attr("id"));
							var x=$(this).attr("id");
							console.log("id:",x);
							/*$.ajax({
								url : '${pageContext.request.contextPath}/edituser',
								data : {id : x},
								type : 'POST',
								success : function(data,status) {
									console.log(data+" "+status);
								}
							});*/
						});
						/*$('.custom-control').click(function() {
							$("input[name='status']").click(function(){
								alert($(this).attr("id"));
							});
							//console.log("you clicked");
							//var c = $("input[type='checkbox']").attr("id");
							//var x= $(this).attr("id");
							//console.log(c);
							//console.log(x);
							/*if (c == 1) {
								$('#customSwitch1').val(0);
							} else {
								$('#customSwitch1').val(1);
							}*/
						//console.log($('#customSwitch1').val());
						//});
					});
</script>

</html>