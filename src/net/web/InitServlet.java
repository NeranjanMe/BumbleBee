package net.web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/")
public class InitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void init() {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {System.out.println("Initial Login");
		String action = request.getServletPath();
		RequestDispatcher dispatcher = request.getRequestDispatcher("login/customerLogin.jsp");
		dispatcher.forward(request, response);
	}
}
