<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Apply Job</title>
<%@include file="all_components/all_css.jsp"%>
<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
%>
<style>
.card {
	border-radius: 20px 20px;
	padding: 10px;
	border: 2px solid blue;
}

/* .bg-img{ */
/* background-image: url('img/login.jpg'); */

/* 	height: 88vh; */
/* 	width: auto; */
/* 	background-repeat: no-repeat;  */
/* 	background-size: cover;	 */
/* } */
</style>

</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_components/nav_bar.jsp"%>
	<div class="continer-fluid bg-img">
		<c:if test="${not empty succMsg }">
			<h4 class="text-center text-success">${succMsg }</h4>
			<c:remove var="succMsg" />
		</c:if>
		<c:if test="${not empty succMsg1 }">
			<h4 class="text-center alert alert-danger" role="alert">${succMsg1 }</h4>
			<c:remove var="succMsg1" />
		</c:if>
		<div class="text-center p-5">
			<!-- 							<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i> -->
			<h1 style="color: black">Become a Member of Our Organisation</h1>
		</div>
		<div class="row p-10">
			//
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">

						<form action="ApplyJob" method="post">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label>First Name</label> <input type="text"
										required="required" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										name="fname">
								</div>
								<div class="form-group col-md-6">
									<label>Last Name</label> <input type="text" required="required"
										class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" name="lname">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-4">
									<label>Date Of Birth</label> <input type="date"
										required="required" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										name="dob">
								</div>

								<div class="form-group col-md-4">
									<label>Year Of Graduation</label> <select required="required"
										class="form-control" id="ddlYears"
										aria-describedby="emailHelp" name="yog"></select>
								</div>
								<div class="form-group col-md-4">
									<label>Experience</label> <input type="number" min="0" max="30"
										step="1" required="required" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										name="exp">
								</div>

							</div>
							<div class="form-row">
								<div class="form-group col-md-4">
									<label>Role</label> <input type="text" required="required"
										class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" name="role">
								</div>
								<div class="form-group col-md-4">
									<label>College Name</label> <input type="text"
										required="required" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										name="cname">
								</div>
								<div class="form-group col-md-4">
									<label>Technologies</label> <input type="text"
										required="required" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										name="tech">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-4">
									<label>Phone Number</label> <input type="tel"
										placeholder="923678" pattern="[7-9]{1}[0-9]{9}" required
										class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" name="phone" pattern="[0-9]{10}">
								</div>
								<div class="form-group col-md-4">
									<label>Enter Email</label> <input type="email"
										required="required" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										name="email" value="@gmail.com">
								</div>
								<div class="form-group col-md-4">
									<label>Alternate Phone Number</label> <input type="tel"
										placeholder="923678" pattern="[7-9]{1}[0-9]{9}" required
										class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" name="altphone" pattern="[0-9]{10}">
								</div>
							</div>
							<div class="form-group">
									<label>Address</label> <input type="textarea"
										required="required" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										name="add">
							</div>
							<center>
							<button type="submit" href="userFilterJobs.jsp"
								class="btn btn-primary">Login</button>
							</center>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		window.onload = function() {
			//Reference the DropDownList.
			var ddlYears = document.getElementById("ddlYears");

			//Determine the Current Year.
			var currentYear = (new Date()).getFullYear();

			//Loop and add the Year values to DropDownList.
			for (var i = currentYear; i >= 1970; i--) {
				var option = document.createElement("OPTION");
				option.innerHTML = i;
				option.value = i;
				ddlYears.appendChild(option);
			}
		};
	</script>
</body>
</html>