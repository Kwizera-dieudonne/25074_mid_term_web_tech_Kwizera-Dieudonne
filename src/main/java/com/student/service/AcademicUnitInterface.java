package com.student.service;

import java.rmi.RemoteException;
import java.sql.SQLException;
import java.util.List;

import com.student.domain.AcademicUnit;


public interface AcademicUnitInterface {

	void insertAcademicUnit(AcademicUnit academic) throws RemoteException;

	AcademicUnit selectAcademicUnit(int academicUnitId)throws RemoteException;

	List<AcademicUnit> selectAllAcademicUnit()throws RemoteException;

	boolean deleteAcademicUnit(int id) throws RemoteException;

	void updateAcademicUnit(AcademicUnit academic) throws RemoteException;
}
