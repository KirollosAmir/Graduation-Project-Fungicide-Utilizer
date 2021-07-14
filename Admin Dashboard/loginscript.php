<?php

include 'config.php';

if(isset($_POST['login'])){ //check if login button is pressed

    

    $sql = "select mobile,password from admins where mobile = '".$_POST['mobile']."'";
    $result = mysqli_query($con,$sql) 
     or die("failed  to query database".mysqli_error());
    $row = mysqli_fetch_array($result) ;
      if ($row['mobile'] == $_POST['mobile'] && $row['password'] == $_POST['password']) {
        header("Location:admin.php");
        }
       else{
        header("Location:login.php");
        
       } 
      }



?>