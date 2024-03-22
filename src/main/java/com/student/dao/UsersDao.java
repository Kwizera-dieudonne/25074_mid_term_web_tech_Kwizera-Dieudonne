package com.student.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import com.student.domain.Users;

public class UsersDao {

	public UsersDao() {
	}

	public void insertUser(Users users) {
		Transaction transaction=null;
		Session session=HibernateUtil.getsession().openSession();
		try {
			transaction=session.beginTransaction();
			session.save(users);
			transaction.commit();
			session.close();
		}
		catch(Exception ex) {
			if(transaction!=null) {
				transaction.rollback();
			}
			ex.printStackTrace();

		}
		finally {
			if(session!=null) {
				session.close();
			}
		}
	}
	
	public Users authenticate(String email, String password) {
		Session session=HibernateUtil.getsession().openSession();
		Transaction tx=session.beginTransaction();
		Users authUser=null;
		try {
			String hql="FROM Users where email= :email and password= :password";
			Query query=session.createQuery(hql);
			query.setParameter("email", email);
			query.setParameter("password", password);
			List<Users>allUsers=query.list();
			if(!allUsers.isEmpty()) {
				
				authUser=allUsers.get(0);
			}
			tx.commit();
			session.close();

		}
			
		catch(Exception ex) {
			  ex.printStackTrace();
	        } finally {
            if (session != null) {
            	session.close();
            }
            }      
		return authUser;
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
