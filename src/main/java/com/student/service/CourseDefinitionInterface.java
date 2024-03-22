package com.student.service;

import java.rmi.RemoteException;
import java.util.List;

import com.student.domain.CourseDefinition;


public interface CourseDefinitionInterface {
    void insertCourseDefinition(CourseDefinition courseDefinition) throws RemoteException;

    CourseDefinition selectCourseDefinition(int id) throws RemoteException;

    List<CourseDefinition> selectAllCourseDefinitions()throws RemoteException;

    boolean deleteCourseDefinition(int id) throws RemoteException;
    
    void updateCourseDefinition(CourseDefinition courseDefinition) throws RemoteException;

}
