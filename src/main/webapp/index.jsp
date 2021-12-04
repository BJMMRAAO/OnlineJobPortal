<%@page import="com.DB.DBconnect" %>
<%@page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Grab Your Job Here</title>
<%response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); %>
<%@include file="all_components/all_css.jsp"%>
<style type="text/css">
.back-img {
	background-image: url('img/JobPortalimage.jpg');
	width: 100%;
	height: 83.5vh;
	background-repeat: no-repeat; 
	background-size: cover;
}
</style>

</head>
<body>
	<%@include file="all_components/nav_bar.jsp"%>
<% Connection conn=DBconnect.getconn();
out.println(conn);

%> 
	<div class="container-fluid back-img">
		<div class="text-center">
			<h1 class="text p-4">
				<i class="fas fa-book-reader mr-2" aria-hidden="true"></i>Online Job
				Portal
			</h1>
		</div>
	</div>
	<%@include file="all_components/Footer.jsp" %> 
</body>
</html>