<%@page import="net.entity.Customer"%>
<%@page language="java" import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Customers Details - Bumble Bee</title>
		<link rel="stylesheet"
			href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
			integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
			crossorigin="anonymous">
			
			<link rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
			
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
		<section id="customerDetailsSection" class="CustomerDetails container-fluid position-relative"
		style="width: 100%;height: 95vh;top:0;"
		>
	        <div class="container-fluid position-absolute shadow" style="height:100%">
	            <div class="row position-absolute" style="top: 5%; left: 0;right: 0;margin: auto;height: 90%;width: 90%;">
	                <div class="col shadow position-relative" style="height: 100%;overflow: auto">
	                    <table id="orderDetailsTable" class="table table-hover">
	                        <thead>
	                        <tr>
	                            <th scope="col">#</th>
	                            <th scope="col">Customer Id</th>
	                            <th scope="col">Customer Name</th>
	                            <th scope="col">Customer Address</th>
	                            <th scope="col">Customer Contact No</th>
	                            <th scope="col">Customer DOB</th>
	                            <th scope="col">Customer User Name</th>
	                        </tr>
	                        </thead>
	                        <tbody>
	                        	<%Iterator itr;%>
								<% List<Customer> data= (List)request.getAttribute("customerDetails");
								System.out.println(data);
								if(data!=null) {
									int count = 1;
									for (Customer i : data){%>
									<tr>
									<td width="12.5%"><%=count++%></td>
									<td width="12.5%"><%=i.getSignUpId()%></td>
									<td width="12.5%"><%=i.getSignUpName()%></td>
									<td width="12.5%"><%=i.getSignUpDob()%></td>
									<td width="12.5%"><%=i.getSignUpContactNo()%></td>
									<td width="12.5%"><%=i.getSignUpUserName()%></td>
									<td width="12.5%"><%=i.getSignUpAddress()%></td>
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
