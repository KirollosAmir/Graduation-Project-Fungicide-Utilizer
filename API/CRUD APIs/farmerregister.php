<?php
require_once('config.php');
 
  // If upload button is clicked ...
  if (isset($_GET['mobile'])) { 
    $name = $_GET["name"];
    $mobile = $_GET["mobile"];
    $password = $_GET["password"]; 
    $sql = "INSERT INTO farmers (name,mobile,password) VALUES ('$name','$mobile','$password')";
    
    $sql1 = "select mobile from farmers where mobile = '$mobile'";
    $result1 = mysqli_query($con,$sql1);
    $row = mysqli_fetch_array($result) ;
    if($row['mobile'] ==$_GET['mobile']){
        echo "taken";
    }
    else {
    if ($con->query($sql) === TRUE) {
        echo "success";
    }
  }
      
  }
?>