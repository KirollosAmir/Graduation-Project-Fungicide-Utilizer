<?php
require_once('config.php');
 
  if (isset($_GET['expertid'])) {
    $disease_name = $_GET["disease_name"]; 
    $severity = $_GET["severity"]; 
    $symptoms = $_GET["symptoms"]; 
    $sql = "INSERT INTO disease (disease_name,severity,symptoms) VALUES ('$disease_name','$severity','$symptoms')";
 
    if ($con->query($sql) === TRUE) {
        $last_id = $con->insert_id;
        echo $last_id;
            
    }
  }
?>