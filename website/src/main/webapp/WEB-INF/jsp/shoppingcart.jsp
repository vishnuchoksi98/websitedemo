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


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>

<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
.textcolor {
	color: lightgrey;
}
.special{
margin-left:80%;
}
</style>
<script type="text/javascript">
/*$(document).ready(function() {
	$("#up2").click(function() {
		var selected1 = $('#id').val();
		console.log("this is id value",selected1);
		$.ajax({
			url : '${pageContext.request.contextPath}/incrementproduct/',
			data:{id:selected1},
			success : function(data) {
				console.log(data);
				//var obj = JSON.parse(data);
				//console.log(obj);
					//$(':input[type="submit"]').prop('disabled', true);
					//$(':input[type="submit"]').prop('disabled', false);	
					//$("#emailresult").html(data);
						},
						error: function() {alert(data);},
						/*error:function(){
							$(':input[type="submit"]').prop('disabled', false);	
						}
		});
	});
});*/
	/*function up(dynamic) {
		var temp = dynamic.id;
		var temp = temp.substring(2, 3);
		var id = "myNumber";
		id = id.concat(temp);
		var total = "total";
		total = total.concat(temp);
		//console.log("temp:"+temp);
		var x = parseInt(document.getElementById(id).value) + 1;
		var y;
		var max = 10;
		if (x >= parseInt(max)) {
			document.getElementById(id).value = max;
			y = x * 100;

		} else {
			document.getElementById(id).value = x;
			y = x * 100;

		}
	}*/

	function down(dynamic) {
		var price=document.getElementById("price");
		console.log(price);
	}
	/*function down(dynamic) {
		var temp = dynamic.id;
		var temp = temp.substring(4, 5);
		//var id = "myNumber";
	//	id = id.concat(temp);
		//var total = "total";
		//total = total.concat(temp);
		//console.log("tempid:"+temp1);
		//console.log(total);
		var y;
		//console.log(res);
		//console.log(document.getElementById(id).value);
		//console.log("total:"+total);
		var min = 0;
		var x = parseInt(document.getElementById(id).value) - 1;
		if (x <= parseInt(min) || x <= 0) {
			document.getElementById(id).value = min;
			document.getElementById(total).innerHTML = min;
		} else {
			document.getElementById(id).value = x;
			y = x * 100;
			console.log(y);
			document.getElementById(total).innerHTML = y;

		}
	}*/
	function getdata(){
		var quantity="<c:out value="${purchase.getQuantity()}"></c:out>";
		var stock="<c:out value="${purchase.pbean.getStock()}"></c:out>";
		//var s="<c:out value="${productstock}"></c:out>"	;

		//var stock="";
		console.log(stock,",",quantity);
		if(stock<quantity){
			console.log("product is out of stock");
			document.getElementById("up2").disabled = true;
		}
		else{
			console.log("false");
			document.getElementById("addtocart").disabled = false;
		}
		//console.log(document.getElementById("gold").value);
	}
</script>

<style>
	.fixed{
	    width:50px;
	    height: 50px;
	    
	}
.error
	{
	color:red;
	}
</style>

</head>
<body>
	<jsp:include page="header.jsp" />

 	<div class="container-fluid">
		<table class="table table-bordered "
			 id="purchase">
			<thead class="bg-primary text-dark">
				<tr>
					<th scope="col">Product</th>
					<th scope="col" class="textcolor">Name</th>
					<th scope="col" class="textcolor">Price</th>
					<th scope="col" class="textcolor">Quantity</th>
					<th scope="col" class="textcolor">Remove</th>
					<th scope="col" class="textcolor">Total</th>
				</tr>
			</thead>
			<tbody>
			<div id="cartbody" onload="getdata()">
				<c:forEach var="purchase" items="${cart}">
				<c:set var="total"
				value="${total + purchase.pbean.price*purchase.getQuantity() }"></c:set>
					<tr>
						<td class="w-70 h-70 d-inline-block">
							<div class="">
								 <img class="fixed img-fluid  " src="<%=request.getContextPath()%>/getStudentPhoto/${purchase.pbean.getProId()}" alt="Card image cap">
							</div>
						</td>

						<td >${purchase.pbean.name}</td>
						<td>${purchase.pbean.price}</td>
						<td>
							
					<a href="<%=request.getContextPath()%>/decrementproduct/${purchase.pbean.getProId()}"><button id="down2" class="btn btn-default" onclick="down(this)">
						<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-dash-square-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
						  <path fill-rule="evenodd" d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm2.5 7.5a.5.5 0 0 0 0 1h7a.5.5 0 0 0 0-1h-7z"/>
						</svg>							</button> </a>
							
							<input type="text" id="myNumber2" value="${purchase.getQuantity()}"
								style="width: 25%;" name="item" readonly>
							
							<c:choose>
					            <c:when test="${purchase.pbean.getStock() <= purchase.getQuantity() }">
					                <button  id="up2" disabled="disabled" class="btn btn-default btn-sm" >
										<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-plus-square-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  											<path fill-rule="evenodd" d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm6.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
										</svg>
										</button>
							  		
					            </c:when>
					            <c:otherwise>
					                <a href="<%=request.getContextPath()%>/incrementproduct/${purchase.pbean.getProId()}"> <button  id="up2" class="btn btn-default btn-sm" >
										<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-plus-square-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  											<path fill-rule="evenodd" d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm6.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
										</svg>
										</button>
							 		</a>
					            </c:otherwise>
					        </c:choose>
							 
							 <!--  <a href="<%=request.getContextPath()%>/incrementproduct/${purchase.pbean.getProId()}"> <button  id="up2" class="btn btn-default btn-sm" >
									<span class="glyphicon glyphicon-plus"></span>
							</button>
							  </a>-->
							  
		 					  <c:if test="${purchase.pbean.getStock() <= purchase.getQuantity() }">
									<p class="error">This is the maximum stock we have at the moment.</p>
							 </c:if>
							 
						</td>
						<td>
							<a href="<%=request.getContextPath()%>/removeitem/${purchase.pbean.getProId()}">
								<button id="" class="btn btn-default" >
							<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-x-square-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							  <path fill-rule="evenodd" d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm3.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
							</svg>								</button>
							</a>
						</td>
						<td>${purchase.getQuantity()*purchase.pbean.price}</td>
						<!-- <td><button type="button" class="btn btn-primary" name="view" value="${emp1.id}" id="view">view</button>
					</td>-->
		 			</tr>
				</c:forEach>
				</div>
			</tbody>
		</table>
		<h1><a href="<%=request.getContextPath()%>/productlist">Back To Shopping </a></h1>
		<div class="special"><a href="<%=request.getContextPath()%>/finalpurchase"><button name="purchase" type="submit" class="btn btn-primary">Buy</button></a></div>
		&nbsp &nbsp<h3 style="margin-left:">Total:<span id="finalvalue">${total}</span></h3>
	</div>
	 
</body>
</html>