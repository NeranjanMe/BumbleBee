<%@page import="net.dao.CustomerDao"%>
<%@page import="net.model.CustomerDAOImpl"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<% String message = (String)request.getAttribute("NOTIFICATION");%>
<title>Customer Register - Bumble Bee</title>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
	
	<style>
		body>main>.Signup {
		    position: relative;
		    height: 100vh !important;
		}
		body>main>.Signup>.container-fluid:nth-child(1) {
			top:2%;
			height:10%;
			left:0;
			right:0;
			margin:auto;
		}
		body>main>.Signup>.container-fluid:nth-child(2) {
			left:0;
			right:0;
			top:0;
			bottom:0;
			margin:auto;
		    height: 70% !important;
		    width: 70% !important;
		}
		
		body>main>.Signup>.container-fluid>.row>.row {
		    position: relative;
		    margin-top: 30px !important;
		}
		
		body>main>.Signup a:nth-child(2) {
		    position: absolute !important;
		    right: 10%;
		    top: 30px;
		    width: 3.2% !important;
		    height: 40px;
		    overflow: hidden;
		    transition: all 1s;
		}
		
		body>main>.Signup a:nth-child(3) {
		    position: absolute !important;
		    right: 5%;
		    top: 30px;
		    width: 38px;
		    height: 40px;
		    overflow: hidden;
		    transition: all 1s;
		}
		
		body>main>.Signup>a:hover {
		    transition: all 1s;
		    width: 8% !important;
		}
		
		body>main>.Signup>a:nth-child(3):hover h3 {
		    transition: all 1s;
		    right: 15% !important;
		}
		
		body>main>.Signup>a:nth-child(2):hover {
		    transition: all 1s;
		    width: 12.5% !important;
		}
		
		body>main>.Signup>a:nth-child(2):hover h3 {
		    transition: all 1s;
		    right: 2% !important;
		}
		
		body>main>.Signup>a:hover h3 {
		    transition: all 1s;
		    right: 5% !important;
		}
		
		body>main>.Signup>a div {
		    position: relative !important;
		    width: 100% !important;
		    height: 100% !important;
		}
		
		body>main>.Signup>a div h3 {
		    position: absolute !important;
		    top: 0 !important;
		    bottom: 7px !important;
		    margin: auto !important;
		    height: max-content;
		    position: absolute !important;
		    right: -135% !important;
		    color: black !important;
		    transition: all 1s !important;
		}
		
		body>main>.Signup>a:nth-child(2) div h3 {
		    right: -251% !important;
		}
		
		body>main>.Signup>a i {
		    color: black !important;
		    font-size: 35px !important;
		}
		
		body>main>.Signup label {
		    position: absolute;
		    top: 5px !important;
		}
		
	</style>
</head>

