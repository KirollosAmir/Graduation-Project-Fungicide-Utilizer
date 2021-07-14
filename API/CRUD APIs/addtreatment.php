<?php
require_once('config.php');
 
  if (isset($_GET['expertid'])) {
    $disease_id = $_GET["disease_id"]; 
    $fungicide_id = $_GET["fungicide_id"]; 
    $dose = $_GET["dose"]; 
    $sql = "INSERT INTO treatments (disease_id,fungicide_id,dose) VALUES ('$disease_id','$fungicide_id','$dose')";
 
    if ($con->query($sql) === TRUE) {
        $last_id = $con->insert_id;
        echo $last_id;
            
    }
  }
?>