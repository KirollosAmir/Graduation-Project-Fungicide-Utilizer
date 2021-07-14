<!DOCTYPE html>
<html>
<head>
  <title></title>
</head>
<style type="text/css">
	body{
	background-image:url(wheat.jpg);
	background-repeat:no-repeat;
	background-size:cover;
	}
	</style>

    
<body>

<p style="color:#003366;font-size:4vw;  text-align:center; margin-top:3vw;"><b>Add Disease</b></p>
  <form style="margin-left:40vw;" method="POST" action="addCropDiseaseScript.php" enctype="multipart/form-data">
  <label style="margin-right:1vw;">Crop:</label><select name="crop" >
      <?php
      include 'config.php';
      $sql="SELECT id,name FROM crops";
        $query=mysqli_query($con,$sql);
        while($row=mysqli_fetch_array($query)){
          ?>
            
            <option value="<?php echo $row['id']; ?>">
            <?php echo $row['name'];  ?></option>

          <?php
        }
 
      ?>  
</select><br><br>
  <label style="margin-right:1vw;">Disease:</label><select name="disease" >
      <?php
      include 'config.php';
      $sql="SELECT id,disease_name FROM disease";
        $query=mysqli_query($con,$sql);
        while($row=mysqli_fetch_array($query)){
          ?>
            
            <option value="<?php echo $row['id']; ?>">
            <?php echo $row['disease_name'];  ?></option>

          <?php
        }
 
      ?>  
</select><br><br>
       
          <button type="submit" name="add" class="btn btn-danger"style="width:9vw;margin-left:8vw; font-size:1.5vw; text-align:center; ">Add</button>
  </form>


</body>
</html>