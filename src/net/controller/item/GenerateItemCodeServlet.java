package net.controller.item;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import net.dao.ItemDao;
import net.entity.Item;
import net.model.ItemDaoImpl;

@WebServlet("/generateItemCode")
public class GenerateItemCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ItemDao itemDao;

	public void init() {
		itemDao = new ItemDaoImpl();
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		generateId(request,response);
	}

	
	public void generateId(HttpServletRequest request,HttpServletResponse response) {
		String id = itemDao.generateItemCode();
		response.setContentType("text/html");
    	response.setHeader("Body", id);
    	PrintWriter out;
		try {
			out = response.getWriter();
			 response.setContentType("text/html");
		        response.setCharacterEncoding("UTF-8");
		        out.print(id);
		        out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       
	}
}
