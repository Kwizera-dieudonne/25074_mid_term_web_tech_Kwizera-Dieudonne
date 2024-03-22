package com.student.service;

import java.rmi.RemoteException;
import java.util.List;

import com.student.dao.CourseDao;
import com.student.domain.Course;

public class CourseImpl implements CourseInterface {
   private CourseDao dao= new CourseDao();
	@Override
	public void insertCourse(Course course) throws RemoteException {
		dao.createCourse(course);
		
	}

	@Override
	public Course selectCourse(int courseId) throws RemoteException {
		// TODO Auto-generated method stub
		return dao.selectCourse(courseId);
	}

	@Override
	public List<Course> selectAllCourses() throws RemoteException {
		// TODO Auto-generated method stub
		return dao.selectAllCourses();
	}

	@Override
	public boolean deleteCourse(int id) throws RemoteException {
		// TODO Auto-generated method stub
		return dao.deleteCourse(id);
	}

	@Override
	public void updateAcademicUnit(Course course) throws RemoteException {
		// TODO Auto-generated method stub
		dao.updateCourse(course);
	}

	@Override
	public List<Course> getCourseByDepAndSemester(int acaid, int semid) {
		// TODO Auto-generated method stub
		return dao.getCoursesByAcademicUnitAndSemester(acaid, semid);
	}

	@Override
	public List<Course> getCourseperStudent(int studentId) {
		// TODO Auto-generated method stub
		return dao.getCoursesByStudent(studentId);
	}
	

	
		
	

}
