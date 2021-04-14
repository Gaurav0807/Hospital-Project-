<%@page import="java.util.List" %>
<%@page import="org.hibernate.Query" %>
<%@page import="com.helper.FactoryProvider" %>
<%@page import="org.hibernate.Session" %>
<%@page import="com.entites.*"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet" >
    <title>Patients List</title>
  </head>
  <body>
   
   <div class="container">
   
   <%@include file="navbar.jsp" %>
   <br>
   
   <h1 style="text-align:left;">Patients :-</h1>
   
   <div class="row">
  		 <div class="col-12">
  		    <table class="table">
  		    <thead>
   <tr>
     <th scope="col">Id</th>
     <th scope="col">Name</th>
     <th scope="col">Address</th>
     <th scope="col">Problem</th>
     <th scope="col">Date</th>
     <th scope="col">Delete</th>
     <th scope="col">Show</th>
   </tr>
 </thead>
 
    <% 
   Session s = FactoryProvider.getFactory().openSession();
   Query q = s.createQuery("from Hospital");
   List<Hospital> list = q.list();
   %>
   
 <%
   for(Hospital h:list)
   {
	  %>
	
  <tbody>
    <tr>
      <th scope="row"><%=h.getId() %></th>
      <td><%=h.getName() %></td>
      <td><%=h.getAddress() %></td>
      <td><%=h.getProblem()%></td>
      <td><%=h.getAddedDate() %></td>
      <td><a href="DeleteServlet?Pid=<%= h.getId()%>" class="btn btn-primary">Delete</a></td>
       <td><a href="show_specific.jsp?Pid=<%= h.getId()%>" class="btn btn-danger">Show</a></td>
    </tr>
  </tbody>

	   
	  
	   <%
   }
   
   %>
   </table>
   
  			 </div> 
   </div>
    
  
   
</div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>