/**
 *
File: 	     removeAdmin.js
Purpose:     Create an Internship Management Portal for NSU's Gruduate Students
             to be able to submit an Internship Form for approval. 

Assignment:  Capstone Project
School:      Nova Southeastern University
Supervisor:  Dr. James Parrish

Author:      Nicky Alvarez
History:     Created 04/01/2016

(c) Copyright Nicky Alvarez 2016 All rights reserved.
 *
 */

function testfunc($e){
    var select;
    var r = confirm("Are you sure you want to delete the admin?");
    if (r == true) {
      removeAdminAJAX($e);
    } 
}

function removeAdminAJAX($id)
{
	var submit_id=$id;
	 $.ajax({
            type:"POST",
            url:"../functions/removeAdmin.php",
            data:{id:submit_id},
            cache:false,
            success: function(result){
                var res = trimResult(result);
                if(result == "removed"){
                   $("#tab_admin-list").load('adminList.php');
                }
                else
                {
                    alert('Error!');
                }
            }
            });



}