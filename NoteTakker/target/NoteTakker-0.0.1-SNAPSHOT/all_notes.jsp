<%-- 
    Document   : all_notes
    Created on : 19-Aug-2024, 3:10:31 pm
    Author     : user
--%>


<%@page import="org.hibernate.query.Query"%>
<%@page import="com.todo.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.todo.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Notes</title>
        <%@include file="all_js_css.jsp" %>
    </head>
    <body>
        <div class="container-fluid p-1 m-0">
            <%@include file="navbar.jsp" %>
            <br
                <h1 class="text-uppercase">All Notes: </h1>

            <div class="row">

                <div class="col-12">

                    <%
                        Session s = FactoryProvider.getFactory().openSession();
                        Query q = s.createQuery("from Note");
                        List<Note> list = q.list();
                        for (Note note : list) {
                    %>
                    <div class="card mt-3" >
                        <img src="img/post-it.png" style="max-width: 100px;" class="card-img-top m-2 mx-auto" alt="Card image cap">
                        <div class="card-body px-5">
                            <h5 class="card-title"><%= note.getTitle()%></h5>
                            <p class="card-text"><%= note.getContent()%></p>
                            <p class="card-text" style="font-family: cursive;">Last Update: <b class="text-primary"><%= note.getAddedDate()%></b></p>
                            <div class="container text-center mt-2">
                                <a href="DeleteServlet?note_id=<%= note.getId() %>" class="btn btn-danger">Delete</a>
                                <a href="edit.jsp?note_id=<%= note.getId() %>" class="btn btn-primary">Update</a>
                            </div>
                        </div>
                    </div>    

                    <%
                        }

                        s.close();

                    %>
                </div>
            </div>

        </div>
    </body>
</html>
