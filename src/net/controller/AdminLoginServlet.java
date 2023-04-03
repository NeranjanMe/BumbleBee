package net.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.model.AdminDAOImpl;



@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminDAOImpl dao;
	
	public void init() {
		dao = new AdminDAOImpl();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("login/adminlogin.jsp");
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
		
		if(dao.checkAdminByUserNameAndPassword(username, password)){
			request.setAttribute("loggedUser", username);
			RequestDispatcher dispatcher = request.getRequestDispatcher("admin/adminDashboard.jsp");
			dispatcher.forward(request, response);
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("login/adminLogin.jsp");
			dispatcher.forward(request, response);
		}
	}
}
