package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entites.Hospital;
import com.helper.FactoryProvider;


public class SaveForm extends HttpServlet {
	private static final long serialVersionUID = 1L;

  
    public SaveForm() {
        // TODO Auto-generated constructor stub
    }

	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			String name=request.getParameter("name");
			String address = request.getParameter("address");
			String problem = request.getParameter("problem");
			Hospital h = new Hospital(name,address,problem,new Date());
			
			Session s = FactoryProvider.getFactory().openSession();
			Transaction t = s.beginTransaction();
			s.save(h);
			t.commit();
			s.close();
			 response.setContentType("text/html");
             PrintWriter out = response.getWriter();
			out.println("<h1 style='text-align:center;'>Note is added successfully</h1>");
			out.println("<h1 style='text-align:center;'><a href='all_patients.jsp'>List of all patients</h1>");

			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
