<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href=/css/style.css>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<meta charset="UTF-8">
<title>View Artwork</title>
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
<div class="row f1 m-5">
	<div class="text-center viewworkimg col-6">
		<h1 class="f3 peach2 mt-4 shadow2 display-2">${work.name}</h1>
		<h3 class="peach fs-2 pt-2 shadow2">Created By: ${user}</h3>
		<h2 class="f3 fs-5 text-light">Visit Personal Gallery here:</h2>
		<a href="${work.image}" class="text-light">${work.image}</a>
	</div>
	<div class="text-center col-6">
		<h2 class="light">Users who liked your Artwork:</h2>
		<table class="table">
			<tbody>
				<c:forEach items='${users}' var='user'>			
				<tr>
					<td>${user.firstName}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:if test='${session == work.creator}'>
			<a href="/works/${work.id}/edit">Edit</a>
		</c:if>
		<figure class="text-center mt-5">
		  <blockquote class="blockquote">
		    <p class="navy shadow1">"Art is not what you see, but what you make others see."</p>
		  </blockquote>
		  <figcaption class="blockquote-footer">
		   Edgar Degas
		  </figcaption>
		</figure>
	</div>
</div>
</body>
</html>