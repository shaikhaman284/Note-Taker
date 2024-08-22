<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <%@include file="all_js_css.jsp" %>

        <title>Add Note</title>
    </head>
    <body>
        <div class="container-fluid p-1 m-0">
            <%@include file="navbar.jsp" %>

            <br><!-- comment -->
            <h1>Add Your Notes</h1>

            <form action="SaveNoteServlet" method="post">
                <div class="form-group">
                    <label for="title">Note Title</label>
                    <input name="title" type="text" class="form-control" id="title" placeholder="Enter Note Title" required>
                </div>
                <div class="form-group">
                    <label for="content">Note Content</label>
                    <textarea name="content" class="form-control" id="content" placeholder="Enter Content Here" style="height: 300px" required></textarea>
                </div>

                <div class="container text-center">

                    <button type="submit" class="btn btn-primary">Add</button>

                </div>
            </form>
        </div>


    </body>
</html>
