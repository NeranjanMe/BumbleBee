<%@page import="net.model.OrderDaoImpl"%>
<%@page import="net.dao.OrderDao"%>
<%@page import="net.entity.Order"%>
<%@page import="net.entity.Item"%>
<%@page language="java" import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Order Details - Bumble Bee</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
			
			<style>
				body {
				    overflow: hidden !important;
				}
							
				body>main>section {
				    width: 100%;
				    height: 92.5vh;
				    background-color: rgb(233, 233, 233) !important;
				}
		</style>
	</head>
	<body>
		<jsp:include page="../common/adminHeader.jsp"></jsp:include>
		<section class="ManageItems container-fluid position-relative d-flex align-items-center justify-content-center" style="width: 100%;height: 95vh;top:0;" id="manageItemsSection">
	        <div class="row position-relative d-flex" style="width: 100%;height:90%;">
	            
	            <div class="row position-relative border-5 shadow" style="left: 0;right: 0;margin: auto;height: 100%;width: 93%;">
	                <div class="col position-relative h-100 w-100 d-flex align-items-center justify-content-center" style="height: 100%;overflow:auto;width:100%;">
	                    <table class="table table-striped table-responsive table-hover shadow position-absolute start-0 end-0 m-auto w-100 h-100">
	                        <thead>
	                        <tr>
	                            <th scope="col">#</th>
	                            <th scope="col">Order Id</th>
	                            <th scope="col">Order Date</th>
	                            <th scope="col">Customer Id</th>
	                            <th scope="col">Loan Amount</th>
	                            <th scope="col">Paid Amount</th>
	                        </tr>
	                        </thead>
	                        <tbody>
	                        	<%Iterator itr;%>
								<%
								OrderDao orders =new OrderDaoImpl();
								List<Order> data= orders.getOrders();
								System.out.println(data);
								if(data!=null) {
									int count = 1;
									for (Order o : data){%>
									<tr>
									<td width="20%"><%=count++%></td>
									<td width="20%"><%=o.getOrderId()%></td>
									<td width="20%"><%=o.getOrderDate()%></td>
									<td width="20%"><%=o.getCustomerId()%></td>
									<td width="20%"><%=o.getLoanAmount()%></td>
									<td width="20%"><%=o.getPaidAmount()%></td>
									</tr>
								<%}}%>
	                        </tbody>
	                    </table>
	                </div>
	            </div>
	        </div>
	    </section>
	</body>
</html>
