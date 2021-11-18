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
				<c:if test="${userobj.role eq 'User' }">
				<div class="card mt-2 mx-auto">
					<div class="card-body">
						<div class="text-center text-primary">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label>Location</label> <select name="location"
										class="custom-select " id="inlineFormCustomSelect Pref">
										<option selected>Choose...</option>
										<option value="Hydrabad">Hydrabad</option>
										<option value="Odisha">Odisha</option>
										<option value="Jharkhand">Jharkhand</option>
										<option value="Gujurat">Gujurat</option>
										<option value="Bhubaneswar">Bhubaneswar</option>
										<option value="Delhi">Delhi</option>
										<option value="Bang Lore">Banglore</option>
										<option value="Chennai">Chennai</option>
									</select>
								</div>
								<div class="form-group col-md-6">
									<label>Category</label> <select class="custom-select "
										id="inlineFormCustomSelect Pref" name="category">
										<option selected>Choose...</option>
										<option value="IT">IT</option>
										<option value="Devloper">Developer</option>
										<option value="Banking">Banking</option>
										<option value="Engineer">Engineer</option>
										<option value="Teacher">Teacher</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
				</c:if>
				<%
				JobDao dao = new JobDao(DBconnect.getconn());
				List<Jobs> list = dao.getAllJobs();
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