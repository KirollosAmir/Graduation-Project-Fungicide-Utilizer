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

<p style="color:#003366;font-size:4vw;  text-align:center; margin-top:3vw;"><b>Add Expert</b></p>
  <form style="margin-left:40vw;" method="POST" action="addExpertScript.php" enctype="multipart/form-data">
  <label style="margin-right:1vw;">Name:</label><input type="text" name="name" value=""><br><br>
  <label style="margin-right:1vw;">Job Title:</label><input type="text" name="job" value=""><br><br>
  <label style="margin-right:1vw;">Organization:</label><input type="text" name="organization" value=""><br><br>
  <label style="margin-right:1vw;">Mobile:</label><input type="text" name="mobile" value=""><br><br>
  <label style="margin-right:1vw;">Password:</label><input type="password" name="password" value=""><br><br>
       
          <button type="submit" name="add" class="btn btn-danger"style="width:9vw;margin-left:8vw; font-size:1.5vw; text-align:center; ">Add</button>
  </form>


</body>
</html>