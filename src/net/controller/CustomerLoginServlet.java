package net.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.dao.CustomerDao;
import net.model.CustomerDAOImpl;



@WebServlet("/customerLogin")
public class CustomerLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CustomerDao dao;

	public void init() {
		dao = new CustomerDAOImpl();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("login/customerLogin.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		authenticate(request, response);
	}

	private void authenticate(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String username = request.getParameter("userNameLoginId");
		String password = request.getParameter("passwordLoginId");
		System.out.println(username);
		System.out.println(password);
		
		if(dao.checkCustomerByUserNameAndPassword(username, password)) {
			request.setAttribute("loggedUser", username);
			RequestDispatcher dispatcher = request.getRequestDispatcher("order/order.jsp");
			dispatcher.forward(request, response);
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("login/customerLogin.jsp");
			dispatcher.forward(request, response);
		}
	}
}
