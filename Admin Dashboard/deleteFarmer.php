<?php
require_once('config.php');
 

    $farmerid = $_GET["id"]; 

    $sql = "DELETE FROM farmers WHERE id='$farmerid'";

    if ($con->query($sql) === TRUE) {
      header("Location: admin.php");
    }
  
?>