
<%-- <%@page
	import="org.apache.commons.collections.bag.SynchronizedSortedBag"%> --%>
<%@page import="com.Servlet.LoginServlet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBconnect"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%><!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Page</title>
<%@include file="all_components/all_css.jsp"%>
<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
%>
<style type="text/css">
.back-img {
	background-image: url('img/people-waiting-job.jpg');
	width: 100%;
	height: 90vh;
	background-repeat: no-repeat;
	background-size: cover;
}


</style>
</head>

<body>




	<c:if test="${userobj.role ne 'User' }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<div class='embed-container'>
		
		<%@include file="all_components/nav_bar.jsp"%>
		<div class="container-fluid back-img">
			<div class="text-center">
				<%-- <%LoginServlet ls=new LoginServlet();			
		%> --%>
				<h1 class="text p-4">Welcome ${userobj.name }</h1>
			</div>
		</div>
	</div>
</body>

</html>