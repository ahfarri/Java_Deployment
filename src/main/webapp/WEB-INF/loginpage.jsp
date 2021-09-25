<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href=/css/style.css>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>
<nav class="navbar navbar-expand-sm navbar-light p-2 d-flex justify-content-between nav">
	<div class="d-flex justify-content-start align-items-center">
		<img src="/images/art.jpeg" alt="icon" width=35 height=35 class="rounded-circle">
		<h1 class="f2 pt-2 ms-3">The Artist Gallery</h1>
	</div>
</nav> 
<div class="row f1 loginimg">
		<div class="col-6 offset-1 p-2">
			<h3 class="light">Register here:</h3>
			<form:form action="/register" method="post" modelAttribute="newUser">
				        <div class="form-group">
				            <label>First Name:</label>
				            <form:input path="firstName" class="form-control" />
				            <form:errors path="firstName" class="text-danger" />
				        </div>
				        <div class="form-group">
				            <label>Last Name:</label>
				            <form:input path="lastName" class="form-control" />
				            <form:errors path="lastName" class="text-danger" />
				        </div>
				        <div class="form-group">
				            <label>Email:</label>
				            <form:input path="email" class="form-control" />
				            <form:errors path="email" class="text-danger" />
				        </div>
				        <div class="form-group">
				            <label>Password:</label>
				            <form:password path="password" class="form-control" />
				            <form:errors path="password" class="text-danger" />
				        </div>
				        <div class="form-group">
				            <label>Confirm Password:</label>
				            <form:password path="passwordConfirmation" class="form-control" />
				            <form:errors path="passwordConfirmation" class="text-danger" />
				        </div>
				        <input type="submit" value="Register" class="btn btn-danger mt-2" />
				    </form:form>
		</div>
	    
	    <div class="col-4 p-2">
	    	<h3>Login here:</h3>
	    	<form:form action="/login" method="post" modelAttribute="newLogin">
	    	    <div class="form-group">
	    	        <label>Email:</label>
	    	        <form:input path="email" class="form-control" />
	    	        <form:errors path="email" class="text-danger" />
	    	    </div>
	    	    <div class="form-group">
	    	        <label>Password:</label>
	    	        <form:password path="password" class="form-control" />
	    	        <form:errors path="password" class="text-danger" />
	    	    </div>
	    	    <input type="submit" value="Login" class="btn btn-warning mt-2" />
	    	</form:form>
	    </div>
</div>
</body>
</html>