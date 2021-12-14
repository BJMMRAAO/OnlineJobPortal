<%@page import="org.apache.commons.collections.bag.SynchronizedSortedBag"%>
<%@page import="com.dto.Jobs"%>
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
				<c:if test="${not empty succMsg }">
					<div class="alert alert-success" role="alert">${ succMsg}</div>
					<c:remove var="succMsg" />
				</c:if>
				<c:if test="${not empty succMsg1 }">
					<div class="alert alert-danger" role="alert">${ succMsg1}</div>
					<c:remove var="succMsg1" />
				</c:if>
				
				
				<%
				JobDao dao = new JobDao(DBconnect.getconn());
// 				HttpSession session = request.getSession(false);
				String name = (String)session.getAttribute("name");
				
				if(name==null){
					session.setAttribute("succMsg1", "Session timed out, pls login again");
					response.sendRedirect("login.jsp");
				}
				List<Jobs> list = dao.getAllJobs(name);
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
							<a href="edit_job.jsp?id=<%=j.getId()%>"
								class="btn btn-sm bg-success text-white">Edit</a> <a
								href="delete?id=<%=j.getId()%>"
								class="btn btn-sm bg-danger text-white">Delete</a>

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