<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
if(session.getAttribute("username")==null)
{
	String url=request.getContextPath();
	out.print("session has been closed");
	response.sendRedirect(request.getContextPath()+"/login");
}
%>

<!DOCTYPE html>
<html>
<head>
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

<script>
	/*$(document).ready(function(){
						$("#view").click(function() {
							var selected1 = $('#view').val();
							alert(selected1);
							/*$.ajax({
								url : '${pageContext.request.contextPath}/productlist/'
								+ selected1,
								data : Array,
								success : function(
										data, status) {
										$('#data1').html(data);
									}
								});
							});
	});*/
</script>
<style>
.specific {
	margin: 50px auto;
	width: 50%;
	border-radius: 5px;
}

.top {
	margin-left: 20px;
}

</style>
<script>
	/*$(document).ready(function() {
	 $('th').click(function() {
	 var column=$(this).data('column')
	 console.log('column was clicked',column)
	 });
	 } );*/
	$(document).ready(function() {
		$('#example').DataTable({
			"order" : [ [ 0, "asc" ] ],
			"lengthMenu" : [ [ 4, 8, 12, -1 ], [ 4, 8, 12, "All" ] ]
		});
	});
	/*$(document).ready(function() {
	 var xmlhttp=new XMLHttpRequest();
	 xmlhttp.open("GET","http://localhost:8080/website/viewemp",true);
	 xmlhttp.onreadystatechange=function(){
	 if(xmlhttp.readyState==4 && xmlhttp.status==200){
	 console.log("inside");
	 console.log(JSON.parse(xmlhttp.responseText));
	
	 $('#example').DataTable( {
	 data:persons,
	 "columns":[{"data":"id"},
	 {"data":"name"},
	 {"data":"price"}]
	 });
	 }
	 }
	 });*/
</script>

</head>
<body>
 <jsp:include page="admin/adminheader.jsp" />
	<div class="container top">
		<table class="table table-bordered specific" border="2" width="70%"
			cellpadding="2" id="example">
			<thead class="bg-primary text-dark">
				<tr>
					<th scope="col">id</th>
					<th scope="col">ProductName</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Color</th>
					<th scope="col">Gweight</th>
					<th scope="col">noofdiamond</th>
					<th scope="col">DiamondType</th>
					<th scope="col">DiamondColor</th>
					<th scope="col">DiamondWeight</th>
					<th scope="col">Quality</th>
					<th scope="col">Description</th>
					<th scope="col">Filename</th>
					<th scope="col">Edit</th>
					<th scope="col">Delete</th>
					<th scope="col">View</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="emp1" items="${list}">
					<tr>
						<td>${emp1.getProId()}</td>
						<td>${emp1.name}</td>
						<td>${emp1.category}</td>
						<td>${emp1.price}</td>
						<td>${emp1.gcolor}</td>
						<td>${emp1.gweight}</td>
						<td>${emp1.noofdiamond}</td>
						<td>${emp1.dtype}</td>
						<td>${emp1.dcolor}</td>
						<td>${emp1.dweight}</td>
						<td>${emp1.quality}</td>
						<td>${emp1.description}</td>
						<td>${emp1.filename}</td>
						<td><a href="editemp/${emp1.getProId()}">Edit</a></td>
						<td><a href="deleteemp/${emp1.getProId()}">Delete</a></td>
						<td><a target="_blank" href="rings/${emp1.getProId()}">View</a></td>
						<!-- <td><button type="button" class="btn btn-primary" name="view" value="${emp1.getProId()}" id="view">view</button>
					</td>-->
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">...
				<c:out value="${command.getName()}"></c:out>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>-->
</body>
</html>