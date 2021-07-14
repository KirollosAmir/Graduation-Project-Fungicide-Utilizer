<?php

include 'config.php';

if(isset($_POST['add'])){ //check if login button is pressed

    $sql = "INSERT INTO experts(name,mobile,job_title,organization,password) VALUES ('".$_POST['name']."','".$_POST['mobile']."','".$_POST['job']."','".$_POST['organization']."','".$_POST['password']."')";
 
     if ($con->query($sql) === TRUE) {
        header("Location:admin.php");
        }
       } 
      



?>