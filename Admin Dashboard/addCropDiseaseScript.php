<?php

include 'config.php';

if(isset($_POST['add'])){ //check if login button is pressed

    $sql = "INSERT INTO crops_diseases(crop_id,disease_id) VALUES ('".$_POST['crop']."','".$_POST['disease']."')";

     if ($con->query($sql) === TRUE) {
        header("Location:admin.php");
        }
       } 
      



?>