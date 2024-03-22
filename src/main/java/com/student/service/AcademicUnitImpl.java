package com.student.service;

import java.rmi.RemoteException;
import java.util.List;

import com.student.dao.AcademicUnitDao;
import com.student.domain.AcademicUnit;

public class AcademicUnitImpl implements AcademicUnitInterface {
	AcademicUnitDao dao= new AcademicUnitDao();

	@Override
	public void insertAcademicUnit(AcademicUnit academic) throws RemoteException {
		dao.createAcademic(academic);
	}

	@Override
	public AcademicUnit selectAcademicUnit(int academicUnitId) throws RemoteException {
		// TODO Auto-generated method stub
		return dao.selectAcademicUnit(academicUnitId);
	}

	@Override
	public List<AcademicUnit> selectAllAcademicUnit() throws RemoteException {
		// TODO Auto-generated method stub
		return dao.selectAllAcademicUnit();
	}

	@Override
	public boolean deleteAcademicUnit(int id) throws RemoteException {
		// TODO Auto-generated method stub
		dao.deleteAcademicUnit(id);
		return true;
	}

	@Override
	public void updateAcademicUnit(AcademicUnit academic) throws RemoteException {
		dao.updateAcademicUnit(academic);
		
	}

}
