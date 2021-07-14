<?php

include 'config.php';

if(isset($_POST['add'])){ //check if login button is pressed

    $sql = "INSERT INTO disease(disease_name,severity,symptoms) VALUES ('".$_POST['name']."','".$_POST['severity']."','".$_POST['symptoms']."')";
 
     if ($con->query($sql) === TRUE) {
        header("Location:admin.php");
        }
       } 
      



?>