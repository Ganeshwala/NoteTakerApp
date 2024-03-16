package com.NoteTaker.Servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.NoteTaker.Entities.Notes;
import com.NoteTaker.ServiceProvider.FactoryProvider;

/**
 * Servlet implementation class UpdateNoteServlet
 */
public class UpdateNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int noteId = Integer.parseInt(request.getParameter("noteId").trim());
		System.out.println(noteId+"<========");
		Session session = FactoryProvider.getSessionFactory().getCurrentSession();
		Transaction tx = session.beginTransaction();
		try {
			String noteTitle = request.getParameter("title");
			String noteDescription = request.getParameter("content");
			Notes newNote = (Notes)session.get(Notes.class, noteId);
			newNote.setNoteTitle(noteTitle);
			newNote.setNoteDescription(noteDescription);
			newNote.setModifyDate(new Date());
			session.update(newNote);
			tx.commit();
			session.close();
			System.out.println("note save");
			response.sendRedirect("showNotes.jsp?Result=success");
		}catch(Exception e) {
			
		}
	}

}
