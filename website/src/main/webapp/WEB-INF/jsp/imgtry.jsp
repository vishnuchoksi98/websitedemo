<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h1>Spring MVC - Hibernate File Upload to Database Demo</h1>
		<form method="post" action="doUpload" enctype="multipart/form-data">
			<table border="0">
				<tr>
					<td>Pick file #1:</td>
					<td><input type="file" name="file" size="50" /></td>
				</tr>
					<td colspan="2" align="center"><input type="submit"
						value="Upload" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>