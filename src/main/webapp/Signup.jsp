<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Signup Here</title>
<%@include file="all_components/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_components/nav_bar.jsp"%>
	<div class="continer-fluid">
		<c:if test="${not empty succMsg }">
			<h4 class="text-center text-danger">${succMsg }</h4>
			<c:remove var="succMsg" />
		</c:if>
		<div class="row p-5">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
							<h5>Registration</h5>
						</div>


						<form action="signup" method="post">
							<div class="form-group">
								<label>Enter Full Name</label> <input type="text"
									required="required" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="name">
							</div>

							<div class="form-group">
								<label>Enter Your Qualification</label> <input type="text"
									required="required" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="qualification">
							</div>

							<div class="form-group">
								<label>Enter Email</label> <input type="email"
									required="required" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="email">
							</div>

							<div class="form-group">

								<label for="password">Enter Password</label>
								<div class="card">
									<div class="input-group border-0" id="show_hide_password">
										<input required="required" type="password"
											class="form-control" id="password" name="password">&nbsp;&nbsp;
										<div class="input-group-addon align-bottom" >

											<a href=" "><i class="fa fa-eye-slash"
												id="togglePassword" aria-hidden="true"></i></a>&nbsp;&nbsp;
										</div>

									</div>
								</div>
							</div>

							<div class="form-group">
								<label>Enter Designation</label> <input type="text"
									required="required" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="designation">

							</div>

							<div class="form-group">
								<label>Select Role</label><br /> <input type="radio"
									value="Admin" required="required" aria-describedby="emailHelp"
									name="role">Admin &nbsp; &nbsp; <input type="radio"
									value="User" required="required" aria-describedby="emailHelp"
									name="role">User
							</div>

							<button type="submit"
								class="btn btn-primary badge-pill btn-block">Register</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	$(document).ready(function() {
	    $("#show_hide_password a").on('click', function(event) {
	        event.preventDefault();
	        if($('#show_hide_password input').attr("type") == "text"){
	            $('#show_hide_password input').attr('type', 'password');
	            $('#show_hide_password i').addClass( "fa-eye-slash" );
	            $('#show_hide_password i').removeClass( "fa-eye" );
	        }else if($('#show_hide_password input').attr("type") == "password"){
	            $('#show_hide_password input').attr('type', 'text');
	            $('#show_hide_password i').removeClass( "fa-eye-slash" );
	            $('#show_hide_password i').addClass( "fa-eye" );
	        }
	    });
	});
	</script>
</body>
</html>