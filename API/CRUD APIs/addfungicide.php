<?php
require_once('config.php');
 
  if (isset($_GET['expertid'])) {
    $name = $_GET["name"]; 
    $description = $_GET["description"]; 
    $sql = "INSERT INTO fungicides (name,description) VALUES ('$name','$description')";
    if ($con->query($sql) === TRUE) {
        $last_id = $con->insert_id;
        echo $last_id;
            
    }
  }
?>