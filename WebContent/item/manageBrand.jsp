<%@page import="net.model.BrandDaoImpl"%>
<%@page import="net.dao.BrandDao"%>
<%@page import="net.entity.Brand"%>
<%@page import="net.entity.Category"%>
<%@page language="java" import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Manage Brand - Bumble Bee</title>
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
		<section class="ManageBrand container-fluid position-relative d-flex align-items-center justify-content-center" style="width: 100%;height: 95vh;top:0;" id="manageItemsSection">
	        <div class="row position-relative d-flex" style="width: 100%;height:90%;">
	        		<div class="row container position-relative" style="top: 0;left: 0;right:0;margin: auto; width: 80%;height:30%;">
		                <div class="col position-relative">
		                    <div class="row position-relative" style="top: 0;">
		                        
		                        <div class="col-6 col-sm-6 col-md position-relative">
		                            <div class="form-floating position-relative">
		                                <input type="text" class="form-control bg-transparent border-3 w-100" id="brandIdInManageCategory" name="brandIdInManageBrand" placeholder="Brand ID" style="height: 40px;">
		                                <label for="brandIdInManageBrand" id="brandIdLblInBrand"><span>Brand ID</span></label>
		                            </div>
		                        </div>
		                        <div class="col-6 col-sm-6 col-md">
		                            <div class="form-floating position-relative">
		                                <input type="text" class="form-control bg-transparent border-3 w-100" id="brandNameInManageBrand" name="brandNameInManageBrand" placeholder="Brand" style="height: 40px;">
		                                <label for="brandNameInManageBrand" id="brandNameLblInBrand"><span>Brand Name</span></label>
		                            </div>
		                        </div>
		                        
		                    </div>
		                </div>
		            </div>
		
		            <div class="row container position-relative" style="left: 0;right:0;margin: auto; width: 80%;height: 10%;">
		                <div class="col-sm-6 col-md-3 position-relative">
		                    <div class="col-11 position-absolute" style="top: 0;bottom: 0;left:0;right:0;margin: auto;">
		                        <button id="saveBrand" class="btn btn-outline-success position-absolute" style="top: 0;bottom: 0;margin: auto;height: 40px; width: 100%;">Add Brand</button>
		                    </div>
		                </div>
		                <div class="col-sm-6 col-md-3 position-relative">
		                    <div class="col-11 position-absolute" style="top: 0;bottom: 0;left:0;right:0;margin: auto;">
		                        <button class="btn btn-outline-secondary position-absolute" style="top: 0;bottom: 0;margin: auto;height: 40px;width: 100%;" id="updateBrandBtn" >Update Brand</button>
		                    </div>
		                </div>
		                <div class="col-sm-6 col-md-3 position-relative">
		                    <div class="col-11 position-absolute" style="top: 0;bottom: 0;left:0;right:0;margin: auto;">
		                        <button class="btn btn-outline-danger position-absolute" style="top: 0;bottom: 0;margin: auto;height: 40px;width: 100%;" id="deleteBrandBtn" >Delete Brand</button>
		                    </div>
		                </div>
		            </div>
	            
	            <div class="row position-relative border-5 shadow" style="left: 0;right: 0;margin: auto;height: 330px;width: 93%;">
	                <div class="col bg-light position-relative" style="height: 100%;overflow: auto;">
	                    <table class="table table-hover">
	                        <thead>
	                        <tr>
	                            <th scope="col">#</th>
	                            <th scope="col">Brand Id</th>
	                            <th scope="col">Brand Name</th>
	                        </tr>
	                        </thead>
	                        <tbody id="brandDetailsTbl">
	                        </tbody>
	                    </table>
	                </div>
	            </div>
	            
	        </div>
	    </section>
	</body>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script>
	var brandIdInManageItemsPattern = /^(B-)[0-9]{3}$/;
	var brandNameInManageItemsPattern = /^[0-9A-z ]+[.]*[/]*[(]*[)]*[']*[,]*[&]*[-]*$/;
	
	var productBrand = $("#brandIdInManageCategory");
	var productBrandName = $("#brandNameInManageBrand");

	var saveBtn = $("#saveBrand");
	var updateBtn = $("#updateBrandBtn");
	var deleteBtn = $("#deleteBrandBtn");
	
	
	var itemsArray = [productBrand, productBrandName];
	productBrand.keyup(function (e) {
	    let index = 0;
	    var itemCodeLbl = $("#brandIdLblInBrand span");
	    if (validate(brandIdInManageItemsPattern, itemsArray, index, e, saveBtn, updateBtn, deleteBtn) == true) {
	        itemCodeLbl.text("Brand ID");
	    } else {
	        itemCodeLbl.text("Please use the given format (B-001)");
	    }
	});
	productBrandName.keyup(function (e) {
		let index = 1;
	    var itemCodeLbl = $("#brandNameLblInBrand span");
	    if (validate(brandNameInManageItemsPattern, itemsArray, index, e,  saveBtn, updateBtn, deleteBtn) == true) {
	        itemCodeLbl.text("Brand Name");
	    } else {
	        itemCodeLbl.text("Please use the correct format");
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
		await generateId();
		await getAllItems();
		});

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
		    let resJson = await fetch("<%=request.getContextPath()%>/saveBrand", 
                   options).then(async response =>{
                       id = await response.text();
			        return await response;

			    })
				
		    console.log("Response = ",resJson.status);
			    if(resJson.status==200){
			    	console.log("Brand Id = ",id);
					productBrand.val(id);
					productBrandName.val("");
				    }
		return resJson;
	}
	saveBtn.click(async function(){
		let brand = {
				brandId:productBrand.val(),
				brandName:productBrandName.val()
		}
		console.log("Brand Req = ",brand)
		let options = {
        method: 'POST',
        headers: {
            'Content-Type': 
                'application/json',
                'Accept': 'application/json'
        },
        body: JSON.stringify(brand)
        }
        // Fake api for making post requests
        let resJson;
		let res = await fetch("<%=request.getContextPath()%>/saveBrand", 
                options).then(async response =>{
		    	resJson = await response.json()
		        return await response;

		    })
			console.log(resJson);
		    if(resJson.success==true){
			    alert("Brand Saved Successfully");
			    await generateId();
			    await getAllItems();
			    }else{
			    	alert("Please try again.");
			    }
	})	
	updateBtn.click(async function(){
		let brand = {
				brandId:productBrand.val(),
				brandName:productBrandName.val()
		}
		console.log("Brand Req = ",brand)
		let options = {
        method: 'POST',
        headers: {
            'Content-Type': 
                'application/json',
                'Accept': 'application/json'
        },
        body: JSON.stringify(brand)
        }
        // Fake api for making post requests
        let resJson;
		let res = await fetch("<%=request.getContextPath()%>/updateBrand", 
                options).then(async response =>{
		    	resJson = await response.json()
		        return await response;

		    })
			console.log(resJson);
		    if(resJson.success==true){
			    alert("Brand Updated Successfully");
			    await generateId();
			    await getAllItems();
			    }else{
			    	alert("Please try again.");
			    }
	})	
	deleteBtn.click(async function(){
		let brand = {
				brandId:productBrand.val(),
				brandName:null
		}
		console.log("Brand Req = ",brand)
		let options = {
        method: 'POST',
        headers: {
            'Content-Type': 
                'application/json',
                'Accept': 'application/json'
        },
        body: JSON.stringify(brand)
        }
        // Fake api for making post requests
        let resJson;
		let res = await fetch("<%=request.getContextPath()%>/deleteBrand", 
                options).then(async response =>{
		    	resJson = await response.json()
		        return await response;

		    })
			console.log(resJson);
		    if(resJson.success==true){
			    alert("Brand Deleted Successfully");
			    await generateId();
			    await getAllItems();
			    }else{
			    	alert("Please try again.");
			    }
	})	
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
		let res = await fetch("<%=request.getContextPath()%>/brandDetails", 
                options).then(async response =>{
		    	resJson = await response.json()
		        return await response;

		    })
			console.log(resJson);
		$("#brandDetailsTbl").empty();
		for (let i = 0; i < resJson.length; i++) {
            	$("#brandDetailsTbl").append("<tr><td>" + (i + 1) + "</td><td>" + resJson[i].brandId + "</td><td>" + resJson[i].brandName + "</td></tr>");
            
        }
		}	
	</script>
</html>
