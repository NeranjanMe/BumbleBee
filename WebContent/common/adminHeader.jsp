<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<style>
			body>header .offcanvas-body ul li {
			    position: absolute;
			    left: 0;
			    right: 0;
			    margin: auto;
			    font-size: 18px;
			    font-weight: 400;
			    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
			}
			
			body>header>nav {
			    background-color: #575454 !important;
			    box-shadow: 0px 1px 10px 1px;
			}
			
			
			/* --- */
			body>header>nav ul>form>li {
			    width: 102px;
			    transition: all 0.5s;
			    text-align: center;
			}
			
			body>header>nav ul>form>li a {
			    position: relative;
			    width: 100%;
			    height: 35px;
			    border-radius: 30px;
			    transition: all 0.5s;
			}
			
			body>header>nav ul>form>li a span {
			    position: absolute;
			    top: 0;
			    bottom: 0;
			    left: 0;
			    right: 0;
			    margin: auto;
			    height: max-content;
			    width: max-content;
			}
			
			body>header>nav ul>form>li:hover a {
			    background-color: rgb(143, 141, 141);
			    border-radius: 30px;
			    transition: all 0.5s;
			}
			
			/* -- */
			
			body>header>nav ul>li {
			    width: 102px;
			    transition: all 0.5s;
			    text-align: center;
			}
			
			body>header>nav ul>li a {
			    position: relative;
			    width: 100%;
			    height: 35px;
			    border-radius: 30px;
			    transition: all 0.5s;
			}
			
			body>header>nav ul>li a span {
			    position: absolute;
			    top: 0;
			    bottom: 0;
			    left: 0;
			    right: 0;
			    margin: auto;
			    height: max-content;
			    width: max-content;
			}
			
			body>header>nav ul>li:hover a {
			    background-color: rgb(143, 141, 141);
			    border-radius: 30px;
			    transition: all 0.5s;
			}
			
			body>header>nav>div>a:nth-child(5) {
			    position: absolute;
			    right: 70px;
			    width: 35px;
			    height: 35px;
			    top: 2px;
			    bottom: 0;
			    margin: auto;
			    overflow: hidden;
			    transition: all 1s;
			}
			
			body>header>nav>div>a:nth-child(5) div {
			    width: 100%;
			    height: 100%;
			}
			
			body>header>nav>div>a:nth-child(5) div:nth-child(1) i {
			    left: 0;
			    top: 0;
			    bottom: 0;
			    margin: auto;
			    height: max-content;
			}
			
			body>header>nav>div>a:nth-child(5) div:nth-child(1) h3 {
			    width: 70px;
			    left: 45px;
			    top: 0;
			    bottom: 0;
			    margin: auto;
			    height: max-content;
			}
			
			body>header>nav>div>a:nth-child(5):hover {
			    width: 110px;
			    right: 70px;
			    transition: all 1s;
			}
			
			body>header>nav>div>a:nth-child(6) {
			    position: absolute;
			    right: 10px;
			    width: 30px;
			    height: 35px;
			    top: 2px;
			    bottom: 0;
			    margin: auto;
			    overflow: hidden;
			    transition: all 1s;
			    cursor: pointer;
			}
			
			body>header>nav>div>a:nth-child(6) div {
			    width: 100%;
			    height: 100%;
			}
			
			body>header>nav>div>a:nth-child(6) div:nth-child(1) i {
			    left: 0;
			    top: 0;
			    bottom: 0;
			    margin: auto;
			    height: max-content;
			}
			
			body>header>nav>div>a:nth-child(6) div:nth-child(1) h3 {
			    left: 40px;
			    top: 0;
			    bottom: 0;
			    margin: auto;
			    height: max-content;
			}
			
			body>header>nav>div>a:nth-child(6):hover {
			    width: 100px;
			    right: 20px;
			    transition: all 1s;
			}
		</style>
	</head>
	
<body style="position:relative">
	<header id="headerNav" style="position:relative;">
	    <nav class="navbar navbar-expand-lg">
	        <div class="container-fluid">
	            <h3 class="navbar-brand text-white fs-4" href="#" style="margin-left: 20px;height: 30px;">Bumble Bee</h3>
	            <hr class="position-absolute opacity-100"
	                style="transform: rotate(90deg);width: 35px;height: 4px;left: 180px;background-color: white;">
	            <div class="collapse navbar-collapse position-relative" id="navbarText">
	                <ul class="position-absolute navbar-nav flex-row w-100 justify-content-start fs-6 px-4"
	                    style="left:200px;">
	                    <li class="nav-item position-relative" style="width:5%"><a class="nav-link text-white" href="<%=request.getContextPath()%>/admin/adminDashboard.jsp" id="Home"><span
	                            style="position: absolute;top: 0;bottom: 0;left: 0;right: 0;width: max-content;height: max-content;">Home</span></a>
	                    </li>
	                    <li class="nav-item position-relative" style="width:10%"><a class="nav-link text-white" href="<%=request.getContextPath()%>/admin/orderDetails.jsp" id="Orders"><span
	                            style="position: absolute;top: 0;bottom: 0;left: 0;right: 0;width: max-content;height: max-content;">View Orders</span></a>
	                    </li>
	                    <li class="nav-item position-relative" style="width:10%"><a class="nav-link text-white" id="Items" href="<%=request.getContextPath()%>/item/manageItem.jsp"><span
		                        style="position: absolute;top: 0;bottom: 0;left: 0;right: 0;width: max-content;height: max-content;">Manage Items</span></a>
	                   
	                    </li>
	                    <li class="nav-item position-relative" style="width:13%"><a class="nav-link text-white" href="<%=request.getContextPath()%>/registerCustomer" id="Customer"><span
	                            style="position: absolute;top: 0;bottom: 0;left: 0;right: 0;width: max-content;height: max-content;">Customers</span></a>
	                    </li>
	                    <li class="nav-item position-relative" style="width:13%"><a class="nav-link text-white" href="<%=request.getContextPath()%>/item/manageCategory.jsp" id="Customer"><span
	                            style="position: absolute;top: 0;bottom: 0;left: 0;right: 0;width: max-content;height: max-content;">Manage Category</span></a>
	                    </li>
	                    <li class="nav-item position-relative" style="width:13%"><a class="nav-link text-white" href="<%=request.getContextPath()%>/item/manageBrand.jsp" id="Customer"><span
	                            style="position: absolute;top: 0;bottom: 0;left: 0;right: 0;width: max-content;height: max-content;">Manage Brands</span></a>
	                    </li>
	                </ul>
	            </div>
				<div class="position relative d-flex align-items-center justify-content-center" style="width:10%;height:30px;">
					<%-- <a href="<%=request.getContextPath()%>/customer/register.jsp" id="signupBtn" class="d-lg-block position-relative w-50 h-100">
	               		 <div class="logout position-absolute text-center w-100 h-100 d-flex align-items-center justify-content-center"">
		                    <i class="fas fa-user-plus text-white fs-3 position-absolute"></i>
		                </div>
		            </a> --%>
		
		            <a href="<%=request.getContextPath()%>/login/adminLogin.jsp" id="logoutBtn" class="d-lg-block position-relative w-50 h-100 d-flex align-items-center justify-content-center"">
		                <div class="logout position-absolute text-center w-100 h-100 d-flex align-items-center justify-content-center"">
		                    <i class="fas fa-sign-out-alt text-white fs-3 position-absolute"></i>
		                </div>
		            </a>
				</div>
	            
	        </div>
	    </nav>
	</header>
</body>
</html>
