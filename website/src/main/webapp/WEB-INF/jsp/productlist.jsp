<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--<%@ include file="loginvalidation.jsp" %>-->
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
<link
	href="<%=request.getContextPath()%>/resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>

<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js" ></script> -->

<style>
.edit {
	margin-left: 10px;
}

.card-img-top {
	width: 100%;
	height: 50%;
	object-fit: cover;
}

.error {
	color: red;
}
</style>

<script type="text/javascript">
function getdata(){
	var s="<c:out value="${}"></c:out>"	;
	//var stock="";
	console.log(s);
	/*if(s=="Product is currently out of stock."){
		console.log("yes you are true");
		document.getElementById("addtocart").disabled = true;
	}
	else{
		console.log("false");
		document.getElementById("addtocart").disabled = false;
	}*/
	//console.log(document.getElementById("gold").value);
}
	/*$(document)
			.ready(
					function() {
						//$("#data1").hide();
						//var selected = $('#filter').val();
						$("#filter").change(function() {
						var selected1=$('#filter').val();
						alert(selected+selected1);
						
						});*/
	$("#filter").change(function() {
						var selected1 = $('#filter').val();
						console.log("helpo mr");
	});
						/*$.ajax({
									url : '${pageContext.request.contextPath}/productlist/'
											+ selected1,
									success : function(data,status) {
										console.log(data+" "+status);
											$('#data1').html(data)
									}
								});
					});*/
	
//new changes.
	/*$(document).ready(function() {
		$("#filter").click(function() {
			alert("The paragraph was clicked.");
		});
	});*/
</script>
</head>
<body>

	<jsp:include page="header.jsp" />
	<div class="d-flex justify-content-center">
		<div id="data3">
			<label for="exampleInputPassword1">Category</label> <select
				type="text" class="form-control" id="filter">
				<option value="chain">Chain</option>
				<option value="fingerring">Finger Rings</option>
				<option value="pandent">Pandent</option>
				<option value="earring">EarRing</option>
				<option value="bangle">Bangle</option>
			</select>
			<!--   <a href="<%=request.getContextPath()%>/shoppingcart">Shopping
				Cart </a>-->
		</div>
	</div>
	<div class="container-fluid">
		<div id="data1" class="row row-cols-1 row-cols-md-2">
			<c:forEach var="command" items="${list}">
				<div class="col mb-4" id="item" id="name">
					<div class="card round" style="width: 18rem;">
						<div class="embed-responsive embed-responsive-16by9">
							<img class="card-img-top img-fluid embed-responsive-item "
								src="<%=request.getContextPath()%>/getStudentPhoto/${command.getProId()}"
								alt="Card image cap">
						</div>
						<div class="card-body">
							<h5 class="card-title" id="name">
								<c:out value="${command.getName()}"></c:out>
							</h5>
							<p class="card-text">
								Price:
								<c:out value="${command.getPrice()}"></c:out>
								.Rs
							</p>
							<p class="card-text">
								Gold:
								<c:out value="${command.getGweight()}"></c:out>
								gm
							</p>
							<c:if test="${command.getStock() <= 0 }">
								<p class="error">Product is out of stock.</p>
							</c:if>
							<div id="outofstock"></div>
							<a
								href="<%=request.getContextPath()%>/productdesc/${command.getProId()}"
								target="_blank" class="btn btn-primary">Buy Now</a>

						</div>
					</div>
				</div>

			</c:forEach>

		</div>
	</div>
	<div class="pagination d-flex justify-content-center">
		<c:forEach begin="1" end="${maxpage}" step="1" varStatus="i">
			<c:choose>
				<c:when test="${page == i.index}">
					<span>${i.index}</span>
				</c:when>
				<c:otherwise>
					<c:url value="/productlist" var="url">
						<c:param name="page" value="${i.index}" />
					</c:url>
					<nav aria-label="Page navigation example ">
						<ul class="pagination">
							<li class="page-item "><a class="page-link "
								href='<c:out value="${url}" />'>${i.index}</a></li>
						</ul>
					</nav>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
</body>

<script>
$("#filter").change(function() {
	var selected1 = $('#filter').val();
	console.log("helpo mr");
	$.ajax({
		url : '${pageContext.request.contextPath}/productlist/'
				+ selected1,
		success : function(data,status) {
			console.log(data+" "+status);
			for ( i in data){
				$('#outofstock').html(data[i].name);
				console.log('name:',data[i].price);
				console.log('price',data[i].name);
				console.log('proid',data[i].gweight);
				//console.log('actual',i);
			}
				//$('#data1').html(data);
		}
	});
});


</script>

</html>

<c:if test="${process eq 'abcd'}">
hi heloo
</c:if>