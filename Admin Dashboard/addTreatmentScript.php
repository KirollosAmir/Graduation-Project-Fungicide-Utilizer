<?php

include 'config.php';

if(isset($_POST['add'])){ //check if login button is pressed

    $sql = "INSERT INTO treatments(disease_id,fungicide_id,dose) VALUES ('".$_POST['disease']."','".$_POST['fungicide']."','".$_POST['dose']."')";

     if ($con->query($sql) === TRUE) {
        header("Location:admin.php");
        }
       } 
      



?>