package net.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import net.entity.Item;
import net.entity.Order;
import net.model.OrderDaoImpl;

@WebServlet("/placeOrder")
public class PlaceOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private net.dao.OrderDao orderDao;

	public void init() {
		orderDao = new OrderDaoImpl();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		placeOrder(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		generateOrderId(request,response);
		
	}

	private void placeOrder(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
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
	    Order orderObj = new Gson().fromJson(sb.toString(), Order.class);
	    orderObj.setOrderDate(new Date());
	    System.out.println(orderObj);
	    if(orderDao.placeOrder(orderObj)) {
	    	String resp = new Gson().toJson(new net.entity.CommonResponse(true));
	    	// Write content type and also length (determined via byte array).
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("order/order.jsp");
	    	response.setContentType("application/json");
	    	response.setHeader("Body", resp);
	    	PrintWriter out = response.getWriter();
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        out.print(resp);
	        out.flush();
	    }else {
	    	String resp = new Gson().toJson(new net.entity.CommonResponse(false));
	    	// Write content type and also length (determined via byte array).
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("order/order.jsp");
	    	response.setContentType("application/json");
	    	response.setHeader("Body", resp);
	    	PrintWriter out = response.getWriter();
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        out.print(resp);
	        out.flush();
	    }
	}
	public void generateOrderId(HttpServletRequest request,HttpServletResponse response) {
		String orderId = orderDao.generateOrderId();
		response.setContentType("text/html");
    	response.setHeader("Body", orderId);
    	PrintWriter out;
		try {
			out = response.getWriter();
			 response.setContentType("text/html");
		        response.setCharacterEncoding("UTF-8");
		        out.print(orderId);
		        out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       
	}
}
