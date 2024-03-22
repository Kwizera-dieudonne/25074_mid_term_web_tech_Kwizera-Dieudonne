package com.student.dao;

import java.util.Properties;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;
import com.student.domain.AcademicUnit;
import com.student.domain.Course;
import com.student.domain.CourseDefinition;
import com.student.domain.Semester;
import com.student.domain.Student;
import com.student.domain.StudentRegistration;
import com.student.domain.Teacher;
import com.student.domain.Users;

public class HibernateUtil {
	private  static SessionFactory sessionfactory;
	public static SessionFactory getsession() {
		if(sessionfactory == null) {
			try {
				Configuration configuration= new Configuration();
				Properties settings=new Properties();
				settings.put(Environment.DRIVER, "org.postgresql.Driver");
				settings.put(Environment.URL, "jdbc:postgresql://localhost:5432/Admission");
				settings.put(Environment.USER, "postgres");
				settings.put(Environment.PASS, "1");
				settings.put(Environment.DIALECT, "org.hibernate.dialect.PostgreSQLDialect");
				settings.put(Environment.SHOW_SQL, "true");
				settings.put(Environment.CURRENT_SESSION_CONTEXT_CLASS, "thread");
				settings.put(Environment.HBM2DDL_AUTO, "update");
				configuration.setProperties(settings);
				configuration.addAnnotatedClass(Course.class);
				configuration.addAnnotatedClass(CourseDefinition.class);
				configuration.addAnnotatedClass(Semester.class);
				configuration.addAnnotatedClass(AcademicUnit.class);
				configuration.addAnnotatedClass(Student.class);
				configuration.addAnnotatedClass(Teacher.class);
				configuration.addAnnotatedClass(StudentRegistration.class);
				configuration.addAnnotatedClass(Users.class);
				
				
				 
				
				ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
						.applySettings(configuration.getProperties()).build();
				System.out.println("Hibernate Java Config serviceRegistry created");
				sessionfactory = configuration.buildSessionFactory(serviceRegistry);
				return sessionfactory;
				
				
			}
			catch(Exception ex) {
				ex.printStackTrace();
                throw new RuntimeException("Error initializing Hibernate SessionFactory: " + ex.getMessage(), ex);
            }
			
		}
		return sessionfactory;
	}


}
