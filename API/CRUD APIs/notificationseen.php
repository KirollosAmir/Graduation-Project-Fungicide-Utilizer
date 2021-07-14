<?php
require_once('config.php');
 
  // If upload button is clicked ...
  if (isset($_GET['id'])) {
    $id = $_GET["id"]; 

    $sql = "UPDATE notifications SET seen= '1' WHERE id=$id";

    if ($con->query($sql) === TRUE) {
      echo "Success";
    }
  }
?>