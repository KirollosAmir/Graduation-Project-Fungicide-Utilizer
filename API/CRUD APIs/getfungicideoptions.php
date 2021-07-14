<?php
require_once('config.php');
 
  if (isset($_GET['id'])) {
    $id = $_GET["id"]; 
 
    // Get all the submitted data from the form
    $sql = "SELECT name,id FROM fungicides WHERE id NOT IN (SELECT fungicide_id FROM treatments WHERE disease_id = '".$id."')";
    // Execute query
    $result = mysqli_query($con, $sql);
    $fungicides=array();
    if($result!= null){
        while($row = mysqli_fetch_array($result)){
          array_push($fungicides, array("id" =>$row['id'],"name" =>$row['name']));
        }
   }
     
    echo json_encode($fungicides);
  
  }
?>
 
