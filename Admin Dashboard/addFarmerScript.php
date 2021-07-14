<?php

include 'config.php';

if(isset($_POST['add'])){ //check if login button is pressed

    $sql = "INSERT INTO farmers(name,mobile,password) VALUES ('".$_POST['name']."','".$_POST['mobile']."','".$_POST['password']."')";
 
     if ($con->query($sql) === TRUE) {
        header("Location:admin.php");
        }
       } 
      



?>