</head>
<body>
 <main>
	<section id="signupSection" class="Signup container-fluid position-relative" style="height: 100vh; width: 100%; background-color: rgb(231, 231, 231) !important; display: block;">
		<div class="container-fluid position-absolute ">
			
		</div>
        <div class="container-fluid position-absolute shadow">
            <div class="container">
	            	<div class="row position-absolute"
	                     style="top: 10%;left: 0;right: 0;margin: auto;width: 800px;height: 60%;position:relative'">
	                    <div class="row" style="left: 0;right: 0;margin: auto;height:30%">
	                        <div class="col-12 col-sm-12 col-md">
	                            <div class="form-floating position-relative shadow">
	                            	<label id="signUpIdLbl" for="signUpId" class="position-relative"><span style="width: 100%;">Id</span></label>
	                                        <%
	                                        CustomerDao dao = new CustomerDAOImpl();
	                                		String customerId = dao.generateCustomerId();
	                                		System.out.println("Customer ID = "+customerId);
	                                		%>
	                            	<input type="text" class="form-control bg-transparent" id="signUpId" name="signUpId" placeholder="Id" style="height: 50px;" disabled="true" value=<%=customerId %>>
	                            </div>
	                        </div>
	
	                        <div class="col-12 col-sm-12 col-md">
	                            <div class="form-floating position-relative shadow">
	                            	<label id="signUpNameLbl" for="signUpName" class="position-relative"><span style="width: 100%;">Name</span></label>
	                                <input type="text" class="form-control bg-transparent" id="signUpName" name="signUpName" placeholder="Name" style="height: 50px;">
	                            </div>
	                        </div>
	
	                        <div class="col-12 col-sm-12 col-md">
	                            <div class="form-floating position-relative shadow">
	                            	<label id="signUpDOBLbl" for="signUpDob" class="position-relative"><span style="width: 100%;">Date of Birth</span></label>
	                                <input type="date" class="form-control bg-transparent" id="signUpDob" name="signUpDob" placeholder="Date of Birth" style="height: 50px;">
	                            </div>
	                        </div>
	                    </div>
	
	
	                    <div class="row" style="left: 0;right: 0;margin: auto;">
	                        <div class="col-12 col-sm-12 col-md">
	                            <div class="form-floating position-relative shadow">
	                            	<label id="signUpContactNoLbl" for="signUpContactNo" class="position-relative"><span style="width: 100%;">Contact No</span></label>
	                                <input type="tel" class="form-control bg-transparent" id="signUpContactNo" name="signUpContactNo" placeholder="Contact No" style="height: 50px;">
	                            </div>
	                        </div>
	
	                        <div class="col-12 col-sm-12 col-md">
	                            <div class="form-floating position-relative shadow">
	                            	<label id="signUpUserNameLbl" for="signUpUserName" class="position-relative"><span style="width: 100%;">User Name</span></label>
	                                <input type="text" class="form-control bg-transparent" id="signUpUserName" name="signUpUserName" placeholder="User Name" style="height: 50px;">
	                            </div>
	                        </div>
	
	                        <div class="col-12 col-sm-12 col-md">
	                            <div class="form-floating position-relative shadow">
	                            	<label id="signUpPasswordLbl" for="signUpPassword" class="position-relative"><span style="width: 100%;">Password</span></label>
	                                <input type="password" class="form-control bg-transparent" id="signUpPassword" name="signUpPassword" placeholder="Password" style="height: 50px;">
	                            </div>
	                        </div>
	                    </div>
	
	                   <div class="row" style="left: 0;right: 0;margin: auto;">
	                        <div class="col">
	                            <div class="form-floating position-relative shadow">
	                            	<label id="signUpAddressLbl" for="signUpAddress" class="position-relative"><span style="width: 100%;">Address</span></label>
	                                <input type="text" class="form-control bg-transparent" id="signUpAddress" name="signUpAddress" placeholder="Address" style="height: 50px;">
	                            </div>
	                        </div>
	                    </div>
	                </div>
	
	                <div class="row position-absolute" style="top: 75%;left: 0;right: 0;margin: auto;width: 800px;height: max-content;">
	                    <div class="col-6 col-sm-6 col-md">
	                        <button id="addSignupDetailsBtn" class="btn btn-outline-success" style="width: 100%;" >Register</button>
	                    </div>
	                </div>
	                
	                <div class="row" style="position:absolute;top: 86%;right: 0;margin: auto;width: max-width;height: 40px;">
	                <div class="col-12">
				      <a href="<%=request.getContextPath()%>/login/customerLogin.jsp" id="logoutBtnInSignup"> Click here to Customer Login</a>
	                </div>
	            </div>
                
            </div>
        </div>
    </section>
   </main>
