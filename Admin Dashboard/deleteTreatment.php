<?php
require_once('config.php');
 

    $fungicideid = $_GET["fungicide_id"]; 
    $diseaseid = $_GET["disease_id"]; 

    $sql = "DELETE FROM treatments WHERE fungicide_id='$fungicideid' AND disease_id='$diseaseid' ";

    if ($con->query($sql) === TRUE) {
      header("Location: admin.php");
    }
  
?>