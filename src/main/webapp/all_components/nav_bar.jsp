<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="#">Navbar</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
		<c:choose>
		<c:when test="${!userobj.role eq  'Admin' or 'user' }">
			<li class="nav-item active"><a class="nav-link" href="index.jsp"><i
					class="fas fa-home"></i> Home </a></li>
		</c:when>
			<c:when test="${userobj.role eq 'Admin' }">
			<li class="nav-item active"><a class="nav-link" href="admin.jsp"><i
					class="fas fa-home"></i> Home </a></li>
				<li class="nav-item"><a class="nav-link" href="postjob.jsp"><i
						class="fas fa-plus-circle"></i> Post Job</a></li>
				<li class="nav-item"><a class="nav-link" href="viewjobs.jsp"><i
						class="fas fa-eye"></i> View Job</a></li>
			</c:when>
			<c:when test="${userobj.role eq 'User' }">
			<li class="nav-item active"><a class="nav-link" href="user.jsp"><i
					class="fas fa-home"></i> Home </a></li>
				<li class="nav-item"><a class="nav-link" href="mainframe.html"><i
						class="fas fa-eye"></i>View-All-Jobs</a></li>
			</c:when>
			</c:choose>
		</ul>


		
			<c:choose>
				<c:when test="${userobj.role eq 'Admin' }">


					<!-- Trigger the modal with a button -->
					<a class="btn btn-light mr-1" data-toggle="modal"
						data-target="#myModal"><i class="far fa-id-card"></i>&nbsp;Profile</a>

					<!-- Modal -->
					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog">

							Modal content
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title">Profile</h5>
									<button type="button" class="close" data-dismiss="modal">&times;</button>

								</div>
								<div class="modal-body">
									<div class="card">
										<div class="card-body">
											<center>
												<i class="fa fa-user-plus fa-2x  text-primary"
													aria-hidden="true"></i>
											</center>
											<table class="table border-0">
												<tr>
													<th class="text-info border-0">Name</th>
													<td class="border-0">${userobj.name }</td>
												</tr>
												<tr>
													<th class="text-info border-0">Qualification</th>
													<td class="border-0">${userobj.qualification }</td>
												</tr>
												<tr>
													<th class="text-info border-0">Designation</th>
													<td class="border-0">${userobj.designation }</td>
												</tr>
												<tr>
													<th class="text-info border-0">Role</th>
													<td class="border-0">${userobj.role }</td>
												</tr>
											</table>

										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default">Edit</button>
								</div>
							</div>

						</div>
					</div>



					<form action="signout">
					<button type="submit" class="btn btn-light">
						<i class="fas fa-user-cog"></i> Signout
					</button>
				</form>
				</c:when>
			<c:when test="${userobj.role eq 'User' }">


				<!-- Trigger the modal with a button -->
				<a class="btn btn-light mr-1" data-toggle="modal"
					data-target="#myModal"><i class="far fa-id-card"></i>&nbsp;Profile</a>

				<!-- Modal -->
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Profile</h5>
								<button type="button" class="close" data-dismiss="modal">&times;</button>

							</div>
							<div class="modal-body">
								<div class="card">
									<div class="card-body">
										<center>
											<i class="fa fa-user-plus fa-2x  text-primary"
												aria-hidden="true"></i>
										</center>
										<table class="table border-0">
											<tr>
												<th class="text-info border-0">Name</th>
												<td class="border-0">${userobj.name }</td>
											</tr>
											<tr>
												<th class="text-info border-0">Qualification</th>
												<td class="border-0">${userobj.qualification }</td>
											</tr>
											<tr>
												<th class="text-info border-0">Designation</th>
												<td class="border-0">${userobj.designation }</td>
											</tr>
											<tr>
												<th class="text-info border-0">Role</th>
												<td class="border-0">${userobj.role }</td>
											</tr>
										</table>

									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default">Edit</button>
							</div>
						</div>

					</div>
				</div>


				<form action="signout">
					<button type="submit" class="btn btn-light">
						<i class="fas fa-user-cog"></i> Signout
					</button>
				</form>
			</c:when>

			<c:otherwise>
					<a href="login.jsp" class="btn btn-light mr-1"> <i
						class="fas fa-sign-in-alt"></i> Login
					</a>
					<a href="Signup.jsp" class="btn btn-light"> <i
						class="fas fa-user"></i> Signup
					</a>
				</c:otherwise>
			</c:choose>
		
	</div>
</nav>
