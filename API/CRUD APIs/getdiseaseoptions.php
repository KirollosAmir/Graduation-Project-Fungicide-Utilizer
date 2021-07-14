<?php
require_once('config.php');
 
  if (isset($_GET['id'])) {
    $id = $_GET["id"]; 
 
    // Get all the submitted data from the form
    $sql = "SELECT disease_name,id FROM disease WHERE id NOT IN (SELECT disease_id FROM crops_diseases WHERE crop_id = '".$id."')";
    // Execute query
    $result = mysqli_query($con, $sql);
    $diseases=array();
    if($result!= null){
        while($row = mysqli_fetch_array($result)){
          array_push($diseases, array("id" =>$row['id'],"name" =>$row['disease_name']));
        }
   }
     
    echo json_encode($diseases);
  
  }
?>
 
