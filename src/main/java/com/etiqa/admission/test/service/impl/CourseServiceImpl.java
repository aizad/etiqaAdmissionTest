package com.etiqa.admission.test.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.etiqa.admission.test.model.Course;
import com.etiqa.admission.test.repository.CourseRepository;
import com.etiqa.admission.test.service.CourseService;

@Service("courseServiceImpl")
@Transactional
public class CourseServiceImpl implements CourseService{

	@Autowired
	private CourseRepository repo;

	@Override
	public List<Course> getAllCourse() {
		return (List<Course>) repo.findAll();
	}
	
	@Override
	public Course getCourseById(long id) {
		return repo.findById(id).get();
	}


}