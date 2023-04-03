package net.controller.item;

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

import net.dao.BrandDao;
import net.dao.CategoryDao;
import net.dao.ItemDao;
import net.entity.Item;
import net.entity.Order;
import net.model.BrandDaoImpl;
import net.model.CategoryDaoImpl;
import net.model.ItemDaoImpl;

@WebServlet("/updateItem")
public class UpdateItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ItemDao itemDao;
	private CategoryDao categoryDao;
	private BrandDao brandDao;
	public void init() {
		itemDao = new ItemDaoImpl();
		categoryDao = new CategoryDaoImpl();
		brandDao = new BrandDaoImpl();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			update(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
	    Item obj = new Gson().fromJson(sb.toString(), Item.class);
	    Item item = itemDao.searchItem(obj.getId());
	    if(true) {
	    	String resp = new Gson().toJson(item);
	    	// Write content type and also length (determined via byte array).
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("item/manageItem.jsp");
	    	response.setContentType("application/json");
	    	response.setHeader("Body", resp);
	    	PrintWriter out = response.getWriter();
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        out.print(resp);
	        out.flush();
	    }
	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, ClassNotFoundException {
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
	    Item item = new Gson().fromJson(sb.toString(), Item.class);
	    System.out.println("item Obj : "+item);
	    if(!item.getId().isEmpty() && !item.getName().isEmpty() && item.getQty()!=0 && item.getUnitPrice()!=0.0 && (item.getStatus()==0|item.getStatus()==1) && !item.getCategory().isEmpty() && !item.getBrand().isEmpty()) {
	    	if(itemDao.updateItem(item)) {
		    	String resp = new Gson().toJson(new net.entity.CommonResponse(true));
		    	// Write content type and also length (determined via byte array).
		    	RequestDispatcher dispatcher = request.getRequestDispatcher("item/manageItem.jsp");
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
		    	RequestDispatcher dispatcher = request.getRequestDispatcher("item/manageItem.jsp");
		    	response.setContentType("application/json");
		    	response.setHeader("Body", resp);
		    	PrintWriter out = response.getWriter();
		        response.setContentType("application/json");
		        response.setCharacterEncoding("UTF-8");
		        out.print(resp);
		        out.flush();
		    }
	    }else {
	    	String resp = new Gson().toJson(new net.entity.CommonResponse(false));
	    	// Write content type and also length (determined via byte array).
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("item/manageItem.jsp");
	    	response.setContentType("application/json");
	    	response.setHeader("Body", resp);
	    	PrintWriter out = response.getWriter();
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        out.print(resp);
	        out.flush();
	    }
	}
}
