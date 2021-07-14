<?php
require_once('config.php');
 
  // If upload button is clicked ...
  if (isset($_GET['farmerid'])) {
    $farmerid = $_GET["farmerid"]; 
    $landid = $_GET["landid"]; 

    $sql = "Delete from land_owners where farmer_id='$farmerid' and land_id=$landid";

    if ($con->query($sql) === TRUE) {
      echo "Success";
    }
  }
?>