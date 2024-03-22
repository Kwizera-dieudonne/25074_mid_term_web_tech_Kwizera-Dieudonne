package com.student.service;

import java.rmi.RemoteException;
import java.sql.SQLException;
import java.util.List;

import com.student.domain.Course;


public interface CourseInterface {
	void insertCourse(Course course) throws RemoteException;

	Course selectCourse(int courseId)throws RemoteException;

	List<Course> selectAllCourses()throws RemoteException;

	boolean deleteCourse(int id) throws RemoteException;

	void updateAcademicUnit(Course course)throws RemoteException;
	List<Course> getCourseByDepAndSemester(int acaid, int semid);
	List<Course> getCourseperStudent(int studentId);

}
