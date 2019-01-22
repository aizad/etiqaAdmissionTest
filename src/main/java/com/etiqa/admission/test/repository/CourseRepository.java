package com.etiqa.admission.test.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.etiqa.admission.test.model.Course;

public interface CourseRepository extends JpaRepository<Course, Long>{
	
}
