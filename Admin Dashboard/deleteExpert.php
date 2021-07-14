<?php
require_once('config.php');
 

    $expertid = $_GET["id"]; 

    $sql = "DELETE FROM experts WHERE id='$expertid'";

    if ($con->query($sql) === TRUE) {
      header("Location: admin.php");
    }
  
?>