package net.controller.item;

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

@WebServlet("/itemDetails")
public class ItemDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ItemDao itemDao;

	public void init() {
		itemDao = new ItemDaoImpl();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		getAllItems(request,response);
		/*RequestDispatcher dispatcher = request.getRequestDispatcher("item/itemDetails.jsp");
		dispatcher.forward(request, response);*/
	}

	public void getAllItems(HttpServletRequest request,HttpServletResponse response) {
		List<Item>items = itemDao.getAllItems();
		response.setContentType("text/html");
		try {
			String resp = new Gson().toJson(items);
	    	// Write content type and also length (determined via byte array).
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("item/manageItem.jsp");
	    	response.setContentType("application/json");
	    	response.setHeader("Body", resp);
	    	PrintWriter out = response.getWriter();
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        out.print(resp);
	        out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		request.setAttribute("itemDetails", items);
	}
}
