<?php
require_once('config.php');
  // If upload button is clicked ...
  if (isset($_GET['farmerid'])) {
    $id = $_GET["farmerid"]; 
 
    // Get all the submitted data from the form
    $sql = "SELECT id,date,message,seen from notifications WHERE user_id = '".$id."'ORDER BY date DESC";
    // Execute query
    $result = mysqli_query($con, $sql);
    $notifications =array();
    if($result!= null){
        while($row = mysqli_fetch_array($result)){
    
          array_push($notifications, array("id" =>$row['id'],"date" =>$row['date'],"message" =>$row['message'],"seen" =>$row['seen']));
        }
   }
     
    echo json_encode($notifications);
  
  }
?>
 
