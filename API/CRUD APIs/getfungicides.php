<?php
require_once('config.php');
 
        $sql3 = "SELECT * FROM fungicides";
        $result3 = mysqli_query($con, $sql3);
        $treatments=array();
        while($row3 = mysqli_fetch_array($result3)){
          array_push($treatments, array("id" =>$row3['id'],"name" =>$row3['name'],"description" =>$row3['description']));
        }

    echo json_encode($treatments);
  
?>

