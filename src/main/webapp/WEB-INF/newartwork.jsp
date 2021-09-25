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
<title>New Artwork</title>
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
<div class="row mt-4">
	<div class="col-5 p-5">
		<img alt="artist" src="/images/artist.jpg" class="newworkimg rounded mx-auto d-block">
	</div>
	<div class="col-7 p-5">
		<h1 class="text-center f3 purple shadow2">Add a new Artwork</h1>
		<form:form class="text-center f1" action="/works/create" method="post" modelAttribute="newWork">
		    
		    <p>
		        <form:label path="name">Title:</form:label>
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
		      
		    <input type="submit" value="Add to Gallery" class="btn btn-dark"/>
		</form:form>
	</div>
</div> 
</body>
</html>