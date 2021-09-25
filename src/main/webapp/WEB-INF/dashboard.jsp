<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href=/css/style.css>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
	<meta charset="UTF-8">
	<title>Welcome</title>
</head>
<body>
<nav class="navbar navbar-expand-sm navbar-light border d-flex justify-content-between nav">
	<div class="d-flex justify-content-start align-items-center">
		<img src="/images/art.jpeg" alt="icon" width=35 height=35 class="rounded-circle">
		<h1 class="f2 pt-2 ms-3">The Artist Gallery</h1>
	</div>
	<div  class="d-flex justify-content-end">
		<div class="me-3">
			<form class="input-group" action="/search" method="post">
			    <input type="search" name="work">
			    <input type="submit" value="Search" class="btn btn-light"/>
			</form>
		</div>
		<a href="/logout" class="btn btn-dark">Logout</a>
	</div>
</nav> 
<div class="bodyimg">
	<h1 class="f3 peach">Welcome, <c:out value="${user}" />!</h1>	
	<div class="container-sm f1">
		<h1 class="text-center mb-5 peach2 shadow1">Art in Our Gallery</h1>
		<table class="table table-hover tablebg">
			<thead>
				<tr>
					<th>Artwork Title</th>
					<th>Created By:</th>
					<th>Likes</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items='${works}' var='work'>			
				<tr>
					<td><a href="/works/${work.id}" class="a peach">${work.name}</a></td>
					
					<c:forEach items='${users}' var='user'>		
					<c:if test='${user.id == work.creator}'>
						<td>${user.firstName}</td>
					</c:if>
					</c:forEach>
					<td>${work.users.size()}</td>
					<c:if test='${list.contains(work)}'>
					    	<td><a href="/unlikes/${work.id}" class="a light">Unlike</a></td>
					</c:if>
					<c:if test='${!list.contains(work)}'>
					    	<td><a href="/likes/${work.id}" class="a light">Like</a></td>
					</c:if>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="/works/new" class="btn btn-light">Add an Artwork</a>
	</div>
</div>
</body>
</html>

