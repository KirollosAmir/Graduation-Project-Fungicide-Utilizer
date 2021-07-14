<?php
require_once('config.php');
 

    $cropid = $_GET["cropid"]; 
    $diseaseid = $_GET["diseaseid"]; 

    $sql = "DELETE FROM crops_diseases WHERE crop_id='$cropid' AND disease_id='$diseaseid' ";

    if ($con->query($sql) === TRUE) {
      header("Location: admin.php");
    }
  
?>