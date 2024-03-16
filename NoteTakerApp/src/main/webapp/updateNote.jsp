<!doctype html>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.NoteTaker.ServiceProvider.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.NoteTaker.Entities.Notes"%>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet ">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

<!-- Optional JavaScript; choose one of the two! -->

<!-- Option 1: Bootstrap Bundle with Popper -->


<!-- Option 2: Separate Popper and Bootstrap JS -->
<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
<title>Update Notes</title>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>



		<form action=UpdateNoteServlet method="post">
			<%
				int noteId = Integer.parseInt(request.getParameter("noteId"));
				Session ses = FactoryProvider.getSessionFactory().getCurrentSession();
				Transaction tx = ses.beginTransaction();
				Notes note = (Notes) ses.get(Notes.class, noteId);
			%>

			<div class="mb-3">
				<input
					name="noteId" type="hidden" class="form-control" 
					value="<%=note.getNoteId()%>">
			</div>

			<div class="mb-3">
				<label for="title" class="form-label">Note Title</label> <input
					name="title" type="text" class="form-control" id="title"
					placeholder="Enter Title" required="required"
					value="<%=note.getNoteTitle()%>">
			</div>
			<div class="mb-3">
				<label for="content" class="form-label">Description</label>
				<textarea name="content" id="content" placeholder="enter contents"
					class="form-control" style="height: 300px" required><%=note.getNoteDescription()%></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-primary">Add</button>
			</div>

		</form>
		<div>
			<%
			boolean i = (request.getParameter("Result") != null);
			if (i) {
				if (request.getParameter("Result").equals("success")) {
			%><p style="color: green;">Document Added Successfully</p>
			<%
			} else if (request.getParameter("Result").equals("fail")) {
			%><p style="color: red;">Error whlie adding Document</p>
			<%
			}
			}
			%>
		</div>

	</div>






</body>
</html>