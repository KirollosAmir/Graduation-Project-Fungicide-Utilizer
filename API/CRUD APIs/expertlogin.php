<?php
require_once('config.php');
 
  if (isset($_GET['mobile'])) {
    $mobile = $_GET["mobile"]; 
    $password = $_GET["password"]; 
    $sql = "select id,mobile,password from experts where mobile = '$mobile'";
    $result = mysqli_query($con,$sql);
    $row = mysqli_fetch_array($result) ;
    if ($row['mobile'] == $_GET['mobile'] && $row['password'] == $_GET['password']) {
        echo $row['id'];
    }
    else{
        echo "Failed";
    
    }
  }
?>