<?php
require_once('config.php');
 

    $fungicideid = $_GET["id"]; 

    $sql = "DELETE FROM fungicides WHERE id='$fungicideid'";

    if ($con->query($sql) === TRUE) {
      header("Location: admin.php");
    }
  
?>