package com.etiqa.admission.test.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.etiqa.admission.test.model.Student;

public interface StudentRepository extends JpaRepository<Student, Long>{

	List<Student> findByNameContainingAndCourseId(String name, Long courseId);
	
	List<Student> findByNameContaining(String name);
	
	List<Student> findByCourseId(Long courseId);
	
}
