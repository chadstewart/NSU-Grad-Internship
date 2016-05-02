/**
 *
File: 	     chackUserName.js
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

function checkUserNameAJAX()
{
    var username = document.getElementById("username").value;

    if(username!="")
    {
	 $.ajax({
            type:"POST",
            url:"../functions/checkUserName.php",
            data:{name:username},
            cache:false,
            success: function(result){
                var res = trimResult(result);
                if(result == "available"){
                    document.getElementById("available_username").innerHTML = "Available";
                    document.getElementById("err_username").innerHTML = "";
                     $("#add_admin").removeAttr('disabled');
                }
                else
                {
                    document.getElementById("available_username").innerHTML = "";
                    document.getElementById("err_username").innerHTML = "Not Available";
                    $("#add_admin").attr('disabled','disabled');
                }
            }
            });
    }
    else
    {
        document.getElementById("available_username").innerHTML = "";
        document.getElementById("err_username").innerHTML = "";
        $("#add_admin").removeAttr('disabled');
    }



}