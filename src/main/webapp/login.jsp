<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Here</title>
<%@include file="all_components/all_css.jsp"%>
<%response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); %>
<style>
.card{
border-radius:50px 20px;
padding :10px;
border: 2px solid blue;
 
}

.bg-img{
background-image: url('img/login.jpg');

	height: 88vh;
	width: auto;
	background-repeat: no-repeat; 
	background-size: cover;	
}
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
							<h1 style="color:white">Login</h1>
						</div>
		<div class="row p-10">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						
						<form action="login" method="post">
							<div class="form-group">
								<label>Enter Email</label> <input type="email"  
									required="required" class="form-control" 
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="email" value="@gmail.com">
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
