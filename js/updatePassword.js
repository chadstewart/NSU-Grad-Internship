/**
 *
File: 	     updatePassword.js
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

function validateUpdate(){
    var oldPassword = document.getElementById("oldPassword").value;
    var newPassword = document.getElementById("newPassword").value;
    var confirmPassword = document.getElementById("confirmPassword").value;
    
    var isValidForm = true;
    if(oldPassword == ""){
        document.getElementById("oldpassword_err").innerHTML = "This field is required";
        isValidForm = false;
    }
    else{
        document.getElementById("oldpassword_err").innerHTML = "";
    }

    if(newPassword == ""){
        document.getElementById("newpassword_err").innerHTML = "This field is required";
        isValidForm = false;
    }
    else{
        document.getElementById("newpassword_err").innerHTML = "";
    }

    if(confirmPassword == ""){
        document.getElementById("mismatch_err").innerHTML = "This field is required";
        isValidForm = false;
    }
    else{
        document.getElementById("mismatch_err").innerHTML = "";
    }


    if(!isValidForm){
        return false;
    }

    return true;
}

function UPAJAX()
{
    if(!validateUpdate())
    {
        return false;
    }
    else
    {

        var oldPassword = document.getElementById("oldPassword").value;
        var newPassword = document.getElementById("newPassword").value;
        var confirmPassword = document.getElementById("confirmPassword").value;
        if(confirmPassword!=newPassword)
        {
            document.getElementById("mismatch_err").innerHTML = "Password not Matched";
        }
        else
        {
            document.getElementById("mismatch_err").innerHTML = "";
            $.ajax({
            type:"POST",
            url:"../functions/updatePassword.php",
            data:{oldpass:oldPassword,newpass:newPassword,confirmpass:confirmPassword},
            cache:false,
            success: function(result){
                var res = trimResult(result);
                if(result == "notmatched"){
                    document.getElementById("oldpassword_err").innerHTML = "Incorrect Old Password";
                }
                else if(result == "updated"){
                   document.getElementById("mismatch_err").innerHTML = "";
                   document.getElementById("oldpassword_err").innerHTML = "";
                   alert('Password Updated Successfully!');
                }
                else
                {
                    alert('Error!');
                }
            }
            });
        }


    }
    
}

function trimResult(res){
    var res=res.replace(/^\s+|\s+$/,'');
    return res;
}