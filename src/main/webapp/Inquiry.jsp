<%@page import="com.Inquiry"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

	<title>ElectroGrid-Inquiry</title>
	<link rel="stylesheet" href="View/bootstrap.min.css">
	<script src="Components/jquery.min.js"></script>
	<script src="Components/Inquiry.js"></script>
	

</head>
<body>
<div class="bg-light">
     <div class="container"><div class="row"><div class="col-12">
	
	 <center><h1 style="font-size:380%;">ACCOUNT HOLDER INQUIRY</h1></center>
	 
<hr/>

	 <div class="card bg-info">
          <div class="card-body">
	<form id = "Complaint"  method='post' action='Inquiry.jsp'>
		
					    
			 <div class="mb-3">
			  <label for="exampleFormControlInput1" class="form-label">User ID</label>
			  <input type="text" class="form-control form-control-lg" id="Userid" name="Userid" placeholder="">
			</div>
			<div class="mb-3">
			  <label for="exampleFormControlTextarea1" class="form-label">Complaints</label>
			  <textarea class="form-control" id="combox" name="combox" rows="3"></textarea>
			</div>
			<div class="mb-3">
			  <label for="exampleFormControlTextarea1" class="form-label">Date</label>
			  <input type="date" class="form-control" id="comDate" name="comDate" ></input>
			</div>
			
			
			
			
		 	<input id="btnSave" name="btnSave" type="button" value="Send" class="btn btn-primary">
		 	
		 	
		 	<input type="hidden" id="hidcomIDSave" name="hidcomIDSave" value="">
		

	</form>
	</div>
	</div>
	<hr/>
	
	<div id="alertSuccess" class="alert alert-success"></div>
			<div id="alertError" class="alert alert-danger"></div>
	
	
	<hr/>
		<br>
	<center>
			<div class="table table-striped " id="divItemsGrid">
		<%
		

				Inquiry inqobj = new Inquiry(); 
				out.print(inqobj.retriveInquiry());
		%>
		</div>
			</center>
	</div>
	</div>
	</div>
	</div>
</body>
</html>