</body>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script>

	var cusNamePattern = /^[A-z ]+$/;
	var cusContactPattern = /^[0-9]{10}$/;
	var cusUserNamePattern = /^([A-z]{3,}[.]*[A-z]*[0-9]*[@]?((gmail.com)|(yahoo.com)?))$/;
	var cusPasswordPattern = /^([A-z0-9]{3,}[.]*[A-z0-9]*[@]?)$/;
	var cusAddressPattern = /^[A-z0-9.,/ ]*$/

	var cusId = $('#signUpId');
	var cusName = $('#signUpName');
	var cusDob = $('#signUpDob');
	var cusContactNo = $('#signUpContactNo');
	var cusUserName = $('#signUpUserName');
	var cusPassword = $('#signUpPassword');
	var cusAddress = $('#signUpAddress');	

	var cusNameLbl = $('#signUpNameLbl span');
	var cusContactNoLbl = $('#signUpContactNoLbl span');
	var cusUserNameLbl = $('#signUpUserNameLbl span');
	var cusPasswordLbl = $('#signUpPasswordLbl span');
	var cusAddressLbl = $('#signUpAddressLbl span');	

	var saveBtn = $("#addSignupDetailsBtn");
	
	var cusInputsArr = [cusName, cusContactNo, cusUserName, cusPassword,cusAddress];

	
	cusName.off('keyup');
	cusName.keyup(function (e) {
	    let index = 0;
	    if (validate(cusNamePattern, cusInputsArr, index, e, saveBtn) == true) {
	        cusNameLbl.css('font-size', 'unset');
	        cusNameLbl.text("Name");
	    } else {
	        cusNameLbl.css('font-size', '12px');
	        cusNameLbl.text("Please use (Kamal Bandara)");
	    }
	})
	cusContactNo.off('keyup');
	cusContactNo.keyup(function (e) {
	    let index = 1;
	    if (validate(cusContactPattern, cusInputsArr, index, e, saveBtn) == true) {
	    	cusContactNoLbl.text("Contact No");
	    } else {
	    	cusContactNoLbl.text("Please use only 10 digits");
	    }
	})
	
	cusUserName.off('keyup');
	cusUserName.keyup(function (e) {
	    let index =2;
	    if (validate(cusUserNamePattern, cusInputsArr, index, e, saveBtn) == true) {
	    	cusUserNameLbl.text("User Name");
	    } else {
	    	cusUserNameLbl.text("Please use valid Username");
	    }
	})
	
	cusPassword.off('keyup');
	cusPassword.keyup(function (e) {
	    let index = 3;
	    if (validate(cusPasswordPattern, cusInputsArr, index, e, saveBtn) == true) {
	    	cusPasswordLbl.text("User Name");
	    } else {
	    	cusPasswordLbl.text("Please use valid Password");
	    }
	})
	cusAddress.off('keyup');
	cusAddress.keyup(function (e) {
	    let index = 4;
	    if (validate(cusAddressPattern, cusInputsArr, index, e, saveBtn) == true) {
	    	cusAddressLbl.text("Address");
	    } else {
	    	cusAddressLbl.text("Please use only these special characters (.,/)");
	    }
	})
	function validate(pattern, array, index, e, saveBtn) {
	    if (pattern.test(array[index].val())) {
	        array[index].css("border", "3px solid green");
	        if (e.key === 'Enter') {
	            array[index + 1].focus();
	        }
	        saveBtn.prop("disabled", false);
	        return true;
	    } else {
	        array[index].css("border", "3px solid red");
	        saveBtn.prop("disabled", true);
	        return false;
	    }
	    return false;
	}

	saveBtn.off('click');
	saveBtn.click(async function () {
		await saveCustomer();
	})
	async function saveCustomer(){
				
				let customer = {
						signUpId:cusId.val(),
						signUpName:cusName.val(),
						signUpDob:cusDob.val(),
						signUpContactNo:cusContactNo.val(),
						signUpUserName:cusUserName.val(),
						signUpPassword:cusPassword.val(),
						signUpAddress:cusAddress.val()
				}
				console.log(customer)
				let options = {
	            method: 'POST',
	            headers: {
	                'Content-Type': 
	                    'application/json',
	                    'Accept': 'application/json'
	            },
	            body: JSON.stringify(customer)
		        }
		        // Fake api for making post requests
		        let resJson;
				let res = await fetch("<%=request.getContextPath()%>/registerCustomer", 
                        options).then(async response =>{
				    	resJson = await response.json()
				        return await response;

				    })
					console.log(resJson);
				    if(resJson.success==true){
					    alert("Customer Saved Successfully");
					    window.location.href = "<%=request.getContextPath()%>/login/customerLogin.jsp";
					    }else{
					    	alert("Please try again. Data must not be empty.");
					    }
				    
			}
	</script>
</html>