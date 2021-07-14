<?php

include 'config.php';

if(isset($_POST['add'])){ //check if login button is pressed

    $sql = "INSERT INTO crops(name,duration) VALUES ('".$_POST['name']."','".$_POST['duration']."')";
 
     if ($con->query($sql) === TRUE) {
        header("Location:admin.php");
        }
       } 
      



?>