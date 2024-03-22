package com.student.service;

import java.rmi.RemoteException;
import java.util.List;

import com.student.dao.CourseDefinitionDao;
import com.student.domain.CourseDefinition;

public class CourseDefinitionImpl implements CourseDefinitionInterface {
	private CourseDefinitionDao dao=new CourseDefinitionDao();

	@Override
	public void insertCourseDefinition(CourseDefinition courseDefinition) throws RemoteException {
		dao.insertCourseDefinition(courseDefinition);
		
	}

	@Override
	public CourseDefinition selectCourseDefinition(int id) throws RemoteException {
		// TODO Auto-generated method stub
		return dao.selectCourseDefinition(id);
	}

	@Override
	public List<CourseDefinition> selectAllCourseDefinitions() throws RemoteException {
		// TODO Auto-generated method stub
		return dao.selectAllCourseDefinitions();
	}

	@Override
	public boolean deleteCourseDefinition(int id) throws RemoteException {
		// TODO Auto-generated method stub
		return dao.deleteCourseDefinition(id);
	}

	@Override
	public void updateCourseDefinition(CourseDefinition courseDefinition) throws RemoteException {
		// TODO Auto-generated method stub
		dao.updateCourseDefinition(courseDefinition);
		
	}


}
