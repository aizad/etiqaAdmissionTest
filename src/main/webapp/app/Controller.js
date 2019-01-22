var app = angular.module('etiqaApp', []);

app.constant('urls', {
    STUDENT_SERVICE_API : 'http://localhost:8090/api/'
});

app.controller('studentController', ['$scope', '$http', 'urls', function ($scope, $http, urls) {

        $scope.student, $scope.courses, $scope.courseId, $scope.courseName = null;
        $scope.students, $scope.studentSearchCriteria = {};
        
        $scope.beforeLoad = function () {
            $scope.getCourse.getAllCourse();
        }
        
        $scope.resetForm = {
        		reset: function () {
        			$scope.student, $scope.courses, $scope.courseId, $scope.courseName = null;
        			$scope.students, $scope.studentSearchCriteria = {};
        			clearAlert();
            }
        }
        
        $scope.viewStudent = {
        		getAllStudent: function () {
    			clearAlert();
                $http({
                    method: 'GET',
                    url: urls.STUDENT_SERVICE_API + 'student/',
                }).then(function successCallback(response) {
                    if (response.status == 200) {
                        $scope.students = response.data;
                    }else if(response.status == 204){
                    	$scope.students = {};
                    	$("#alert-failed-msg").html("No Record Found");
                        $("#alert-failed-msg").show();
                    }
                });
            }
        }
        
        $scope.searchStudent = {
        		searchStudent: function (studentSearchCriteria) {
    			clearAlert();
                $http({
                    method: 'POST',
                    url: urls.STUDENT_SERVICE_API + 'student/search/',
                    data :
                    {
                    	name: studentSearchCriteria.name,
                        courseId: studentSearchCriteria.courseId
                    }
                }).then(function successCallback(response) {
                    if (response.status == 200) {
                    	$scope.students = response.data;
                    }else if(response.status == 204){
                    	$scope.students = {};
                    	$("#alert-failed-msg").html("No Record Found");
                        $("#alert-failed-msg").show();
                    }
                });

            }
        }

        $scope.addStudent = {
        		addStudent: function () {
        			$scope.student = null;
            }
        }
        
        $scope.createStudent = {
        		createStudent: function (student) {
    			clearAlert();
                $http({
                    method: 'POST',
                    url: urls.STUDENT_SERVICE_API + 'student/',
                    data : student
                }).then(function successCallback(response) {
                    if (response.status == 200) {
                    	$scope.viewStudent.getAllStudent();
                        $('#addStudent').modal('hide');
                    	$("#alert-success-msg").html("Successfully Saving Record");
                        $("#alert-success-msg").show();
                    }else if(response.status == 409){
                    	$("#alert-failed-msg").html("Request could not be completed due to a conflict");
                        $("#alert-failed-msg").show();
                    }
                });
                

            }
        }
        
        $scope.editStudent = {
        		editStudent: function (id) {
    			clearAlert();
				 $http({
	                 method: 'GET',
	                 url: urls.STUDENT_SERVICE_API + 'student/' + id
	             }).then(function successCallback(response) {
	                 if (response.status == 200) {
	                	 $scope.student = response.data;
	                 }else if(response.status == 204){
                    	$scope.students = {};
                    	$("#alert-failed-msg").html("No Record Found");
                        $("#alert-failed-msg").show();
                    }
	             });
        			
            }
        }
        
        $scope.updateStudent = {
        		updateStudent: function (student) {
    			clearAlert();
                $http({
                    method: 'PUT',
                    url: urls.STUDENT_SERVICE_API + 'student/',
                    data : student
                }).then(function successCallback(response) {
                    if (response.status == 200) {
	                	$scope.viewStudent.getAllStudent();
	                    $('#editStudent').modal('hide');
	                	$("#alert-success-msg").html("Successfully Updating Record");
	                    $("#alert-success-msg").show();
                    }else if(response.status == 204){
                    	$scope.students = {};
                    	$("#alert-failed-msg").html("No Record Found");
                        $("#alert-failed-msg").show();
                    }else if(response.status == 409){
                    	$scope.students = {};
                    	$("#alert-failed-msg").html("Request could not be completed due to a conflict");
                        $("#alert-failed-msg").show();
                    }
                });
            }
        }

        $scope.deleteUser = {
        		deleteUser: function (id) {
    			clearAlert();
                $http({
                    method: 'DELETE',
                    url: urls.STUDENT_SERVICE_API + 'student/' + id
                }).then(function successCallback(response) {
                    if (response.status == 200) {
                    	$scope.viewStudent.getAllStudent();
                        $("#alert-success-msg").html("Successfully Deleting Record");
                        $("#alert-success-msg").show();
                    }
                });
                	
            }
        }

        $scope.getCourse = {
        		getAllCourse: function () {
                $http({
                    method: 'GET',
                    url: urls.STUDENT_SERVICE_API + 'course/',
                }).then(function successCallback(response) {
                    if (response.status == 200) {
                    	$scope.courses = response.data;
                    }
                });
            }
        }
        
        function clearAlert(){
        	$("#alert-success-msg").html("");
            $("#alert-success-msg").hide();
            $("#alert-failed-msg").html("");
            $("#alert-failed-msg").hide();
        }
        
    }]);