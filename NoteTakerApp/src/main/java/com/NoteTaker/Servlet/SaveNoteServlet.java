package com.NoteTaker.Servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.NoteTaker.Entities.Notes;
import com.NoteTaker.ServiceProvider.FactoryProvider;

/**
 * Servlet implementation class SaveNoteServlet
 */
public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		SessionFactory factory = FactoryProvider.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		try {
				String noteTitle = request.getParameter("title");
				String noteDescription = request.getParameter("content");
				System.out.println("Note Title: " + noteTitle + " and description " + noteDescription);
	
				Notes newNote = new Notes();
				newNote.setNoteTitle(noteTitle);
				newNote.setNoteDescription(noteDescription);
				newNote.setCreateDate(new Date());
				newNote.setModifyDate(new Date());
	
				// one session and save object into db
				session.save(newNote);
				tx.commit();
				session.close();
				System.out.println("note save");
		} catch (Exception e) {
			tx.rollback();
			System.out.println("error occured while saving note object" + e.getMessage());
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
