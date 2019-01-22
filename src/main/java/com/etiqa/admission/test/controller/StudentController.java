package com.etiqa.admission.test.controller;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.etiqa.admission.test.model.Course;
import com.etiqa.admission.test.model.Student;
import com.etiqa.admission.test.model.StudentSearchCriteria;
import com.etiqa.admission.test.service.CourseService;
import com.etiqa.admission.test.service.StudentService;

@RestController
@RequestMapping(value = "/api")
public class StudentController {

	public static final Logger logger = LoggerFactory.getLogger(StudentController.class);

	@Autowired
	StudentService studentService;

	@Autowired
	CourseService courseService;

	@RequestMapping(value = "/student/", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<Student>> getAllStudent() {
		logger.info("list All Student");
		List<Student> studentList = studentService.getAllStudent();
		if (studentList.isEmpty()) {
			return new ResponseEntity<List<Student>>(HttpStatus.NO_CONTENT);
		} else {
			for (Student student : studentList) {
				student.setCourseName(getCourseById(student.getCourseId()));
			}
		}
		return new ResponseEntity<List<Student>>(studentList, HttpStatus.OK);
	}

	@RequestMapping(value = "/student/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Student> getStudentById(@PathVariable("id") long id) {
		logger.info("list All Student");
		Student student = studentService.getStudentById(id);
		if (student == null) {
			return new ResponseEntity<Student>(HttpStatus.NO_CONTENT);
		} else {
			student.setCourseName(getCourseById(student.getCourseId()));
		}
		return new ResponseEntity<Student>(student, HttpStatus.OK);
	}

	@RequestMapping(value = "/student/search/", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<Student>> searchStudent(@RequestBody StudentSearchCriteria studentSearchCriteria) {
		logger.info("search Student (" + studentSearchCriteria.getName() + ", " + studentSearchCriteria.getCourseId()
				+ " )");
		List<Student> studentList = null;
		if (studentSearchCriteria.getName() == null && studentSearchCriteria.getCourseId() == null) {
			studentList = studentService.getAllStudent();
		} else if (studentSearchCriteria.getName() != null && studentSearchCriteria.getCourseId() == null) {
			studentList = studentService.findByNameContaining(studentSearchCriteria.getName());
		} else if (studentSearchCriteria.getName() == null && studentSearchCriteria.getCourseId() != null) {
			studentList = studentService.findByCourseId(studentSearchCriteria.getCourseId());
		} else {
			studentList = studentService.findByNameContainingAndCourseId(studentSearchCriteria.getName(),
					studentSearchCriteria.getCourseId());
		}

		if (studentList == null || studentList.isEmpty()) {
			return new ResponseEntity<List<Student>>(HttpStatus.NO_CONTENT);
		} else {
			for (Student student : studentList) {
				student.setCourseName(getCourseById(student.getCourseId()));
			}
		}
		return new ResponseEntity<List<Student>>(studentList, HttpStatus.OK);
	}

	@RequestMapping(value = "/student/", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Student> createStudent(@RequestBody Student student) throws URISyntaxException {
		logger.info("Creating Student : {}", student);

		try {
			student.setStatus(Long.parseLong("1"));
			student.setCreatedBy("SYSTEM");
			student.setCreatedDt(new Date());
			student.setLastModifiedBy("SYSTEM");
			student.setLastModifiedDt(new Date());
			Student result = studentService.saveOrUpdateStudent(student);
			return new ResponseEntity<Student>(result, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Student>(HttpStatus.CONFLICT);
		}
	}

	@RequestMapping(value = "/student/", method = RequestMethod.PUT, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Student> updateStudent(@RequestBody Student student) throws URISyntaxException {
		logger.info("Updating Student : {}", student);
		if (student.getId() == null) {
			return new ResponseEntity<Student>(HttpStatus.NOT_FOUND);
		}

		try {
			Student currentStudent = studentService.getStudentById(student.getId());
			currentStudent.setName(student.getName());
			currentStudent.setEmail(student.getEmail());
			currentStudent.setMobileNo(student.getMobileNo());
			currentStudent.setAddress(student.getAddress());
			currentStudent.setPostcode(student.getPostcode());
			currentStudent.setState(student.getState());
			currentStudent.setCountry(student.getCountry());
			currentStudent.setCourseId(student.getCourseId());
			student.setStatus(Long.parseLong("1"));
			currentStudent.setLastModifiedBy("SYSTEM");
			currentStudent.setLastModifiedDt(new Date());

			Student result = studentService.saveOrUpdateStudent(currentStudent);
			return new ResponseEntity<Student>(result, HttpStatus.OK);

		} catch (Exception e) {
			return new ResponseEntity<Student>(HttpStatus.CONFLICT);
		}
	}

	@RequestMapping(value = "/student/{id}", method = RequestMethod.DELETE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Student> deleteStudent(@PathVariable Long id) {
		logger.info("Deleting Student with id : {}", id);
		studentService.deleteStudent(id);
		return new ResponseEntity<Student>(new Student(), HttpStatus.OK);
	}

	@RequestMapping(value = "/course/", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public List<Course> getCourselist() {
		List<Course> courseList = courseService.getAllCourse();
		return courseList;
	}

	public String getCourseById(Long id) {
		Course course = courseService.getCourseById(id);
		logger.info("Get course name : {}", course.getCourseName());
		return course.getCourseName();
	}

}
