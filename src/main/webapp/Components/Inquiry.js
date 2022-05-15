$(document).ready(function() {
	$("#alertSuccess").hide();
	$("#alertError").hide();
});

$(document).on("click", "#btnSave", function(event) {
	
	// Clear status msges
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();
	
	

	// Form validation
	
	var status = validateComplaintForm();
	// If not valid
	if (status != true) {
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	} 
	
	
	//if form is valid
	
	var type = ($("#hidcomIDSave").val() == "") ? "POST" : "PUT";
	$.ajax(
	{
		url : "InquiryAPI",
		type : type,
		data : $("#Complaint").serialize(),
		dataType : "text",
		complete : function(response, status)
		{
			onComplainSaveComplete(response.responseText, status);
		}
	});
	
	//$("#Complaint").submit();
	

});


function onComplainSaveComplete(response, status) 
{ 
 	if(status == "success")
 	{
		var resultSet = JSON.parse(response);
		
		if(resultSet.status.trim() == "success")
		{
			$("#alertSuccess").text("Successfully saved."); 
			$("#alertSuccess").show(); 
			
			$("#comGrid").html(resultSet.data); 
		}else if(resultSet.status.trim() == "error")
		{
			$("#alertError").text(resultSet.data); 
 			$("#alertError").show();
		}
	}else if(status == "error")
	{
		 $("#alertError").text("Error while saving status."); 
		 $("#alertError").show();
	}else
	{
		 $("#alertError").text("Error while saving ."); 
		 $("#alertError").show();
	}
		$("#hidcomIDSave").val(""); 
		$("#Complaint")[0].reset(); 
}



//Update

$(document).on("click", ".btnUpdate", function(event)
	{
		$("#hidcomIDSave").val($(this).data("itemid"));
		$("#combox").val($(this).closest("tr").find('td:eq(1)').text()); 
		$("#comDate").val($(this).closest("tr").find('td:eq(2)').text());
		$("#Userid").val($(this).closest("tr").find('td:eq(3)').text()); 
	});



//delete
	
$(document).on("click", ".btnRemove", function(event) {

	
	$.ajax(
	{
		url : "InquiryAPI",
		type : "DELETE",
		data : "comId=" + $(this).data("itemid"),
		dataType : "text",
		complete : function(response, status)
		{
			onComplainDeleteComplete(response.responseText, status);
		}
	});
	
});	

function onComplainDeleteComplete(response, status)
{ 
if (status == "success") 
 { 
 var resultSet = JSON.parse(response); 
 if (resultSet.status.trim() == "success") 
 { 
 $("#alertSuccess").text("Successfully deleted."); 
 $("#alertSuccess").show(); 
 $("#comGrid").html(resultSet.data); 
 } else if (resultSet.status.trim() == "error") 
 { 
 $("#alertError").text(resultSet.data); 
 $("#alertError").show(); 
 } 
 } else if (status == "error") 
 { 
 $("#alertError").text("Error while deleting."); 
 $("#alertError").show(); 
 } else
 { 
 $("#alertError").text("Unknown error while deleting.."); 
 $("#alertError").show(); 
 } 
}




function validateComplaintForm() {
	
	//Validations 
	//USER ID
	
	if ($("#Userid").val().trim() == "") {
		return "Insert User ID!";
	}



	//Inquiry or Complain
	
	if ($("#combox").val().trim() == "") {
		return "PLease Insert Complaint!";
	}

	return true;

}

