<%@page import="net.entity.Item"%>
<%@page import="net.model.ItemDaoImpl"%>
<%@page import="net.dao.ItemDao"%>
<%@page import="net.entity.Customer"%>
<%@page import="net.model.CustomerDAOImpl"%>
<%@page import="net.dao.CustomerDao"%>
<%@page import="net.dao.OrderDao"%>
<%@page import="net.model.OrderDaoImpl"%>
<%@page import="net.dao.*"%>
<%@page language="java" import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Place Order - Bumble Bee</title>
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
		<jsp:include page="../common/customerHeader.jsp"></jsp:include>
		<section id="homeSection" class="Home container-fluid position-relative" style="width: 100%;height: 95vh;top:0;">
	        <div class="container-fluid position-absolute shadow" style="left:0;right:0;top:0;bottom:0;margin:auto;height:90%">
	            <div class="row h-50 position-relative start-0 end-0 m-auto" style="width: 95%;top: 20px;">
	                <form class="col-md-3 bg-light shadow col-12 h-100">
	                    <div class="row position-relative" style="height:10%; background-color: rgb(133, 135, 138);">
	                        <h3 class="fs-5 text-white top-0 bottom-0 m-auto" style="text-align: center;">Customer
	                            Details</h3>
	                    </div>
	                    <% CustomerDao customerDao=new CustomerDAOImpl();
		                   Customer c = customerDao.searchCustomer(String.valueOf(request.getAttribute("loggedUser")));
		                   System.out.println(c);%>
	
	                    <div class="form-floating position-relative" style="height:20%;top:2%">
	                        <input type="text" class="form-control bg-transparent" id="customerIdHome" name="customerIdHome" placeholder="Id"
	                               style="height: 40px;" value=<%=c!=null?c.getSignUpId():""%>>
	                        <label for="customerIdHome" style="width: 100%;"><span id="customerIdHomeLbl">Id</span></label>
	                    </div>
	                    <div class="form-floating position-relative" style="height:20%;top:2%">
	                        <input type="text" class="form-control bg-transparent" id="customerNameHome" name="customerNameHome" placeholder="Name"
	                               style="height: 40px;" value=<%=c!=null?c.getSignUpName():""%>>
	                        <label for="customerNameHome"><span>Name</span></label>
	                    </div>
	                    <div class="form-floating position-relative" style="height:20%;top:2%">
	                        <input type="text" class="form-control bg-transparent" id="customerAddressHome"
	                               placeholder="Address" style="height: 40px;" name="customerAddressHome" value=<%=c!=null?c.getSignUpAddress():""%>>
	                        <label for="customerAddressHome"><span>Address</span></label>
	                    </div>
	                    <div class="form-floating position-relative" style="height:20%;top:2%">
	                        <input type="tel" class="form-control bg-transparent" id="customerTelHome" placeholder="Tel"
	                               style="height: 40px; name="customerTelHome" value=<%=c!=null?c.getSignUpContactNo():""%>>
	                        <label for="customerTelHome"><span>Tel</span></label>
	                    </div>
	                </form>
	                <div class="col-sm-12 bg-light mx-4 shadow col-12 col-md-5 h-100">
	                    <div class="row position-relative" style="height: 10%; background-color: rgb(133, 135, 138);">
	                        <h3 class="fs-5 text-white top-0 bottom-0 m-auto" style="text-align: center;">Product Details</h3>
	                    </div>
	
	                    <div class="row" style="height: 86%;">
	                        <div class="col border">
	                        	<div class="form-floating position-relative" style="top: 5%;height:20%">
	                                <select class="form-select bg-transparent" id="itemProductHome" name="itemProductHome"
	                                        aria-label="Floating label select example" style="height: 40px; width: 100%;">
											<option value="Select Category">Select Product</option>
	                                        <%ItemDao itemDao = new ItemDaoImpl();
	                                        List<Item>itemList = itemDao.getAllItems();
	                                        for(Item i:itemList){
	                                        	System.out.println(i.getId());
	                                        %>
	                                        <option value=<%=i.getId()!=null?i.getId():""%>><%=i.getId()!=null?i.getId():""%></option>
	                                        <%} %>
	                                </select>
	                                <label for="itemCodeHome">Product</label>
	                            </div>
	                            <div class="form-floating position-relative" style="top: 8%;height:20%">
	                                <select class="form-select bg-transparent" id="itemCategoryHome" name="itemCategoryHome"
	                                        aria-label="Floating label select example" style="height: 40px; width: 100%;" disabled="true">
											
	                                </select>
	                                <label for="itemCategoryHome">Category</label>
	                            </div>
	                            <div class="form-floating position-relative" style="top: 12%;height:20%">
	                                <select class="form-select bg-transparent" id="itemBrandHome" name="itemBrandHome"
	                                        aria-label="Floating label select example" style="height: 40px; width: 100%;" disabled="true">
											
	                                </select>
	                                <label for="itemBrandHome">Brand</label>
	                            </div>
	                            <div class="form-floating position-relative" style="top: 15%;height:20%">
	                                <input type="text" class="form-control bg-transparent" id="itemDescriptionHome" name="itemDescriptionHome"
	                                       placeholder="Description" style="height: 40px;width: 100%" disabled="true">
	                                <label for="itemDescriptionHome"><span>Description</span></label>
	                            </div>
	                        </div>
	                        <div class="col border position-relative">
	                        	<div class="form-floating position-relative" style="top: 8%;height:20%">
	                                <input type="text" class="form-control bg-transparent" id="itemQtyHome" name="itemQtyHome"
	                                       placeholder="Quantity" style="height: 40px;width: 100%;" disabled="true">
	                                <label for="itemQtyHome"><span>Quantity</span></label>
	                            </div>
	                            <div class="form-floating position-relative" style="top:12%;height:20%">
	                                <input type="tel" class="form-control  bg-transparent" id="itemUnitPriceHome" name="itemUnitPriceHome"
	                                       placeholder="Unit Price" style="height: 40px;width: 100%;" disabled="true">
	                                <label for="itemUnitPriceHome"><span>Unit Price</span></label>
	                            </div>
	                            
	                             <div class="form-floating position-relative" style="top: 16%;height:20%">
	                                <input type="tel" class="form-control  bg-transparent" id="itemQtyOnHandHome" name="itemQtyOnHandHome"
	                                       placeholder="Quantity On Hand" style="height: 40px;width: 100%;">
	                                <label for="itemQtyOnHandHome" style="width: 100%;"><span
	                                        id="qtyOnHandLbl">Quantity On Hand</span></label>
	                            </div>
	
	                            <div class="container-fluid position-relative"
	                                 style="left: 0;right: 0;margin: auto;width: 100%;top: 20%;height:20%">
	                                <button class="btn btn-outline-success btn-md position-absolute start-0"
	                                        style="width: 45%;height:70%;" id="addToCartBtn" onclick="addToCart()">Add To Cart
	                                </button>
	                                <button id="clearCartBtn"
	                                        class="btn btn-outline-danger btn-md position-absolute"
	                                        style="width: 45%;height:70%;right:0">Clear Cart
	                                </button>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	
	                <div class="col-sm-12 col-md bg-light shadow position-relative col-12 h-100">
	                    <div class="form position-relative" style="top:3%;height:10%">
	                        <input type="text" class="form-control bg-transparent" id="orderIdHome" placeholder="Order Id">
	                    </div>
	
	
	                    <div class="row position-relative" style="top: 7%;height:10%">
	
	                        <div class="col">
	                            <div class="form-floating position-relative">
	                                <input type="tel" class="form-control  bg-transparent" id="orderCashReceived"
	                                       placeholder="Cash" style="height: 40px;">
	                            </div>
	                        </div>
	                    </div>
	                    <div class="row position-relative" style="top: 11%;height:10%">
	                        <div class="col">
	                            <div class="form-floating position-relative">
		                             <input type="tel" class="form-control  bg-transparent" id="orderLoanAmount"
		                                       placeholder="Loan Amount" style="height: 40px;" disabled="false">
	                            </div>
	                        </div>
	                    </div>
	                    
	                    <div class="row position-relative" style="top: 15%;height:10%">
	                        <div class="col-8 position-relative">
	                            <h6 class="position-relative" style="top: 5%;">5% Interest - </h6>
	                        </div>
	                        <div class="col">
	                            <div class="form position-relative">
	                                <input type="tel" class="form-control  bg-transparent" id="orderMonthlyInterest"
	                                       style="height: 34px;">
	                            </div>
	                        </div>
	                    </div>
	                    
	                    <div class="row position-relative" style="top: 19%;height:10%">
	                        <div class="col-8 position-relative">
	                            <h6 class="position-relative" style="top: 5%;">Monthly Installment - </h6>
	                        </div>
	                        <div class="col">
	                            <div class="form position-relative">
	                                <input type="tel" class="form-control  bg-transparent" id="orderMonthlyInstallment"
	                                       style="height: 34px;">
	                            </div>
	                        </div>
	                    </div>
	
	                    <div class="row position-relative" style="top: 23%;height:10%">
	                        <div class="col-6 position-relative">
	                            <h6 class="position-relative" style="top: 5%;">Sub Total - </h6>
	                        </div>
	                        <div class="col">
	                            <div class="form position-relative">
	                                <input type="tel" class="form-control  bg-transparent" id="orderSubTotal"
	                                       style="height: 34px;">
	                            </div>
	                        </div>
	                    </div>
	
	                    <div class="row position-relative" style="top: 27%;height:10%">
	                        <div class="col-6 position-relative">
	                            <h6 class="position-relative" style="top: 5%;">Total - </h6>
	                        </div>
	                        <div class="col">
	                            <div class="form position-relative">
	                                <input type="tel" class="form-control  bg-transparent" id="orderTotal"
	                                       style="height: 34px;">
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	
	
	            <div class="row position-relative start-0 end-0 m-auto" style="width: 95%;top: 40px; height: 30%;">
	                <div class="col bg-light position-relative" style="height: 100%;overflow: auto;">
	                    <table class="table table-hover" id="addToCartTable">
	                        <thead>
	                        <tr>
	                            <th scope="col">#</th>
	                            <th scope="col">Customer Id</th>
	                            <th scope="col">Product Code</th>
	                            <th scope="col">Product Description</th>
	                            <th scope="col">Quantity On Hand</th>
	                            <th scope="col">Product Unit Price</th>
	                            <th scope="col">Total</th>
	                        </tr>
	                        </thead>
	                        <tbody id="tbodyInAddToCartTbl">
	                        </tbody>
	                    </table>
	                </div>
	            </div>
	
	            <div class="row position-absolute w-25" style="bottom:3%;left:0;right:0;margin:auto">
	                <div class="col col-sm">
	                    <button id="purchaseBtn" onClick="placeOrder()" class="btn btn-outline-success w-100">Purchase</button>
	                </div>
	                <div class="col col-sm">
	                    <button id="discardBtn" onClick="discard()" class="btn btn-outline-danger w-100">Discard</button>
	                </div>
	            </div>
	        </div>
	
	    </section>
	</body>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script type="text/javascript" async defer onload="onload">
		var addToCartTbl = document.getElementById("addToCartTable");
		var checkBox =document.getElementById("isLoan");
		var orderCashRecieved=document.getElementById("orderCashReceived");
		var isLoan = false;
		
		var itemUnitPrice  = document.getElementById("itemUnitPriceHome");
		var itemQty;
		var orderSubTotal = document.getElementById("orderSubTotal");
		var orderTotal=0;
		var orderTotalInHome = document.getElementById("orderTotal");
		var loanAmountInHome = document.getElementById("orderLoanAmount");
		var orderMonthlyInstallment = document.getElementById("orderMonthlyInstallment");

		var addToCartArr=new Array();
		var qtyLeft;
		var addToCartObj;
		var orderIdHome = document.getElementById("orderIdHome");
		var dropdownList = document.getElementById('itemProductHome');
		var tbody = document.getElementById("tbodyInAddToCartTbl");
		var contextPath;
		    dropdownList.onchange = (ev) =>{
		      let selecetedIndex = dropdownList.selectedIndex;
		      let selectedOption = dropdownList.options[selecetedIndex];
		      console.log("Selected text is: " + selectedOption.text);

		      <%
		      	ItemDao itmDao=new ItemDaoImpl();
		      	List<Item>list = itmDao.getAllItems();
		      	
		      	
		      	for(Item i:list){
		      	%>
		      		var product_id = "<%=i.getId()%>";
		      		if(product_id==selectedOption.text){
			      		console.log("<%=i.getCategory()%>");
			      		var itemCat = document.getElementById("itemCategoryHome");
			      		const catOpt = document.createElement('option');
			      		catOpt.value = "<%=i.getCategory()%>";
			      		catOpt.innerHTML = "<%=i.getCategory()%>";
			      	  	itemCat.appendChild(catOpt);

			      		var itemBrand = document.getElementById("itemBrandHome");
			      		const brandOpt = document.createElement('option');
			      		brandOpt.value = "<%=i.getBrand()%>";
			      		brandOpt.innerHTML = "<%=i.getBrand()%>";
			      		itemBrand.appendChild(brandOpt);

			      		var itemDescription = document.getElementById("itemDescriptionHome");
			      		itemDescription.value="<%=i.getName()%>";

			      		itemQty = document.getElementById("itemQtyHome");
			      		itemQty.value="<%=i.getQty()%>";

			      		itemUnitPrice = document.getElementById("itemUnitPriceHome");
			      		itemUnitPrice.value="<%=i.getUnitPrice()%>";
			      	}
		      	
		      <%}%>
		    }
			function addToCart(){
				var itmQtyOnHand =document.getElementById("itemQtyOnHandHome").value;
				console.log("Qty On Hand = ",parseInt(itmQtyOnHand));
				console.log("Qty = ",parseInt(itemQtyHome.value));
				if(parseInt(itmQtyOnHand)>parseInt(itemQtyHome.value)){
					alert("Item Qty is less than Qty On Hand. Please Try Again");
					clearFields();
				}else{
					var subTotal = parseInt(itmQtyOnHand)*parseInt(itemUnitPrice.value);
					console.log("Sub Total = ",subTotal);
					orderSubTotal = document.getElementById("orderSubTotal");
					orderSubTotal.value=subTotal;
					orderTotal+=subTotal;
					console.log("Order Total = ",orderTotal)
					orderTotalInHome.value=orderTotal;
					if(orderTotal>15000){
						loanAmountInHome.value = "Loan Entry Exceded";
						clearFields();
					}
					qtyLeft = parseInt(itemQtyHome.value)-parseInt(itmQtyOnHand);
					itemQty.value = qtyLeft;
					if((document.getElementById("customerIdHome").value!=null |
							document.getElementById("customerIdHome").value!="")&&
							(document.getElementById("itemProductHome").value!=null |
									document.getElementById("itemProductHome").value!="")
									&&(document.getElementById("itemDescriptionHome").value!=null |
											document.getElementById("itemDescriptionHome").value!="")&&(itmQtyOnHand!=null |
													itmQtyOnHand!="")&&(itemUnitPrice.value!=null |
															itemUnitPrice.value!="")&&(subTotal!=null |
																	subTotal!="")){
						
					}
					addToCartObj = {
							customerId:document.getElementById("customerIdHome").value,
							productCode:document.getElementById("itemProductHome").value,
							description:document.getElementById("itemDescriptionHome").value,
							qtyOnHand:parseInt(itmQtyOnHand),
							unitPrice:parseInt(itemUnitPrice.value),
							total:subTotal
					}
					addToCartArr.push(addToCartObj);
					console.log(addToCartObj)

					addDetailsToAddToCartTbl();
				}
				
			}

			orderCashRecieved.addEventListener('keyup', (event) => {
				  var key = event.key;
				  var code = event.code;
				  let value = parseInt(orderCashRecieved.value);
				  if(value<=15000){
					  let amount = orderTotal-value;
					  console.log("Cash = "+value);
					  console.log("Amount = "+amount);
					  loanAmountInHome.value=amount;

					  let interestRate = 0.05;
					  let numMonths = 3;

					  let total = amount + (amount * interestRate);
					  let monthlyPayment = total / numMonths;
					  orderMonthlyInstallment.value = monthlyPayment
					  document.getElementById("orderMonthlyInterest").value=(amount * interestRate)
				  }
				}, false);

			function addDetailsToAddToCartTbl(){
				tbody = document.getElementById("tbodyInAddToCartTbl");
				tbody.innerHTML="";
				let count = 1;
				addToCartArr.forEach((e)=>{
					let tr = document.createElement("tr");
					let tdCount = document.createElement("td");
					tdCount.innerHTML =parseInt(count++);

					let tdCustomerId = document.createElement("td");
					tdCustomerId.innerHTML =e.customerId;

					let tdProductCode = document.createElement("td");
					tdProductCode.innerHTML =e.productCode;

					let tdProductDescription = document.createElement("td");
					tdProductDescription.innerHTML =e.description;

					let tdQtyOnHand = document.createElement("td");
					tdQtyOnHand.innerHTML =e.qtyOnHand;

					let tdUnitPrice = document.createElement("td");
					tdUnitPrice.innerHTML =e.unitPrice;

					let tdTotal = document.createElement("td");
					tdTotal.innerHTML =e.total;
					
					tr.append(tdCount)
					tr.append(tdCustomerId)
					tr.append(tdProductCode)
					tr.append(tdProductDescription)
					tr.append(tdQtyOnHand)
					tr.append(tdUnitPrice)
					tr.append(tdTotal)
					tbody.append(tr)
				})
			}
			window.addEventListener("load", async(event) => {
				console.log("page is fully loaded");
				  await generateOrderId();
				});
			 async function generateOrderId(){
				 let options = {
				            method: 'GET',
				            headers: {
				                'Content-Type': 
				                    'text/html',
				                    'Accept': 'text/html'
				 			}
			       }
			       let oId = null;
				    let resJson = await fetch("<%=request.getContextPath()%>/placeOrder", 
	                        options).then(async response =>{
		                        oId = await response.text();
					        return await response;

					    })
						
				    console.log("Response = ",resJson.status);
					    if(resJson.status==200){
					    	console.log("Order Id = ",oId);
							orderIdHome.value = oId;
						    clearFields();
						    }
				return resJson;
			}

			async function placeOrder(){
				let orderDetailsArr = new Array();
				
				addToCartArr.forEach((e)=>{
					let orderDetailsObj = {
							productId:e.productCode,
							orderId:orderIdHome.value,
							orderQty:e.qtyOnHand,
							totalPrice:e.total
					}	
					orderDetailsArr.push(orderDetailsObj)
				})
				if(addToCartArr.length === 0){
				alert('Please try again.')	
				}else{
				
				let order = {
						orderId:orderIdHome.value,
						orderDate:null,
						customerId:document.getElementById("customerIdHome").value,
						loanAmount:parseFloat(loanAmountInHome.value),
						paidAmount:parseFloat(orderTotal),
						orderDetails:orderDetailsArr
				}
				console.log(order)
				let options = {
	            method: 'POST',
	            headers: {
	                'Content-Type': 
	                    'application/json',
	                    'Accept': 'application/json'
	            },
	            body: JSON.stringify(order)
		        }
		        // Fake api for making post requests
		        let resJson;
				let res = await fetch("<%=request.getContextPath()%>/placeOrder", 
                        options).then(async response =>{
				    	resJson = await response.json()
				        return await response;

				    })
					console.log(resJson);
				    if(resJson.success==true){
					    alert("Order Placed Successfully");
						await generateOrderId();
					    clearFields();
					    addToCartArr.splice(0, addToCartArr.length);
					    }else{
					    	 alert("Please Try Again. You're not elligible for applying loan.");
								await generateOrderId();
							    clearFields();
							    addToCartArr.splice(0, addToCartArr.length);
					    }}
			}

			function clearFields(){
				console.log('clear fields in order')
				orderTotalInHome.value = "";
				loanAmountInHome.value = "";
				tbody.innerHTML = "";
				orderCashRecieved.value="";
				$("#itemDescriptionHome").val("");
				$("#itemQtyOnHandHome").val("");
				$("#itemQtyHome").val("");
				orderSubTotal.value="";
				$("#orderMonthlyInterest").val("");
				orderTotalInHome.value="";
				itemUnitPrice.value="";
				orderMonthlyInstallment.value="";
				}

			function discard(){
				clearFields();
				addToCartArr.splice(0, addToCartArr.length);
			}

			var itemQtyOnHandPattern = /^[0-9]+$/;
			var addToCartBtn = $('#addToCartBtn');
			var arr1 = [$('#itemQtyOnHandHome')]
			$('#itemQtyOnHandHome').off('keyup');
			$('#itemQtyOnHandHome').keyup(function (e) {
			    let index = 0;
			    if (validate(itemQtyOnHandPattern, arr1, index, e, addToCartBtn) == true) {
			    	$('#qtyOnHandLbl').text("Qty On Hand");
			    } else {
			    	$('#qtyOnHandLbl').text("Please use only numbers");
			    }
			})
			var arr2 = [$('#orderCashReceived')]
			var orderCashReceivedPattern = /^[0-9]+$/;
			var purchaseBtn = $('#purchaseBtn');
			$('#orderCashReceived').off('keyup');
			$('#orderCashReceived').keyup(function (e) {
			    let index = 0;
			    if (validate(orderCashReceivedPattern, arr2, index, e, purchaseBtn) == true) {
			    } else {
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
			
			$("#clearCartBtn").click(function(){
				clearFields();
				addToCartArr.splice(0, addToCartArr.length);
			})
	</script>
</html>
