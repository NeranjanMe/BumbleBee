package net.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import net.dao.CustomerDao;
import net.entity.CommonResponse;
import net.entity.Customer;
import net.model.CustomerDAOImpl;

@WebServlet("/registerCustomer")
public class RegisterCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CustomerDao customerDao;

	public void init() {
		customerDao = new CustomerDAOImpl();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		register(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		getAllCustomers(request);
		RequestDispatcher dispatcher = request.getRequestDispatcher("customer/customerDetails.jsp");
		dispatcher.forward(request, response);
	}

	private void register(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		StringBuilder sb = new StringBuilder();
	    BufferedReader reader = request.getReader();
	    try {
	        String line;
	        while ((line = reader.readLine()) != null) {
	            sb.append(line).append('\n');
	        }
	    } finally {
	        reader.close();
	    }
	    Customer c = new Gson().fromJson(sb.toString(), Customer.class);
	    
	    System.out.println("Customer Obj = "+c);
	    if(!c.getSignUpId().isEmpty() && !c.getSignUpName().isEmpty() && !c.getSignUpDob().isEmpty() && !c.getSignUpContactNo().isEmpty() && !c.getSignUpUserName().isEmpty() && !c.getSignUpPassword().isEmpty() && !c.getSignUpAddress().isEmpty()) {
	    	
		    try {
				if(customerDao.saveCustomer(c) == true) {
					String resp = new Gson().toJson(new CommonResponse(true));
			    	// Write content type and also length (determined via byte array).
			    	RequestDispatcher dispatcher = request.getRequestDispatcher("login/customerLogin.jsp");
			    	response.setContentType("application/json");
			    	response.setHeader("Body", resp);
			    	PrintWriter out = response.getWriter();
			        response.setContentType("application/json");
			        response.setCharacterEncoding("UTF-8");
			        out.print(resp);
			        out.flush();
				}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }else {
	    	String resp = new Gson().toJson(new CommonResponse(false));
	    	// Write content type and also length (determined via byte array).
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("login/customerLogin.jsp");
	    	response.setContentType("application/json");
	    	response.setHeader("Body", resp);
	    	PrintWriter out = response.getWriter();
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        out.print(resp);
	        out.flush();
	    }
	    
	}
	public void getAllCustomers(HttpServletRequest request) {
		List<Customer>customers = customerDao.getAllCustomers();
		request.setAttribute("customerDetails", customers);
	}
	
}
