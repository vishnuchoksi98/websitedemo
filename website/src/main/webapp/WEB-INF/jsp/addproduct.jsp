<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="loginvalidation.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
 <script
	src="<%=request.getContextPath()%>/resources/assets/js/validate.js"></script> 

<style>
.error{
color:red;}
</style>

</head>
<body>
	<jsp:include page="admin/adminheader.jsp" />
	<div class="d-flex justify-content-center">
		<form:form action="save" method="post" name="productdetail"
			onsubmit="return validateForm()" enctype="multipart/form-data">
			<!-- action="save" -->
			
			<div class="form-group">
				<label for="image">Choose Image</label>
				<input id="file" name="file" type="file" >
				<p id="fileerr" class="error"></p>
			</div>
			
			<div class="form-group">
				<label for="exampleInputEmail1">Product Name:</label>
				<form:input path="name" class="form-control" type="text" />
				<p id="texterr" class="error"></p>
			</div>

			<div class="form-group">
				<label for="exampleInputPassword1">Category</label>
				<form:select type="text" class="form-control" path="category"
					placeholder="">
					<option value="fingerring">Finger Rings</option>
					<option value="pandent">Pandent</option>
					<option value="earring">EarRing</option>
					<option value="bangle">Bangle</option>
					<option value="chain">Chain</option>
				</form:select>
			</div>

			<div class="form-group">
				<label for="exampleInputPassword1">Price</label>
				<form:input type="text" class="form-control" path="price" />
				<p id="priceerr" class="error"></p>
				
			</div>
		
			<div class="form-group">
				<label for="exampleInputPassword1">Stock</label>
				<form:input type="text" class="form-control" path="stock" />
				<p id="stockerr" class="error"></p>
				
			</div>

			<div class="form-group">
				<label for="exampleInputPassword1">Gold Color</label>
				<form:select type="text" class="form-control" path="gcolor"
					placeholder="">
					<option value="whitegold">White Gold</option>
					<option value="yellowgold">Yellow Gold</option>
					<option value="pinkgold">Pink Gold</option>
				</form:select>
			</div>

			<div class="form-group">
				<label for="exampleInputPassword1">Gold Weight</label>
				<form:input type="text" class="form-control" path="gweight"
					default="0" />
					<p id="gweighterr" class="error"></p>
			</div>

			<div class="form-group">
				<label for="exampleInputPassword1">No of diamond</label>
				<form:input type="text" class="form-control" path="noofdiamond" />
				<p id="noofdiamonderr" class="error"></p>				
			</div>

			<div class="form-group">
				<label for="exampleInputPassword1">Diamond Type</label>
				<form:select type="text" class="form-control" path="dtype"
					placeholder="">
					<option value="round">Round</option>
					<option value="princess">Princess</option>
					<option value="pear">Pear</option>
					<option value="cushion">cushion</option>
					<option value="heart">heart</option>
					<option value="oval">oval</option>
				</form:select>
			</div>


			<div class="form-group">
				<label for="exampleInputPassword1">Diamond Color</label>
				<form:select type="text" class="form-control" path="dcolor"
					placeholder="">
					<option value="d">D</option>
					<option value="e">E</option>
					<option value="f">F</option>
					<option value="g">G</option>
				</form:select>

			</div>

			<div class="form-group">
				<label for="exampleInputPassword1">Diamond Weight</label>
				<form:input type="text" class="form-control" path="dweight"
					placeholder="" />
				<p id="dweighterr" class="error"></p>					
			</div>

			<div class="form-group">
				<label for="exampleInputPassword1">Diamond Quality</label>
				<form:select type="text" class="form-control" path="quality"
					placeholder="">
					<option value="vvs">VVS</option>
					<option value="vs">VS</option>
					<option value="si">SI</option>
					<option value="i">I</option>
				</form:select>
			</div>

			<div class="form-group">
				<label for="exampleInputPassword1">Product description</label>
				<form:input type="text" class="form-control" path="description"
					placeholder="Enter product description" />
					
			</div>

			<br>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form:form>
	</div>

</body>
</html>