
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@include file="all_js_css.jsp" %>

<title>Note Taker</title>
  </head>
  <body>
    <div class="container-fluid p-1 m-0">
        <%@include file="navbar.jsp" %>
        <br><!--  -->
        
        
    </div>
    
        <div class="card py-5">
            <img class="img-fluid mx-auto" style="max-width: 400px;" src="img/post-it.png"><!-- comment -->
            <h1 class="text-primary text-uppercase text-center mt-3">Start Taking Your Notes</h1>
            
            <div class="container text-center">
                <button onclick="window.location.href='add_note.jsp'" class="btn btn-outline-primary text-center">Start Here</button>
            </div>
        </div>


  </body>
</html>