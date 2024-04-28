package com.student.service;



import com.student.domain.Users;

public interface UsersService {
	
	void insertUsers(Users user);
	Users authenticate(String email, String password);

}
