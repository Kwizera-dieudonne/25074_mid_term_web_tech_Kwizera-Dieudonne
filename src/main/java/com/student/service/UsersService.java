package com.student.service;

import java.rmi.RemoteException;

import com.student.domain.Users;

public interface UsersService {
	
	void insertUsers(Users user);
	Users authenticate(String email, String password);

}
