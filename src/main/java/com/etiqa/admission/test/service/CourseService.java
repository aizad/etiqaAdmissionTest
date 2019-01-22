package com.etiqa.admission.test.service;

import java.util.List;

import com.etiqa.admission.test.model.Course;

public interface CourseService {
	
	List<Course> getAllCourse();
	
	Course getCourseById(long id);
	
	
}
