<?php
require_once('config.php');
 

    $diseaseid = $_GET["id"]; 

    $sql = "DELETE FROM disease WHERE id='$diseaseid'";

    if ($con->query($sql) === TRUE) {
      header("Location: admin.php");
    }
  
?>