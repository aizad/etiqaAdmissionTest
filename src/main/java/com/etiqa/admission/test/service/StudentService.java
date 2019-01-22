package com.etiqa.admission.test.service;

import java.util.List;

import com.etiqa.admission.test.model.Student;

public interface StudentService {
	
	List<Student> getAllStudent();
	
	Student getStudentById(long id);

	List<Student> findByNameContainingAndCourseId(String name, Long courseId);
	
	List<Student> findByNameContaining(String name);
	
	List<Student> findByCourseId(Long courseId);
	
	Student saveOrUpdateStudent(Student Student);
	
	void deleteStudent(long id);

	
	
	
	
}
