<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

 <link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/imagehover.css" /> 

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>

<script
	src="<%=request.getContextPath()%>/resources/assets/js/jquery.jqZoom.js"></script>

<script type="text/javascript">
	function getdata(){
		var s="<c:out value="${productstock}"></c:out>"	;
		//var stock="";
		console.log(s);
		if(s=="Product is currently out of stock."){
			console.log("yes you are true");
			document.getElementById("addtocart").disabled = true;
		}
		else{
			console.log("false");
			document.getElementById("addtocart").disabled = false;
		}
		//console.log(document.getElementById("gold").value);
	}
	/*$(document).ready(function() {
		$( "#gold" ).click(function() {
			console.log($("#gold").val());	  
			});
		var selected1=$("#stockerror").val();
		var s=document.getElementById("gold").value;
		console.log(selected1);
		console.log(document.getElementById("gold").value);
	});*/
</script>

<meta charset="ISO-8859-1">
<style>
.space {
	margin-top: 20px;
}

.error1 {
	color: red;
}

</style>
<title>Insert title here</title>

</head>
<body onload="getdata()">
	<div class="container">
		<div class="row">
			<div class="pordSlider space col-xs-12 col-sm-6 zoom-box">
				<img class="card-img-top img-fluid embed-responsive-item "
					src="<%=request.getContextPath()%>/getStudentPhoto/${command.getProId()}"
					alt="Card image cap">
				
			</div>
			<div class="productDetails space col-xs-12 col-sm-6 ">
				<h1>
					<h2>
						<c:out value="${command.name}"></c:out>
					</h2>

					<h2>
						Price:
						<c:out value="${command.price}"></c:out>
						.Rs
					</h2>
					(Inclusive of all taxes)

					<p id="gold">
						Gold:
						<c:out value="${command.getGweight()}"></c:out>
						gm
					</p>
					<a href="<%=request.getContextPath()%>/cart/${command.getProId()}"><button
							id="addtocart" class="btn btn-primary" value="">Add To
							Cart</button></a>
				</h1>
				<p id="stockerror" class="error1">
					<c:out value="${productstock}"></c:out>
				</p>
			</div>
			<div class="">

				<table class="table ">

					<tr>
						<td scope="col">Diamond Weight:</td>
						<td scope="col">${command.getDweight()}</td>
					</tr>
					<!-- <tr>
						<td scope="row">Gold Color</td>
						<td><c:out value="${command.getGcolor()}"></c:out></td>
					</tr> -->
					<tr>
						<td scope="row">Gold Weight</td>
						<td>${command.getGweight()}</td>
					</tr>
					<tr>
						<td scope="row">No Of Diamond</td>
						<td colspan="2">${command.getNoofdiamond()}</td>
					</tr>
					<tr>
						<td scope="row">Diamond Shape</td>
						<td colspan="2">${command.getDtype()}</td>
					</tr>
					<tr>
						<td scope="row">Diamond Color</td>
						<td colspan="2">${command.getDcolor()}</td>
					</tr>
					<tr>
						<td scope="row">Diamond Weight</td>
						<td colspan="2">${command.getDweight()}</td>
					</tr>
					<tr>
						<td scope="row">Diamond Quality</td>
						<td colspan="2">${command.getQuality()}</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
<script>
$(function(){
	  $("img").jqZoom({
	    selectorWidth: 30,
	    selectorHeight: 30,
	    viewerWidth: 400,
	    viewerHeight: 300

	  });
	});

//imageZoom("myimage", "myresult");
</script>

</html>

<!-- <a class="btn btn-primary" id="addtocart" href="<%=request.getContextPath()%>/cart/${command.getProId()}"
						 ><a> -->