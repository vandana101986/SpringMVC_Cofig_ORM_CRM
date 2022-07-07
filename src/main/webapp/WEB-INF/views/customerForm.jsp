<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<style><%@include file="/resources/css/style.css"%></style>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CRM-Customer</title>
<link
	href="https://fonts.googleapis.com/css2?family=Arima:wght@700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Kantumruy+Pro:wght@500&display=swap"
	rel="stylesheet">
</head>
<body>
	<h1>CUSTOMER RELATIONSHIP MANAGEMENT</h1>
	<br>
	<h3>Provide Customer Details</h3>
	<form action="addOrUpdateRecord" method="POST">
		<div id="formTable">
		
			<table>
			<c:choose>
    			<c:when test="${cust.customerId == 0}">
       				<tr style="display:none;"><td>Customer ID : </td><td><input class="infoInput" type="text" value="${cust.customerId}" name="id" style="background-color:#E0E0E0" readonly/></td></tr>
  				</c:when>
   				<c:otherwise>
        			<tr><td>Customer ID : </td><td><input class="infoInput" type="text" value="${cust.customerId}" name="id" style="background-color:#E0E0E0" readonly/></td></tr>
    			</c:otherwise>      
			</c:choose>

				<tr>
					<td>First Name</td>
					<td><input class="infoInput" type="text"
						value="${cust.firstName}" name="fName" /></td>
				</tr>
				<tr>
					<td>Last Name</td>
					<td><input class="infoInput" type="text"
						value="${cust.lastName}" name="lName" /></td>
				</tr>
				<tr>
					<td>Email</td>
					<td><input class="infoInput" type="text" value="${cust.eMail}"
						name="eMail" /></td>
				</tr>

			</table>
			<input type="submit" value="Submit" id="submit" />
		</div>
	</form>
</body>
</html>