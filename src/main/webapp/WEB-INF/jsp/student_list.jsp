<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Student List</title>
	<script src="../../webjars/jquery/3.0.0/jquery.min.js"></script>
	<link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
	<script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="../../webjars/angular/1.7.5/angular.js"></script>
	<script src="../../webjars/angular/1.7.5/angular.min.js"></script>
	<script type="text/javascript" src="../../app/Controller.js"></script>
	
</head>
<body ng-app="etiqaApp" ng-controller="studentController as sctrl" ng-init="beforeLoad()">
	<div class="container">
		<h2>Student List</h2>
		<div class="alert alert-danger alert-dismissible" style="display: none;" id="alert-failed-msg"></div>
		<div class="alert alert-success alert-dismissible" style="display: none;" id="alert-success-msg"></div>
		
		<form name="searchForm">
			<div class="row">
				<div class="row">
					<div class="col-md-12 mb-3">
						<label>Name</label>
						<input ng-model="studentSearchCriteria.name" class="form-control"  id="searchName" />
					</div>
					<div class="col-md-12 mb-3">
						<label>Course</label>
						<select ng-model="studentSearchCriteria.courseId" class="form-control" id="searchCourse" >
							<option value="">Select Option</option>
							<option ng-repeat="course in courses" value="{{course.id}}">{{course.courseName}}</option>
						</select>
					</div>
				</div>
			</div>
			<div class="row">
				<a ng-click="searchStudent.searchStudent(studentSearchCriteria)" style="margin:10px;"><button class="btn btn-primary">Search</button></a>
			 	<a ng-click="addStudent.addStudent()"data-toggle="modal" data-target="#addStudent" style="margin:10px;"><button class="btn btn-primary">Add</button></a>
			  	<a ng-click="resetForm.reset()" style="margin:10px;"><button class="btn btn-primary">Reset</button></a>
			</div>
		</form>
		<div class="row">
			<table class="table table-striped">
				<thead>
					<th scope="row">Total</th>
					<th scope="row">Name</th>
					<th scope="row">Email</th>
					<th scope="row">Mobile Number</th>
					<th scope="row">Address</th>
					<th scope="row">Post Code</th>
					<th scope="row">State</th>
					<th scope="row">Country</th>
					<th scope="row">Course Name</th>
					<th scope="row">Update</th>
					<th scope="row">Delete</th>
				</thead>
				<tbody>
					<tr ng-repeat="student in students">
						<td>{{$index + 1}}</td>
						<td>{{student.name}}</td>
						<td>{{student.email}}</td>
						<td>{{student.mobileNo}}</td>
						<td>{{student.address}}</td>
						<td>{{student.postcode}}</td>
						<td>{{student.state}}</td>
						<td>{{student.country}}</td>
						<td>{{student.courseName}}</td>
						<td>
							<button type="button" class="btn btn-default" data-toggle="modal" data-target="#editStudent" ng-click="editStudent.editStudent(student.id)">Edit</button>
						</td>
						<td>
							<button type="button" class="btn btn-default" ng-click="deleteUser.deleteUser(student.id)">Delete</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<!-- Start Add Modal content -->
        <div class="modal fade" id="addStudent" role="dialog">
            <div class="modal-dialog" style="max-width: 800px;">
                <div class="modal-content">
                    <div class="modal-header" style="text-align: left;">
                    	<h3 class="modal-title" style="border-bottom: 1px solid #dddddd;font-weight: bold; color: #000000;">
						 	Add New Student
						 </h3>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
				    </div>
				    <form name="addForm" ng-submit="createStudent.createStudent(student)" cssClass="form">
	                    <div class="modal-body">
							<div class="row">
								<div class="col-md-12 mb-3">
									<label>Name</label>
									<input ng-model="student.name" class="form-control"  id="addName" />
								</div>
							</div>
							<div class="row">
								<div class="col-md-12 mb-3">
									<label>Email</label>
									<input ng-model="student.email" class="form-control"  id="addEmail" />
								</div>
							</div>
							<div class="row">
								<div class="col-md-12 mb-3">
									<label>Mobile Number</label>
									<input ng-model="student.mobileNo" class="form-control"  id="addMobileNo" />
								</div>
							</div>
							<div class="row">
								<div class="col-md-12 mb-3">
									<label>Address</label>
									<input ng-model="student.address" class="form-control"  id="addAddress" />
								</div>
							</div>
							<div class="row">
								<div class="col-md-12 mb-3">
									<label>Post Code</label>
									<input ng-model="student.postcode" class="form-control"  id="addPostcode" />
								</div>
							</div>
							<div class="row">
								<div class="col-md-12 mb-3">
									<label>State</label>
									<input ng-model="student.state" class="form-control"  id="addState" />
								</div>
							</div>
							<div class="row">
								<div class="col-md-12 mb-3">
									<label>Country</label>
									<input ng-model="student.country" class="form-control"  id="addCountry" />
								</div>
							</div>
							<div class="row">
								<div class="col-md-12 mb-3">
									<label>Course</label>
									<select ng-model="student.courseId" class="form-control" id="addCourseId">
											<option value="">Select Option</option>
											<option ng-repeat="course in courses" value="{{course.id}}">{{course.courseName}}</option>
									</select>
								</div>
							</div>
	                    </div>
	                    <div class="modal-footer">
	                    	<button type="submit" class="btn btn-primary">Submit</button>
	                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	                    </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- End Add Modal content -->
        
        <!-- Start Edit Modal content -->
        <div class="modal fade" id="editStudent" role="dialog">
            <div class="modal-dialog" style="max-width: 800px;">
                <div class="modal-content">
                    <div class="modal-header" style="text-align: left;">
                    	<h3 class="modal-title" style="border-bottom: 1px solid #dddddd;font-weight: bold; color: #000000;">
						 	Update Student
						 </h3>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
				    </div>
				    <form ng-submit="updateStudent.updateStudent(student)" cssClass="form">
	                    <div class="modal-body">
							<div class="row">
								<div class="col-md-12 mb-3">
									<label>Name</label>
									<input ng-model="student.name" class="form-control"  id="editName" />
								</div>
							</div>
							<div class="row">
								<div class="col-md-12 mb-3">
									<label>Email</label>
									<input ng-model="student.email" class="form-control"  id="editEmail" />
								</div>
							</div>
							<div class="row">
								<div class="col-md-12 mb-3">
									<label>Mobile Number</label>
									<input ng-model="student.mobileNo" class="form-control"  id="editMobileNo" />
								</div>
							</div>
							<div class="row">
								<div class="col-md-12 mb-3">
									<label>Address</label>
									<input ng-model="student.address" class="form-control"  id="editAddress" />
								</div>
							</div>
							<div class="row">
								<div class="col-md-12 mb-3">
									<label>Post Code</label>
									<input ng-model="student.postcode" class="form-control"  id="editPostcode" />
								</div>
							</div>
							<div class="row">
								<div class="col-md-12 mb-3">
									<label>State</label>
									<input ng-model="student.state" class="form-control"  id="editState" />
								</div>
							</div>
							<div class="row">
								<div class="col-md-12 mb-3">
									<label>Country</label>
									<input ng-model="student.country" class="form-control"  id="editCountry" />
								</div>
							</div>
							<div class="row">
								<div class="col-md-12 mb-3">
									<label>Course</label>
									<select ng-model="student.courseId" class="form-control" id="editCourseId">
											<option value="">Select Option</option>
											<option ng-repeat="course in courses" ng-selected="student.courseId == course.id" value="{{course.id}}">{{course.courseName}}</option>
									</select>
								</div>
							</div>
	                    </div>
	                    <div class="modal-footer">
	                    	<button type="submit" class="btn btn-primary">Update</button>
	                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	                    </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- End Edit Modal content -->
	</div>
</body>
</html>