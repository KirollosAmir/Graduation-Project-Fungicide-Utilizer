<?php

include 'config.php';
print_r($_FILES);
if(isset($_POST['add'])&& isset($_FILES['image'])){ //check if login button is pressed

    $img=base64_encode(file_get_contents( $_FILES["image"]["tmp_name"] ));

    $date=date("Y-m-d");
    $sql = "INSERT INTO news(date,image,title,content) VALUES ('".$date."','".$img."','".$_POST['title']."','".$_POST['content']."')";

 
     if ($con->query($sql) === TRUE) {
        //header("Location:admin.php");
        }}
        
        else {
    echo "File not sent to server succesfully!";
}
       
      



?>