package com.etiqa.admission.test.service.impl;

import java.util.List;

import javax.persistence.EntityExistsException;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.etiqa.admission.test.model.Student;
import com.etiqa.admission.test.repository.StudentRepository;
import com.etiqa.admission.test.service.StudentService;

@Service("studentServiceImpl")
@Transactional
public class StudentServiceImpl implements StudentService{

	@Autowired
	private StudentRepository repo;

	@Override
	public List<Student> getAllStudent() {
		return (List<Student>) repo.findAll();
	}

	@Override
	public Student getStudentById(long id) {
		return repo.findById(id).get();
	}
	
	@Override
	public List<Student> findByNameContainingAndCourseId(String name, Long courseId) {
		return repo.findByNameContainingAndCourseId(name, courseId);
	}
	
	@Override
	public List<Student> findByNameContaining(String name) {
		return repo.findByNameContaining(name);
	}
	
	@Override
	public List<Student> findByCourseId(Long courseId) {
		return repo.findByCourseId(courseId);
	}

	@Override
	public Student saveOrUpdateStudent(Student student) {
		Student result = repo.save(student);
		return result;
	}
	

	@Override
	public void deleteStudent(long id) {
		repo.deleteById(id);
	}

}