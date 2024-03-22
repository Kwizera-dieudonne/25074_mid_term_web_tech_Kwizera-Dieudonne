package com.student.service;

import java.rmi.RemoteException;
import java.util.List;

import com.student.domain.Semester;

public interface SemesterInterface {


   void insertSemester(Semester semester)throws RemoteException;

   Semester selectSemester(int semesterId)throws RemoteException;

   List<Semester> selectAllSemesters()throws RemoteException;

   boolean deleteSemester(int id)throws RemoteException;

   void updateSemester(Semester semester)throws RemoteException;

}
