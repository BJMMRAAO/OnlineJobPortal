<%@page import="org.apache.commons.collections.bag.SynchronizedSortedBag"%>
<%@page import="com.entity.Jobs"%>
<%@page import="com.dao.JobDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Jobs</title>
<%@include file="all_components/all_css.jsp"%>
<%response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); %>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_components/nav_bar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h5 class="text-center text-primary">All Jobs</h5>
				<h3 style="text-align:center">
				<a href='userFilterJobs.jsp' style="color: #00ffff">click Here to search again</a>
				</h3>
				<%
				String name = (String)session.getAttribute("name");
				
				if(name==null){
					session.setAttribute("succMsg1", "Session timed out, pls login again");
					response.sendRedirect("login.jsp");
				}
				
				List<Jobs> list = (List)session.getAttribute("filterjob");
				for (Jobs j : list) {

				%>
				<div class="card mt-2">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>

						<h6><%=j.getTitle()%></h6>
						<p><%=j.getDescription()%></p>
						<br>
						<div class="form-row">
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Location:<%=j.getLocation()%>" readonly>
							</div>
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Category:<%=j.getCategory()%>" readonly>
							</div>
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Status:<%=j.getStatus()%>" readonly>

							</div>
						</div>
						<h6>
							Publish Date:
							<%=j.getPdate()%></h6>
						<div class="text-center ">
							<a href="ApplyJob.jsp"
								class="btn btn-sm bg-success text-white">Apply</a> 

						</div>
					</div>
				</div>
				<%}
						%>
			</div>
		</div>
	</div>
</body>
</html>