<?php
require_once('config.php');
 

    $cropid = $_GET["id"]; 

    $sql = "DELETE FROM crops WHERE id='$cropid'";

    if ($con->query($sql) === TRUE) {
      header("Location: admin.php");
    }
  
?>