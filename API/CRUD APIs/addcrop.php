<?php
require_once('config.php');
 
  // If upload button is clicked ...
  if (isset($_GET['expertid'])) {
    $name = $_GET["name"]; 
    $duration = $_GET["duration"]; 
    $sql = "INSERT INTO crops (name,duration) VALUES ('$name','$duration')";
    echo $sql;
    if ($con->query($sql) === TRUE) {
        $last_id = $con->insert_id;
        echo $last_id;
    }
  }
?>