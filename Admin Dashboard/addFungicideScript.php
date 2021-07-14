<?php

include 'config.php';

if(isset($_POST['add'])){ //check if login button is pressed

    $sql = "INSERT INTO fungicides(name,description) VALUES ('".$_POST['name']."','".$_POST['description']."')";
 
     if ($con->query($sql) === TRUE) {
        header("Location:admin.php");
        }
       } 
      



?>