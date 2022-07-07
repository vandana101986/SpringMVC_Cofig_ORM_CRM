<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style><%@include file="/resources/css/style.css"%></style>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://fonts.googleapis.com/css2?family=Arima:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Kantumruy+Pro:wght@500&display=swap" rel="stylesheet">
<title>CRM-Customer List</title>
</head>
<body>
	<h1>CUSTOMER RELATIONSHIP MANAGEMENT</h1>
	<!-- <input type="button" value="Add New Customer" click="addOrUpdateCustomer"/>  -->
	<div id="newCustomer">
	<a href="addOrUpdateCustomer?customerId=0"><button>Add New Customer</button></a>
	</div>
	<br>
	<div id="table">
	<table>
		<thead>
			<tr>
				<th>Customer Id</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th style="width:25%">Email</th>
				<th>Actions</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach items="${customerList}" var="cus">
				<tr>
					<td>${cus.customerId}</td>
					<td>${cus.firstName}</td>
					<td>${cus.lastName}</td>
					<td>${cus.eMail}</td>
					<td><a href="addOrUpdateCustomer?customerId=${cus.customerId}"><button>Update</button></a> | <a href="delete?customerId=${cus.customerId}"><button>Delete</button></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</body>
</html>