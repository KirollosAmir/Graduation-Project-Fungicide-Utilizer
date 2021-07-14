<?php
require_once('config.php');
 
  // If upload button is clicked ...
  if (isset($_GET['farmerid'])) {
    $farmerid = $_GET["farmerid"]; 
    $title = $_GET["title"]; 
    $crop = $_GET["crop"]; 
    $postalCode = $_GET["postalCode"]; 
    $station = $_GET["station"]; 
    $sql = "INSERT INTO lands (title,crop,postal_code) VALUES ('$title','$crop','$postalCode')";

    if ($con->query($sql) === TRUE) {
      $last_id = $con->insert_id;
      $sql1 = "INSERT INTO land_owners (farmer_id,land_id,station) VALUES ('$farmerid','$last_id','$station')";
            if ($con->query($sql1) === TRUE) { 
                echo $last_id;
            }
            else{ 
                echo "error";
            }
    }
            else{ 
                echo "error";
            }
  }
?>