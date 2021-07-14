<?php
require_once('config.php');
 
  if (isset($_GET['expertid'])) {
    $crop_id = $_GET["crop_id"]; 
    $disease_id = $_GET["disease_id"]; 
    $sql = "INSERT INTO crops_diseases (crop_id,disease_id) VALUES ('$crop_id','$disease_id')";
 
    if ($con->query($sql) === TRUE) {
        echo "success";
            
    }
  }
?>