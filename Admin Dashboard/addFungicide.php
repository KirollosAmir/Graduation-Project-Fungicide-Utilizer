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
  <form style="margin-left:40vw;" method="POST" action="addFungicideScript.php" enctype="multipart/form-data">
  <label style="margin-right:1vw;">Name:</label><input type="text" name="name" value=""><br><br>
  <label style="margin-right:1vw;">Description:</label><input type="text" name="description" value=""><br><br>
       
          <button type="submit" name="add" class="btn btn-danger"style="width:9vw;margin-left:8vw; font-size:1.5vw; text-align:center; ">Add</button>
  </form>


</body>
</html>