<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href=/css/style.css>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Edit Page</title>
</head>
<body>
<nav class="navbar navbar-expand-sm navbar-light p-2 d-flex justify-content-between nav">
	<div class="d-flex justify-content-start align-items-center">
		<img src="/images/art.jpeg" alt="icon" width=35 height=35 class="rounded-circle">
		<h1 class="f2 pt-2 ms-3">The Artist Gallery</h1>
	</div>
	<div  class="d-flex justify-content-end">
		<a href="/works" class="btn btn-light me-2">Dashboard</a>
		<a href="/logout" class="btn btn-dark">Logout</a>
	</div>
</nav> 
<div class="container-sm text-center">
	<h1 class="f3 light shadow2">${work.name}</h1>
	<form:form action="/works/${work.id}/update" method="post" modelAttribute="editWork" class="f1">
	    
	    <p>
	    	<form:label path="name">Artwork Title:</form:label>
	        <form:errors path="name"/>
	        <form:input path="name" class="form-control"/>
	    </p>
	    <p>
	        <form:label path="image">Gallery Link:</form:label>
	        <form:errors path="image"/>
	        <form:input path="image" class="form-control"/>
	    </p>
	    <p>
	    	<form:errors path="creator"/>
	        <form:hidden path="creator" value="${user_id}"/>
	    </p>
	      
	    <input type="submit" value="Update" class="btn btn-secondary"/>
	</form:form> 
	<div class="mt-5">
		<a href="/delete/${work.id}" class="a btn btn-dark f1">Delete</a>
	</div>
</div>
</body>
</html>