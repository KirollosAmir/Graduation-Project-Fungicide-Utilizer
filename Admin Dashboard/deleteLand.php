<?php
require_once('config.php');
 

    $landid = $_GET["id"]; 

    $sql = "DELETE FROM land_owners WHERE land_id='$landid'";

    if ($con->query($sql) === TRUE) {
      header("Location: admin.php");
    }
  
?>