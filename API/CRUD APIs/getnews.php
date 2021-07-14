<?php
require_once('config.php');
  // If upload button is clicked ...
  if (isset($_GET['id'])) {
 
    // Get all the submitted data from the form
    $sql = "SELECT * FROM news";
    
    // Execute query
    $result = mysqli_query($con, $sql);
    $news =array();
    

    if($result!= null){
        
        while($row = mysqli_fetch_array($result)){
          
          array_push($news, array("id" =>$row['id'],"date" =>$row['date'],"image" =>$row['image'],"title" =>$row['title'],"content" =>$row['content']));


        }
   }
    
    echo json_encode($news);
  
  }
?>
 
