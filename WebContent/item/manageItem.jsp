<%@page import="net.model.ItemDaoImpl"%>
<%@page import="net.dao.ItemDao"%>
<%@page import="net.entity.Brand"%>
<%@page import="net.model.BrandDaoImpl"%>
<%@page import="net.dao.BrandDao"%>
<%@page import="net.entity.Category"%>
<%@page import="net.model.CategoryDaoImpl"%>
<%@page import="net.dao.CategoryDao"%>
<%@page import="net.entity.Item"%>
<%@page language="java" import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Manage Items - Bumble Bee</title>
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
	        		<div class="row container position-relative"style="top: 0;left: 0;right:0;margin: auto; width: 80%;height:30%;">
		                <div class="col position-relative">
		                    <div class="row position-relative" style="top: 0;">
		                        <div class="col-6 col-sm-6 col-md position-relative">
		                            <div class="form-floating position-relative">
		                            
		                                <input type="text" class="form-control bg-transparent border-3 w-100"
		                                       id="productIdInManageItems" name="productIdInManageItems" placeholder="Product ID" style="height: 40px;" >
		                                <label for="productIdInManageItems" id="itemCodeLblInItems"><span>Product ID</span></label>
		                            </div>
		                        </div>
		                        <div class="col-6 col-sm-6 col-md">
		                            <div class="form-floating position-relative">
		                                <input type="text" class="form-control bg-transparent border-3 w-100"
		                                       id="productNameInManageItems" name="productNameInManageItems" placeholder="Product Name" style="height: 40px;">
		                                <label for="productNameInManageItems"
		                                       id="itemDescriptionLblInItems"><span>Product Name</span></label>
		                            </div>
		                        </div>
		                        <div class="col">
		                            <div class="form-floating position-relative">
		                                <input type="text" class="form-control bg-transparent border-3 w-100"
		                                       id="productQtyInManageItems" name="productQtyInManageItems" placeholder="Qty" style="height: 40px;">
		                                <label for="productQtyInManageItems" id="itemQtyLblInItems"><span>Qty</span></label>
		                            </div>
		                        </div>
		                    </div>
		                    <div class="row position-relative" style="top: 10px;">
		                        <div class="col-6 col-sm">
		                            <div class="form-floating position-relative">
		                                <input type="text" class="form-control bg-transparent border-3 w-100"
		                                       id="productUnitPriceInManageItems" name="productUnitPriceInManageItems" placeholder="Unit Price" style="height: 40px;">
		                                <label for="productUnitPriceInManageItems"
		                                       id="itemUnitPriceLblInItems"><span>Unit Price</span></label>
		                            </div>
		                        </div>
		                        <div class="col-6 col-sm">
		                            <div class="form-floating position-relative">
		                                <input type="text" class="form-control bg-transparent border-3 w-100"
		                                       id="productStatusInManageItems" name="productStatusInManageItems" placeholder="Product Status" style="height: 40px;">
		                                <label for="productStatusInManageItems"
		                                       id="itemStatusLblInItems"><span>Product Status</span></label>
		                            </div>
		                        </div>
		                        <div class="col-6 col-sm">
		                            <div class="form-floating position-relative">
	                                <select class="form-select bg-transparent" id="productCategoryInManageItems" name="productCategoryInManageItems"
	                                        aria-label="Floating label select example" style="height: 40px; width: 100%;">
	                                        <option value="Select Category">Select Category</option>
	                                        <%CategoryDao categoryDao = new CategoryDaoImpl();
	                                        List<Category>categoryList = categoryDao.getCategoryDetails();
	                                        for(Category c:categoryList){
	                                        	System.out.println(c.getCategoryName());
	                                        %>
	                                        <option value=<%=c.getCategoryId()%>><%=c.getCategoryId()%></option>
	                                        <%} %>
	                                </select>
	                                <label for="productCategoryInManageItems">Product Category</label>
	                            </div>
		                        </div>
		                        <div class="col-6 col-sm">
		                            <div class="form-floating position-relative">
	                                <select class="form-select bg-transparent" id="productBrandInManageItems" name="productBrandInManageItems"
	                                        aria-label="Floating label select example" style="height: 40px; width: 100%;">
	                                         <option value="Select Brand">Select Brand</option>
	                                        <%BrandDao brandDao = new BrandDaoImpl();
	                                        List<Brand>brandList = brandDao.getBrandDetails();
	                                        for(Brand b:brandList){
	                                        	System.out.println(b.getBrandName());
	                                        %>
	                                        <option value=<%=b.getBrandId()%>><%=b.getBrandId()%></option>
	                                        <%} %>
	                                </select>
	                                <label for="productBrandInManageItems">Product Brand</label>
	                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		
		            <div class="row container position-relative"
		                 style="left: 0;right:0;margin: auto; width: 80%;height: 10%;">
		                <div class="col-sm-6 col-md-3 position-relative">
		                    <div class="col-11 position-absolute" style="top: 0;bottom: 0;left:0;right:0;margin: auto;">
		                        <button id="saveItems" class="btn btn-outline-success position-absolute"
		                                style="top: 0;bottom: 0;margin: auto;height: 40px; width: 100%;">Add Item
		                        </button>
		                    </div>
		                </div>
		                <div class="col-sm-6 col-md-3 position-relative">
		                    <div class="col-11 position-absolute" style="top: 0;bottom: 0;left:0;right:0;margin: auto;">
		                        <button class="btn btn-outline-secondary position-absolute"
		                                style="top: 0;bottom: 0;margin: auto;height: 40px;width: 100%;" id="updateItemBtn">
		                            Update Item
		                        </button>
		                    </div>
		                </div>
		                <div class="col-sm-6 col-md-3 position-relative">
		                    <div class="col-11 position-absolute" style="top: 0;bottom: 0;left:0;right:0;margin: auto;">
		                        <button class="btn btn-outline-danger position-absolute"
		                                style="top: 0;bottom: 0;margin: auto;height: 40px;width: 100%;" id="deleteItemBtn" >
		                            Delete Item
		                        </button>
		                    </div>
		                </div>
		            </div>
	            
	            <div class="row position-relative border-5 shadow"
	                 style="left: 0;right: 0;margin: auto;height: 330px;width: 93%;">
	                <div class="col bg-light position-relative" style="height: 100%;overflow: auto;">
	                    <table class="table table-hover">
	                        <thead>
	                        <tr>
	                            <th scope="col">#</th>
	                            <th scope="col">Code</th>
	                            <th scope="col">Description</th>
	                            <th scope="col">Qty</th>
	                            <th scope="col">Unit Price</th>
	                            <th scope="col">Status</th>
	                            <th scope="col">Category</th>
	                            <th scope="col">Brand</th>
	                        </tr>
	                        </thead>
	                        <tbody id="manageItemDetailsTblBody">
	                        </tbody>
	                    </table>
	                </div>
	            </div>
	        </div>
	    </section>
	</body>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script>
	var productIdInManageItemsPattern = /^(P-)[0-9]{3}$/;
	var productNameInManageItemsPattern = /^[0-9A-z ]+[.]*[/]*[(]*[)]*[']*[,]*[&]*[-]*$/;
	var productQtyInManageItemsPattern =  /^[0-9]+$/;
	var productUnitPriceInManageItemsPattern = /^[0-9.]{1,}$/;
	var productStatusInManageItemsPattern =  /^[0-9.]{1,}$/;

	var productIdInManageItems = $("#productIdInManageItems");
	var productNameInManageItems = $("#productNameInManageItems");
	var productQtyInManageItems = $("#productQtyInManageItems");
	var productUnitPriceInManageItems = $("#productUnitPriceInManageItems");
	var productStatusInManageItems = $("#productStatusInManageItems");
	var productCategoryInManageItems = $("#productCategoryInManageItems");
	var productBrandInManageItems = $("#productBrandInManageItems");

	var saveItemsBtn = $("#saveItems");
	var updateItemsBtn = $("#updateItemBtn");
	var deleteItemsBtn = $("#deleteItemBtn");
	
	
	var itemsArray = [productIdInManageItems, productNameInManageItems, productQtyInManageItems, productUnitPriceInManageItems, productStatusInManageItems];
	productIdInManageItems.keyup(async function (e) {
	    let index = 0;
	    var itemCodeLbl = $("#itemCodeLblInItems span");
	    if (validate(productIdInManageItemsPattern, itemsArray, index, e, saveItemsBtn, updateItemsBtn, deleteItemsBtn) == true) {
	        itemCodeLbl.text("Product ID");
	        await searchItem();
	    } else {
	        itemCodeLbl.text("Please use the given format (P-001)");
	    }
	});

	async function searchItem(){
		let options = {
        method: 'GET',
        headers: {
            'Content-Type': 
                'application/json',
                'Accept': 'application/json',
                'ProdId':productIdInManageItems.val()
        },
        }
        // Fake api for making post requests
        let resJson;
		let res = await fetch("<%=request.getContextPath()%>/saveItem", 
                options).then(async response =>{
		    	resJson = await response.json()
		        return await response;

		    })
			console.log(resJson);
		    	productNameInManageItems.val(resJson.name);
		    	productQtyInManageItems.val(resJson.qty);
		    	productUnitPriceInManageItems.val(resJson.unitPrice);
		    	productStatusInManageItems.val(resJson.status);
		    	$("#productCategoryInManageItems").val(resJson.category);
		    	$("#productBrandInManageItems").val(resJson.brand);
		}
	productNameInManageItems.keyup(function (e) {
		let index = 1;
	    var itemCodeLbl = $("#itemDescriptionLblInItems span");
	    if (validate(productNameInManageItemsPattern, itemsArray, index, e, saveItemsBtn, updateItemsBtn, deleteItemsBtn) == true) {
	        itemCodeLbl.text("Product Name");
	    } else {
	        itemCodeLbl.text("Please use the correct format");
	    }
	});
	productQtyInManageItems.keyup(function (e) {
		let index = 2;
	    var itemCodeLbl = $("#itemQtyLblInItems span");
	    if (validate(productQtyInManageItemsPattern, itemsArray, index, e, saveItemsBtn, updateItemsBtn, deleteItemsBtn) == true) {
	        itemCodeLbl.text("Qty");
	    } else {
	        itemCodeLbl.text("Please use only numbers");
	    }
	});
	productUnitPriceInManageItems.keyup(function (e) {
		let index = 3;
	    var itemCodeLbl = $("#itemUnitPriceLblInItems span");
	    if (validate(productUnitPriceInManageItemsPattern, itemsArray, index, e, saveItemsBtn, updateItemsBtn, deleteItemsBtn) == true) {
	        itemCodeLbl.text("Unit Price");
	    } else {
	        itemCodeLbl.text("Please use only number");
	    }
	});
	productStatusInManageItems.keyup(function (e) {
		let index = 4;
	    var itemCodeLbl = $("#itemStatusLblInItems span");
	    if (validate(productStatusInManageItemsPattern, itemsArray, index, e, saveItemsBtn, updateItemsBtn, deleteItemsBtn) == true) {
	        itemCodeLbl.text("Product Status");
	    } else {
	        itemCodeLbl.text("Please insert 0 as false and true as 1)");
	    }
	});

	function validate(pattern, array, index, e, saveBtn, updateBtn, deleteBtn) {
	    if (pattern.test(array[index].val())) {
	        array[index].css("border", "3px solid green");
	        if (e.key === 'Enter') {
	            array[index + 1].focus();
	        }
	        saveBtn.prop("disabled", false);
	        updateBtn.prop("disabled", false);
	        deleteBtn.prop("disabled", false);
	        return true;
	    } else {
	        array[index].css("border", "3px solid red");
	        saveBtn.prop("disabled", true);
	        updateBtn.prop("disabled", true);
	        deleteBtn.prop("disabled", true);
	        return false;
	    }
	    return false;
	}

	window.addEventListener("load", async(event) => {
		console.log("page is fully loaded");
		  await getAllItems();
		  await generateId();
		});
	async function getAllItems(){
		let options = {
        method: 'GET',
        headers: {
            'Content-Type': 
                'application/json',
                'Accept': 'application/json'
        },
        }
        // Fake api for making post requests
        let resJson;
		let res = await fetch("<%=request.getContextPath()%>/itemDetails", 
                options).then(async response =>{
		    	resJson = await response.json()
		        return await response;

		    })
			console.log(resJson);
		$("#manageItemDetailsTblBody").empty();
		for (let i = 0; i < resJson.length; i++) {
            	$("#manageItemDetailsTblBody").append("<tr><td>" + (i + 1) + "</td><td>" + resJson[i].id + "</td><td>" + resJson[i].name + "</td><td>" + resJson[i].qty + "</td><td>" + resJson[i].unitPrice + "</td><td>" + resJson[i].status + "</td><td>" + resJson[i].category + "</td><td>" + resJson[i].brand + "</td></tr>");
            
        }
		}	
	async function generateId(){
		 let options = {
		            method: 'GET',
		            headers: {
		                'Content-Type': 
		                    'text/html',
		                    'Accept': 'text/html'
		 			}
	       }
	       let id = null;
		    let resJson = await fetch("<%=request.getContextPath()%>/generateItemCode", 
                  options).then(async response =>{
                      id = await response.text();
			        return await response;

			    })
				
		    console.log("Response = ",resJson.status);
			    if(resJson.status==200){
			    	console.log("Item Id = ",id);
			    	productIdInManageItems.val(id)
				    }
		return resJson;
	}
	saveItemsBtn.click(async function(){
		let item = {
				id:productIdInManageItems.val(),
				name:productNameInManageItems.val(),
				qty:parseInt(productQtyInManageItems.val()),
				unitPrice:parseFloat(productUnitPriceInManageItems.val()),
				status:parseInt(productStatusInManageItems.val()),
				category:productCategoryInManageItems.val(),
				brand:productBrandInManageItems.val()
		}
		console.log("Item Req = ",item)
		let options = {
       method: 'POST',
       headers: {
           'Content-Type': 
               'application/json',
               'Accept': 'application/json'
       },
       body: JSON.stringify(item)
       }
       // Fake api for making post requests
       let resJson;
		let res = await fetch("<%=request.getContextPath()%>/saveItem", 
               options).then(async response =>{
		    	resJson = await response.json()
		        return await response;

		    })
			console.log(resJson);
		    if(resJson.success==true){
			    alert("Item Saved Successfully");
			    await generateId();
			    await getAllItems();
			    clearFields();
			    }else{
			    	alert("Please try again.");
			    }
	})	
	updateItemsBtn.click(async function(){
		let item = {
				id:productIdInManageItems.val(),
				name:productNameInManageItems.val(),
				qty:parseInt(productQtyInManageItems.val()),
				unitPrice:parseFloat(productUnitPriceInManageItems.val()),
				status:parseInt(productStatusInManageItems.val()),
				category:productCategoryInManageItems.val(),
				brand:productBrandInManageItems.val()
		}
		console.log("Item Req = ",item)
		let options = {
       method: 'POST',
       headers: {
           'Content-Type': 
               'application/json',
               'Accept': 'application/json'
       },
       body: JSON.stringify(item)
       }
       // Fake api for making post requests
       let resJson;
		let res = await fetch("<%=request.getContextPath()%>/updateItem", 
               options).then(async response =>{
		    	resJson = await response.json()
		        return await response;

		    })
			console.log(resJson);
		    if(resJson.success==true){
			    alert("Item Updated Successfully");
			    await generateId();
			    await getAllItems();
			    clearFields();
			    }else{
			    	alert("Please try again.");
			    }
	})	
	deleteItemsBtn.click(async function(){
		let item = {
				id:productIdInManageItems.val(),
				name:null,
				qty:0,
				unitPrice:0.0,
				status:0,
				category:null,
				brand:null
		}
		console.log("Item Req = ",item)
		let options = {
       method: 'POST',
       headers: {
           'Content-Type': 
               'application/json',
               'Accept': 'application/json'
       },
       body: JSON.stringify(item)
       }
       // Fake api for making post requests
       let resJson;
		let res = await fetch("<%=request.getContextPath()%>/deleteItem", 
               options).then(async response =>{
		    	resJson = await response.json()
		        return await response;

		    })
			console.log(resJson);
		    if(resJson.success==true){
			    alert("Item Deleted Successfully");
			    await generateId();
			    await getAllItems();
			    clearFields();
			    }else{
			    	alert("Please try again.");
			    }
	})		
	function clearFields(){
		productNameInManageItems.val("")
		productQtyInManageItems.val("")
		productUnitPriceInManageItems.val("")
		productStatusInManageItems.val("")
		}
	</script>
</html>
