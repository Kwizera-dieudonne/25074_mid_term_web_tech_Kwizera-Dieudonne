package com.student.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.student.domain.Course;
import com.student.domain.Student;


public class CourseDao {

	public CourseDao() {
	}
	public void createCourse(Course course) {
		Transaction trans=null;
		Session session= HibernateUtil.getsession().openSession();
		
		try {
			trans=session.beginTransaction();
			session.save(course);
			trans.commit();
			session.close();
		    } catch (Exception e) {
		        if (trans != null) {
		            trans.rollback();
		        }
		        e.printStackTrace();
		    } finally {
		        if (session != null) {
		            session.close(); // Close the session in the finally block
		        }
		    }
	}
	public Course selectCourse(int courseid) {
		Transaction transaction = null;
		Course course = null;
		try (Session session = HibernateUtil.getsession().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// get an academic unit object
			course = session.get(Course.class, courseid);
			// commit transaction
			transaction.commit();
			session.close();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return course;
	}

	public List<Course> selectAllCourses() {
	    Transaction transaction = null;
	    List<Course> courses = null;
	    Session session = HibernateUtil.getsession().openSession();

	    try {
	        transaction = session.beginTransaction();
	        courses = session.createQuery("from Course", Course.class).list();
	        // Commit the transaction
	        transaction.commit();
	        session.close();
	    } catch (Exception e) {
	        if (transaction != null) {
	            transaction.rollback();
	        }
	        e.printStackTrace();
	    } finally {
	        if (session != null && session.isOpen()) {
	            session.close(); // Close the session in the finally block if it's open
	        }
	    }
	    return courses;
	}


	public boolean deleteCourse(int id) {
		Transaction transaction = null;
        Session session = HibernateUtil.getsession().openSession();

        try {
            // Start a transaction
            transaction = session.beginTransaction();
            // Get the student to delete
            Course course = session.get(Course.class, id);
            if (course != null) {
                session.delete(course);
                transaction.commit();
                session.close();
                return true;
               
            }
            transaction.commit();
            session.close();
            return false;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            if (session != null) {
                session.close(); // Close the session in the finally block
            }
        }
		
	}

	public void updateCourse(Course course){
		Transaction transaction = null;
		try (Session session = HibernateUtil.getsession().openSession()) {
			transaction = session.beginTransaction();
			session.saveOrUpdate(course);
			transaction.commit();
			session.close();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}

		
	}
	public List<Course> getCoursesByAcademicUnitAndSemester(int academicUnitId, int semesterId) {
	    Transaction transaction = null;
	    Session session = HibernateUtil.getsession().openSession();
	    List<Course> courses = new ArrayList<Course>();

	    try {
	        transaction = session.beginTransaction();

	        String hql = "SELECT DISTINCT c FROM Course c " +
	                     "JOIN c.academic academic " +
	                     "JOIN c.sems semester " +
	                     "WHERE academic.id = :academicUnitId " +
	                     "AND semester.semid = :semesterId";

	        courses = session.createQuery(hql, Course.class)
	                        .setParameter("academicUnitId", academicUnitId)
	                        .setParameter("semesterId", semesterId)
	                        .list();

	        transaction.commit();
	    } catch (Exception e) {
	        if (transaction != null) {
	            transaction.rollback();
	        }
	        e.printStackTrace();
	    } finally {
	        if (session != null) {
	            session.close();
	        }
	    }

	    return courses;
	}
	public List<Course> getCoursesByStudent(int studentId) {
	    Transaction transaction = null;
	    Session session = HibernateUtil.getsession().openSession();
	    List<Course> courses = new ArrayList<>();

	    try {
	        transaction = session.beginTransaction();

	        String hql = "SELECT DISTINCT c FROM Course c " +
	                     "JOIN c.students student " +
	                     "WHERE student.student.id = :studentId";

	        courses = session.createQuery(hql, Course.class)
	                        .setParameter("studentId", studentId)
	                        .list();

	        transaction.commit();
	    } catch (Exception e) {
	        if (transaction != null) {
	            transaction.rollback();
	        }
	        e.printStackTrace();
	    } finally {
	        if (session != null) {
	            session.close();
	        }
	    }

	    return courses;
	}



}
