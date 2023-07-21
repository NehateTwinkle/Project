<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
	.bttnStyle
	{
		background-color: lightblue;
		border-radius: 0.50rem;
		border:1px solid transperent;
	}
</style>
<script type="text/javascript">
	var xhttp=new XMLHttpRequest();
	var RazorpayOrderId;
	function CreateOrderID()
	{
		alert("1");
		var number=document.getElementById("amount").value;
		xhttp.open("GET","http://localhost:8080/MiniProject/OrderCreation?amount="+number,false);
		alert("2");
		xhttp.send();
		RazorpayOrderId=xhttp.responseText;
		  
		/* alert(number);  
		OpenCheckOut(number); */
		OpenCheckOut();
	}
</script>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script type="text/javascript">
	function OpenCheckOut()
	{
		alert("3");
		var number=document.getElementById("amount").value;
		
		alert(number);
		var options={
				"key":"rzp_test_eNcc019nABBIgL",
				"amount":number,
				"currency":"INR",
				"name":"Tops",
				"description":"Test",
				"order_id":RazorpayOrderId,
				"callback_url":"http://loclahost:8080/MiniProject/OrderCreation",
				"prefill":{
					"name":"rahul sanghavi",
					"email":"rahulsanghavi.tops@gmail.com",
					"contact":"9898361801"
				},
				"notes":{
					"address":"s.nagar"
				},
				"theme":{
					"color":"#3399cc"
				}
				
				
		};
		var rzp1=new Razorpay(options);
		rzp1.on('payment.failed',function (response){
			alert(response.error.code);
	        alert(response.error.description);
	        alert(response.error.source);
	        alert(response.error.step);
	        alert(response.error.reason);
	        alert(response.error.metadata.order_id);
	        alert(response.error.metadata.payment_id);
		});
		rzp1.open();
	    /* e.preventDefault(); */
	}
</script>
</head>
<body>
<div id="order_id">
	
</div>
<center>

	<input type="text" id="amount" value="<%= request.getParameter("price")%>">
	<button id="payButton" onclick="CreateOrderID()" class="bttnStyle">Pay Now</button>
</center>
</body>
</html>