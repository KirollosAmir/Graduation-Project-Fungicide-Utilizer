<?php
require_once('config.php');
 
      $sql2 = "SELECT * FROM disease";
      $result2 = mysqli_query($con, $sql2);
      $diseases=array();
      while($row2 = mysqli_fetch_array($result2)){
        $sql3 = "SELECT id,dose,name,description FROM treatments,fungicides WHERE disease_id='".$row2['id']."' and fungicide_id=id";
        $result3 = mysqli_query($con, $sql3);
        $treatments=array();
        while($row3 = mysqli_fetch_array($result3)){
          array_push($treatments, array("id" =>$row3['id'],"name" =>$row3['name'],"description" =>$row3['description'],"dose" =>$row3['dose']));
        }
        array_push($diseases, array("id" =>$row2['id'],"name" =>$row2['disease_name'],"severity" =>$row2['severity'],"symptoms" =>$row2['symptoms'],"treatments" =>$treatments));
      }

    echo json_encode($diseases);
  
?>

