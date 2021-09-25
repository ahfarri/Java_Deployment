<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href=/css/style.css>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-expand-sm navbar-light p-2 d-flex justify-content-between nav">
	<div class="d-flex justify-content-start align-items-center">
		<img src="/images/art.jpeg" alt="icon" width=35 height=35 class="rounded-circle">
		<h1 class="f2 pt-2 ms-3">The Artist Gallery</h1>
	</div>
	<div  class="col-6 d-flex justify-content-end">
		<a href="/works" class="btn btn-light me-2">Dashboard</a>
		<a href="/logout" class="btn btn-dark">Logout</a>
	</div>
</nav> 
<div class="container-sm searchimg height mt-3">
	<h2 class="text-center f3 display-5 peach2">Works of Art by Title: <span class="peach shadow1">${work}</span></h2>
	<div class="width">
		<table class="table table-hover f1 text-center">
		    <thead>
		    	<tr>
		        	<th>Title</th>
		        	<th>Created by</th>
		       	</tr>
		    </thead>
		    <tbody>
		    	<c:forEach items='${search}' var='work'>			
		        <tr>
		            <td><a href="/works/${work.id}" class="a peach">${work.name}</a></td>
		            <c:forEach items='${users}' var='user'>		
					<c:if test='${user.id == work.creator}'>
						<td>${user.firstName}</td>
					</c:if>
					</c:forEach>
		        </tr>
		        </c:forEach>
		    </tbody>
		</table>
	</div>
</div>

</body>
</html>