package com.NoteTaker.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.NoteTaker.Entities.Notes;
import com.NoteTaker.ServiceProvider.FactoryProvider;

/**
 * Servlet implementation class DeleteNoteServlet
 */
public class DeleteNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int noteId = Integer.parseInt(request.getParameter("noteId").trim());
		Session session;
		Transaction tx ;
		session = FactoryProvider.getSessionFactory().getCurrentSession();
		tx = session.beginTransaction();
		try {
			
			Notes note = (Notes)session.get(Notes.class, noteId);
			session.delete(note);
			tx.commit();
			System.out.println("Note deleted Succesfully");
			session.close();
			response.sendRedirect("showNotes.jsp?Result=success");
		}catch(Exception e) {
			tx.rollback();
			response.sendRedirect("showNotes.jsp?Result=fail");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
