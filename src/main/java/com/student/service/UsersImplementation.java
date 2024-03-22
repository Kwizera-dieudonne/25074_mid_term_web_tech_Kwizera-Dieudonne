package com.student.service;

import com.student.dao.UsersDao;
import com.student.domain.Users;

public class UsersImplementation implements UsersService {
	private UsersDao dao=new UsersDao();

	@Override
	public void insertUsers(Users user) {
		// TODO Auto-generated method stub
		dao.insertUser(user);
		
	}

	@Override
	public Users authenticate(String email, String password) {
		// TODO Auto-generated method stub
		return dao.authenticate(email, password);
	}
	

}
