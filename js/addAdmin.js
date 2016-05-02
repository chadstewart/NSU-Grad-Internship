/**
 *
File: 	     addAdmin.js
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

function validateAddAdmin(){
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;
    var email = document.getElementById("email").value;
    var isValidForm = true;
    if(username == ""){
        document.getElementById("err_username").innerHTML = "This field is required";
        isValidForm = false;
    }
    else{
        document.getElementById("err_username").innerHTML = "";
    }

    if(password == ""){
        document.getElementById("err_password").innerHTML = "This field is required";
        isValidForm = false;
    }
    else{
        document.getElementById("err_password").innerHTML = "";
    }

    if(email == ""){
        document.getElementById("err_email").innerHTML = "This field is required";
        isValidForm = false;
    }
    else{
        document.getElementById("err_email").innerHTML = "";
    }


    if(!isValidForm){
        return false;
    }
    return true;
}


function addAdminAJAX()
{
    if(!validateAddAdmin())
    {
        return false;
    }
    else
    {

        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;
        var email = document.getElementById("email").value;
        
        $.ajax({
            type:"POST",
            url:"../functions/addAdmin.php",
            data:{user:username,password:password, email:email},
            cache:false,
            success: function(result){
                var res = trimResult(result);
                if(result == "add"){
                    //alert(document.getElementById("username").value);
                    document.getElementById("username").value = "";
                    document.getElementById("password").value = "";
                    document.getElementById("email").value = "";
                    document.getElementById("available_username").innerHTML = "";
                    document.getElementById("err_username").innerHTML = "";
                    event.preventDefault();
                    $("#tab_admin-list").load('adminList.php');
                    document.getElementById('admin-list-tab').click();
                    

                }
                else{
                    alert('Error');
                }
            }
        });
        

    }
    
}

function trimResult(res){
    var res=res.replace(/^\s+|\s+$/,'');
    return res;
}