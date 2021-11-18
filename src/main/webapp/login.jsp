<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Here</title>
<%@include file="all_components/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_components/nav_bar.jsp"%>
	<div class="continer-fluid">
		<c:if test="${not empty succMsg }">
			<h4 class="text-center text-success">${succMsg }</h4>
			<c:remove var="succMsg" />
		</c:if>
		<div class="row p-5">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
							<h5>Login Page</h5>
						</div>


						<form action="login" method="post">
							<div class="form-group">
								<label>Enter Email</label> <input type="email"
									required="required" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="email">
							</div>

							<div class="form-group">

								<label for="exampleInput Password1">Enter Password</label> <input
									required="required" type="password" class="form-control"
									id="exampleInputPassword1" name="password"> <input
									type="checkbox" onclick="myFunction()">Show Password
								<script>
									function myFunction() {
										var x = document
												.getElementById("exampleInputPassword1");
										if (x.type === "password") {
											x.type = "text";
										} else {
											x.type = "password";
										}
									}
									</script>
							</div>

							<button type="submit" href="admin.jsp"
								class="btn btn-primary badge-pill btn-block">Login</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
