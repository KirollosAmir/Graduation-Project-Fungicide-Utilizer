<?php
require_once('config.php');
 
  if (isset($_GET['station'])) {
    $station = $_GET["station"]; 
    $maxTemp = $_GET["maxTemp"]; 
    $minTemp = $_GET["minTemp"]; 
    $humidity = $_GET["humidity"]; 
    $windSpeed = $_GET["windSpeed"]; 
    $sql = "SELECT land_id FROM land_owners WHERE station = $station";
    if ($con->query($sql) === TRUE) {
        $last_id = $con->insert_id;
        echo $last_id;
            
    }
  }
?>