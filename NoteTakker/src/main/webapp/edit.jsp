
<%@page import="com.todo.entities.Note"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.todo.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <%@include file="all_js_css.jsp" %>

        <title>Edit Page</title>
    </head>
    <body>
        <div class="container-fluid p-1 m-0">
            <%@include file="navbar.jsp" %>
            <br><!--  -->
            <h1>Edit Your Note</h1><br>
            <%
                int noteId = Integer.parseInt(request.getParameter("note_id").trim());
                Session s = FactoryProvider.getFactory().openSession();

                Note note = (Note) s.get(Note.class, noteId);

            %>
            
            <form action="UpdateServlet" method="post">
                <input name="noteId" value="<%= note.getId()%>" type="hidden"/>
                <div class="form-group">
                    <label for="title">Note Title</label>
                    <input name="title" value="<%= note.getTitle() %>" type="text" class="form-control" id="title" placeholder="Enter Note Title" required>
                </div>
                <div class="form-group">
                    <label for="content">Note Content</label>
                    <textarea name="content" class="form-control" id="content" placeholder="Enter Content Here" style="height: 300px" required><%=note.getContent()%></textarea>
                </div>

                <div class="container text-center">

                    <button type="submit" class="btn btn-success">Save</button>

                </div>
            </form>
        </div>




    </body>
</html>