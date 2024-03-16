<!doctype html>
<%@page import="org.hibernate.Transaction"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.NoteTaker.Entities.Notes"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.NoteTaker.ServiceProvider.FactoryProvider" %>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link href="css/style.css" rel="stylesheet ">
	 <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
    <title>Show Notes</title>
  </head>
  <body>
    <div class="container">
    	<%@include file="navbar.jsp" %>
    	<div>
				<%
					boolean i = (request.getParameter("Result") !=null);
					if(i){
						if(request.getParameter("Result").equals("success")){
							%><p style="color:green;">Document Deleted Successfully</p><%
						}
						else if(request.getParameter("Result").equals("fail")){
							%><p style="color:red;">Error whlie Deleting Note</p><%
						}
					}
				%>
			</div>
    	<%
    		Session currentSession = FactoryProvider.getSessionFactory().getCurrentSession();
    		Transaction tx = currentSession.beginTransaction();
    		Query selectNotes  = currentSession.createQuery("from Notes");
    		List<Notes> notesList = selectNotes.list();
    		for(Notes notes : notesList){
    			
    			%>
    			<div class="row">
    				<div class="col-12">
    					<div class="card mt-3">
						  <img src="images/notepad.png" style="max-width: 50px" class="card-img-top m-4 mx-auto" alt="...">
						  <div class="card-body px-5">
						    <h5 class="card-title"><%=notes.getNoteTitle() %></h5>
						    <p class="card-text"><%=notes.getNoteDescription() %></p>
						    	<div class="container text-center mt-2">
						    		<a href="UpdateNoteServlet?noteId=<%=notes.getNoteId() %>" class="btn btn-primary">Update</a>
						    		<a href="DeleteNoteServlet?noteId=<%=notes.getNoteId() %>" class="btn btn-danger">Delete</a>
						    	</div>
						  </div>
						</div>
    				</div>
    			</div>
    			
    			<% 
    		}
    		
    		currentSession.close();
    	%>
    	
    </div>

   
  </body>
</html>