<?php
require_once('config.php');
 
  if (isset($_GET['id'])) {
    $id = $_GET["id"]; 
 
    // Get all the submitted data from the form
    $sql = "SELECT id,title,crop,postal_code from lands,land_owners WHERE id=land_id and farmer_id = '".$id."'";
    // Execute query
    $result = mysqli_query($con, $sql);
    $lands=array();
    if($result!= null){
        while($row = mysqli_fetch_array($result)){
          $sql1 = "SELECT status.id, entry_date, maxTemp, minTemp, humidity, windSpeed from lands,status WHERE lands.id=land_id and land_id = '".$row['id']."' ORDER BY entry_date ASC";
    
          $result1 = mysqli_query($con, $sql1);
          $history=array();
          while($row1 = mysqli_fetch_array($result1)){
            array_push($history, array("id" =>$row1['id'],"entryDate" =>$row1['entry_date'],"maxTemp" =>$row1['maxTemp'],"minTemp" =>$row1['minTemp'],"humidity" =>$row1['humidity'],"windSpeed" =>$row1['windSpeed']));
            }
          array_push($lands, array("id" =>$row['id'],"title" =>$row['title'],"crop" =>$row['crop'],"postalCode" =>$row['postal_code'],"history" =>$history));
        }
   }
     
    echo json_encode($lands);
  
  }
?>
 
