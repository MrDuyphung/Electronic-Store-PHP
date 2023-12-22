<?php
session_start();
include "db.php";
if (isset($_POST["email"])) {
    $email = $_POST['email'];
    $emailValidation = "/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9]+(\.[a-z]{2,4})$/";
    
   
                echo "<div class='alert alert-success'>
                    <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>
                    <b>Thanks for subscribing</b>
                </div>";
                
                
            }

        
    
    

?>