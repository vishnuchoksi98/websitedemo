<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	<div class="d-flex justify-content-center">
		<form:form action="/website/editsave" method="post"
			name="productdetail" onsubmit="return validateForm();">
			<!-- action="save" -->
			<td><form:hidden path="ProId" name="ProId" /></td>
			<div class="form-group">
				<label for="exampleInputEmail1">Product Name:</label>
				<!--  <input type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name">-->
				<form:input path="name" class="form-control" type="text" />

			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Price</label>
				<form:input type="text" class="form-control" path="price" />
			</div>

			<div class="form-group">
				<label for="exampleInputPassword1">Gold Color</label>
				<form:select type="text" class="form-control" path="gcolor"
					placeholder="">
					<form:option value="whitegold"/>White Gold
					<form:option value="yellowgold"/>Yellow Gold
					<form:option value="pinkgold"/>Pink Gold
				</form:select>
			</div>
			
			<div class="form-group">
				<label for="exampleInputPassword1">Category</label>
				<form:select type="text" class="form-control" path="category"
					placeholder="">
					<form:option value="fingerring"/>Finger Rings
					<form:option value="pandent"/>Pandent
					<form:option value="earring"/>EarRing
					<form:option value="bangle"/>Bangle
					<form:option value="chain"/>Chain
				</form:select>
			</div>
			
			<div class="form-group">
				<label for="exampleInputPassword1">Gold Weight</label>
				<form:input type="text" class="form-control" path="gweight"
					default="0" />
			</div>

			<div class="form-group">
				<label for="exampleInputPassword1">No of diamond</label>
				<form:input type="text" class="form-control" path="noofdiamond" />
			</div>

			<div class="form-group">
				<label for="exampleInputPassword1">Diamond Type</label>
				<form:select type="text" class="form-control" path="dtype"
					placeholder="">
					<form:option value="round"/>Round
					<form:option value="princess"/>Princess
					<form:option value="pear"/>Pear
					<form:option value="cushion"/>cushion
					<form:option value="heart"/>heart
					<form:option value="oval"/>oval
				</form:select>
			</div>


			<div class="form-group">
				<label for="exampleInputPassword1">Diamond Color</label>
				<form:select type="text" class="form-control" path="dcolor"
					placeholder="">
					<form:option value="d"/>D
					<form:option value="e"/>E
					<form:option value="f"/>F
					<form:option value="g"/>G
				</form:select>

			</div>

			<div class="form-group">
				<label for="exampleInputPassword1">Diamond Weight</label>
				<form:input type="text" class="form-control" path="dweight"
					placeholder="" />
			</div>

			<div class="form-group">
				<label for="exampleInputPassword1">Diamond Quality</label>
				<form:select type="text" class="form-control" path="quality"
					placeholder="">
					<form:option value="vvs"/>VVS
					<form:option value="vs"/>VS
					<form:option value="si"/>SI
					<form:option value="i"/>I
				</form:select>
			</div>

			<div class="form-group">
				<label for="exampleInputPassword1">Product description</label>
				<form:input type="text" class="form-control" path="description"
					placeholder="Enter product description" />
			</div>
			<br>
			<button type="submit" class="btn btn-primary">Edit</button>
		</form:form>
	</div>
</body>
</html>