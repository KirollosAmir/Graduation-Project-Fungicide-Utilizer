<?php
require_once('config.php');
 

    $newsid = $_GET["id"]; 

    $sql = "DELETE FROM news WHERE id='$newsid'";

    if ($con->query($sql) === TRUE) {
      header("Location: admin.php");
    }
  
?>