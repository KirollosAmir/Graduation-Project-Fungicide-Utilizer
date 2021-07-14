<?php
require_once('config.php');
 
  // If upload button is clicked ...
    // Get all the submitted data from the form
    $sql1 = "SELECT * from crops";
    // Execute query
    $result1 = mysqli_query($con, $sql1);
    $crops=array();
    while($row1 = mysqli_fetch_array($result1)){
      $sql2 = "SELECT disease_id, disease_name, severity, symptoms FROM crops_diseases, disease WHERE crops_diseases.crop_id='".$row1['id']."' and disease.id=crops_diseases.disease_id";
      $result2 = mysqli_query($con, $sql2);
      $diseases=array();
      while($row2 = mysqli_fetch_array($result2)){
        $sql3 = "SELECT id,dose,name,description FROM treatments,fungicides WHERE disease_id='".$row2['disease_id']."' and fungicide_id=id";
        $result3 = mysqli_query($con, $sql3);
        $treatments=array();
        while($row3 = mysqli_fetch_array($result3)){
          array_push($treatments, array("id" =>$row3['id'],"name" =>$row3['name'],"description" =>$row3['description'],"dose" =>$row3['dose']));
        }
        array_push($diseases, array("id" =>$row2['disease_id'],"name" =>$row2['disease_name'],"severity" =>$row2['severity'],"symptoms" =>$row2['symptoms'],"treatments" =>$treatments));
      }
      array_push($crops, array("id" =>$row1['id'],"name" =>$row1['name'],"duration" =>$row1['duration'],"diseases" =>$diseases));
    }
    echo json_encode($crops);
  
?>

