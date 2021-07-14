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

<p style="color:#003366;font-size:4vw;  text-align:center; margin-top:3vw;"><b>Add News</b></p>
  <form enctype="multipart/form-data" style="margin-left:40vw;" method="POST" action="addNewsScript.php" >
  <label style="margin-right:1vw;">Title:</label><input type="text" name="title" value=""><br><br>
  <label style="margin-right:1vw;">Content:</label><input type="text" name="content" value=""><br><br>
  <label style="margin-right:1vw;">Image:</label><input type="file" name="image" id="image" value=""><br><br>
       
          <button type="submit" name="add" class="btn btn-danger"style="width:9vw;margin-left:8vw; font-size:1.5vw; text-align:center; ">Add</button>
  </form>


</body>
</html>