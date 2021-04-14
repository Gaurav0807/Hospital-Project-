<%@page import="java.util.List" %>
<%@page import="org.hibernate.Query" %>
<%@page import="com.helper.FactoryProvider" %>
<%@page import="org.hibernate.Session" %>
<%@page import="com.entites.*"%>
<%@page import="org.hibernate.Transaction"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet" >

<title>Specific Data</title>
</head>
<body>

   <div class="container">
   
   <%@include file="navbar.jsp" %>
   <br>
     <h1 style="text-align:left;">Patient :-</h1>
     
     <%
     int Pid=Integer.parseInt(request.getParameter("Pid").trim());
		Session s = FactoryProvider.getFactory().openSession();
		Transaction tx = s.beginTransaction();
		Hospital h = (Hospital)s.get(Hospital.class,Pid);
     %>
    
     
     <div class="card" style="width: 18rem;">
  
  <div class="card-body"  style="text-align: center">
    <h5 class="card-title">Name:-<%=h.getName() %></h5>
    <h5 class="card-title">Date:-<%=h.getAddedDate() %></h5>
    <p class="card-text">Address:-<%=h.getAddress() %></p>
    <p class="card-text">Problem:-<%=h.getProblem()%></p>
    
    
    <a href="all_patients.jsp" class="btn btn-success">Go Back</a>
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