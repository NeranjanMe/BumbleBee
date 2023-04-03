package net.controller.brand;

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
import net.entity.Brand;
import net.entity.Order;
import net.model.BrandDaoImpl;

@WebServlet("/saveBrand")
public class SaveBrandServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BrandDao brandDao;

	public void init() {
		brandDao = new BrandDaoImpl();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		save(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		generateId(request,response);
	}

	private void save(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
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
	    Brand brand = new Gson().fromJson(sb.toString(), Brand.class);
	    System.out.println("Brand Obj : "+brand);
	    if(!brand.getBrandId().isEmpty() && !brand.getBrandName().isEmpty()) {
	    	if(brandDao.saveBrand(brand)) {
		    	String resp = new Gson().toJson(new net.entity.CommonResponse(true));
		    	// Write content type and also length (determined via byte array).
		    	RequestDispatcher dispatcher = request.getRequestDispatcher("item/manageBrand.jsp");
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
		    	RequestDispatcher dispatcher = request.getRequestDispatcher("item/manageBrand.jsp");
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
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("item/manageBrand.jsp");
	    	response.setContentType("application/json");
	    	response.setHeader("Body", resp);
	    	PrintWriter out = response.getWriter();
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        out.print(resp);
	        out.flush();
	    }
		
	}
	
	public void generateId(HttpServletRequest request,HttpServletResponse response) {
		String id = brandDao.generateBrandId();
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
