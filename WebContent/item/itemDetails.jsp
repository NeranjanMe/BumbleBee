<%@page import="net.entity.Item"%>
<%@page language="java" import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Item Details - Bumble Bee</title>
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
		<section class="ManageItems container-fluid position-relative d-flex align-items-center justify-content-center"
	             style="width: 100%;height: 95vh;top:0;" id="manageItemsSection">
	        <div class="row position-relative d-flex" style="width: 100%;height:90%;">
	            
	            <div class="row position-relative border-5 shadow"
	                 style="left: 0;right: 0;margin: auto;height: 100%;width: 93%;">
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
	                        <tbody id="itemDetailsTblBody">
	                        </tbody>
	                    </table>
	                </div>
	            </div>
	            </div>
	        </div>
	    </section>
	</body>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script>
	window.addEventListener("load", async(event) => {
		console.log("page is fully loaded");
		  await getAllItems();
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
		$("#itemDetailsTblBody").empty();
		for (let i = 0; i < resJson.length; i++) {
            	$("#itemDetailsTblBody").append("<tr><td>" + (i + 1) + "</td><td>" + resJson[i].id + "</td><td>" + resJson[i].name + "</td><td>" + resJson[i].qty + "</td><td>" + resJson[i].unitPrice + "</td><td>" + resJson[i].status + "</td><td>" + resJson[i].category + "</td><td>" + resJson[i].brand + "</td></tr>");
            
        }
		}	
	</script>
</html>
