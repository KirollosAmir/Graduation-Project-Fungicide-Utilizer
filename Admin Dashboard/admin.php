<?php
include 'config.php';
?>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<link rel="icon" type="image/ico" href="img2.png"  />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
	body{
	background-image:url(wheat.jpg);
	background-repeat:no-repeat;
	background-size:cover;
	}

	* {
	  box-sizing: border-box;
	}

	.sidenav{
		position: relative;
	  	width: 20%;
	  	height: 100%;
	  	padding-top: 5%;
  		background-color: black;
  		float: left;

	}
	.sidenav a {
	  
	  color: #818181;;
	  font: 120% bold;
	  padding-left: 10%;

	}
	.sidenav a:hover {
	  color: #f1f1f1;

	}


	.profile_picture{

		border-radius: 50%;
		width: 50%;
		position: relative;
	    left: 25%;
	}
	.sidenav h1{
	  
	  color: white;
	  font: 150% bold;
	  text-align: center;;
	}

	.rectangle{
	  background: rgba(255, 255, 255,1);
	  position: absolute;
	  left: 5%;
	  top: 5%;
	  width: 90%;
	  height: 90%;	
	  
	}

</style>
<body>

	<div class="rectangle">
	 <div class="sidenav">
	  <br>
	  <a onclick="SHowFarmer()">Farmers</a>
	  <br><br>
	  <a  onclick="SHowExpert()">Experts</a>
	  <br><br>
	  <a onclick="SHowCrop()">Crops</a>
	  <br><br>
	  <a  onclick="SHowDisease()">Disease</a>
	  <br><br>
	  <a  onclick="SHowCropDisease()">Crops Diseases</a>
	  <br><br>
	  <a  onclick="SHowFungicides()">Fungicides</a>
	  <br><br>
	  <a  onclick="SHowTreatment()">Treatments</a>
	  <br><br>
	  <a  onclick="SHowLands()">Lands</a>
	  <br><br>
	  <a  onclick="SHowNews()">News</a>
	  <br><br>
	  
	  <a href="login.php">Log Out   <span class="glyphicon glyphicon-log-out" ></span></a> 
	  
	  </div>
        
<body>
	  <script>
		    $(document).ready(function(){
		        SHowFarmer();
		    });
	  </script>
	  <script>

		function  SHowFarmer(){

			document.getElementById("Farmer").style.display = "block";
			document.getElementById("Expert").style.display = "none";
			document.getElementById("Crop").style.display = "none";
			document.getElementById("Disease").style.display = "none";
			document.getElementById("CropDisease").style.display = "none";
			document.getElementById("Fungicide").style.display = "none";
			document.getElementById("Treatment").style.display = "none";
			document.getElementById("Land").style.display = "none";
			document.getElementById("News").style.display = "none";
		}
		function  SHowExpert(){

			document.getElementById("Farmer").style.display = "none";
			document.getElementById("Expert").style.display = "block";
			document.getElementById("Crop").style.display = "none";
			document.getElementById("Disease").style.display = "none";
			document.getElementById("CropDisease").style.display = "none";
			document.getElementById("Fungicide").style.display = "none";
			document.getElementById("Treatment").style.display = "none";
			document.getElementById("Land").style.display = "none";
			document.getElementById("News").style.display = "none";
		}
		function  SHowCrop(){

			document.getElementById("Farmer").style.display = "none";
			document.getElementById("Expert").style.display = "none";
			document.getElementById("Crop").style.display = "block";
			document.getElementById("Disease").style.display = "none";
			document.getElementById("CropDisease").style.display = "none";
			document.getElementById("Fungicide").style.display = "none";
			document.getElementById("Treatment").style.display = "none";
			document.getElementById("Land").style.display = "none";
			document.getElementById("News").style.display = "none";
		}
		function  SHowDisease(){

			document.getElementById("Farmer").style.display = "none";
			document.getElementById("Expert").style.display = "none";
			document.getElementById("Crop").style.display = "none";
			document.getElementById("Disease").style.display = "block";
			document.getElementById("CropDisease").style.display = "none";
			document.getElementById("Fungicide").style.display = "none";
			document.getElementById("Treatment").style.display = "none";
			document.getElementById("Land").style.display = "none";
			document.getElementById("News").style.display = "none";
		}
		function  SHowCropDisease(){

			document.getElementById("Farmer").style.display = "none";
			document.getElementById("Expert").style.display = "none";
			document.getElementById("Crop").style.display = "none";
			document.getElementById("Disease").style.display = "none";
			document.getElementById("CropDisease").style.display = "block";
			document.getElementById("Fungicide").style.display = "none";
			document.getElementById("Treatment").style.display = "none";
			document.getElementById("Land").style.display = "none";
			document.getElementById("News").style.display = "none";
		}
		function  SHowFungicides(){

			document.getElementById("Farmer").style.display = "none";
			document.getElementById("Expert").style.display = "none";
			document.getElementById("Crop").style.display = "none";
			document.getElementById("Disease").style.display = "none";
			document.getElementById("CropDisease").style.display = "none";
			document.getElementById("CropDisease").style.display = "none";
			document.getElementById("Fungicide").style.display = "block";
			document.getElementById("Treatment").style.display = "none";
			document.getElementById("Land").style.display = "none";
			document.getElementById("News").style.display = "none";
		}
		function  SHowTreatment(){

			document.getElementById("Farmer").style.display = "none";
			document.getElementById("Expert").style.display = "none";
			document.getElementById("Crop").style.display = "none";
			document.getElementById("Disease").style.display = "none";
			document.getElementById("CropDisease").style.display = "none";
			document.getElementById("Fungicide").style.display = "none";
			document.getElementById("Treatment").style.display = "block";
			document.getElementById("Land").style.display = "none";
			document.getElementById("News").style.display = "none";
		}
		function  SHowLands(){

			document.getElementById("Farmer").style.display = "none";
			document.getElementById("Expert").style.display = "none";
			document.getElementById("Crop").style.display = "none";
			document.getElementById("Disease").style.display = "none";
			document.getElementById("CropDisease").style.display = "none";
			document.getElementById("Fungicide").style.display = "none";
			document.getElementById("Treatment").style.display = "none";
			document.getElementById("Land").style.display = "block";
			document.getElementById("News").style.display = "none";
		}
		function  SHowNews(){

			document.getElementById("Farmer").style.display = "none";
			document.getElementById("Expert").style.display = "none";
			document.getElementById("Crop").style.display = "none";
			document.getElementById("Disease").style.display = "none";
			document.getElementById("CropDisease").style.display = "none";
			document.getElementById("Fungicide").style.display = "none";
			document.getElementById("Treatment").style.display = "none";
			document.getElementById("Land").style.display = "none";
			document.getElementById("News").style.display = "block";
		}

	   </script>

	  <div class="DataTable" style="overflow:auto;padding-top:1%;" id="Farmer"> <!-- Farmers block -->
					<table class="table table-striped table-hover">
					<span class="pull-right" style="padding-right:5vw;"><a href="addFarmer.php" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> Add Farmer</a></span>
			<thead >
		 <tr>
			<th>ID</th>
			<th>Name</th>
			<th>Mobile</th>
			<th>Action</th>
		</thead> 
    <tbody>

     <?php

$sql = "select id,name , mobile from farmers";
$records = mysqli_query($con, $sql);
if (!$records) {
    printf("Error: %s\n", mysqli_error($con));
    exit();
}

while($row = mysqli_fetch_array($records)){
	echo "<tr>";
	 echo "<td>".$row['id']."</td>";
	 echo "<td>".$row['name']."</td>";
	 echo "<td>".$row['mobile']."</td>";
     echo '<td><a href=deleteFarmer.php?id=' .$row['id'].' class= "btn btn-danger"><span
     class="glyphicon glyphicon-remove"></span>Delete</a></td>';
     echo "</tr>";   
}

?>
			</tbody>
		</table>
	</div>

	  <div class="DataTable" style="overflow:auto;padding-top:1%;" id="Expert"> <!-- Experts block -->
					<table class="table table-striped table-hover">
					<span class="pull-right" style="padding-right:5vw;"><a href="addExpert.php" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> Add Expert</a></span>
			<thead >
		 <tr>
			<th>ID</th>
			<th>Name</th>
			<th>Mobile</th>
			<th>Title</th>
			<th>Organization</th>
			<th>Action</th>
		</thead> 
    <tbody>

     <?php

$sql = "select id,name , mobile,job_title,organization from experts";
$records = mysqli_query($con, $sql);

while($row = mysqli_fetch_array($records)){
	echo "<tr>";
	 echo "<td>".$row['id']."</td>";
	 echo "<td>".$row['name']."</td>";
	 echo "<td>".$row['mobile']."</td>";
	 echo "<td>".$row['job_title']."</td>";
	 echo "<td>".$row['organization']."</td>";
     echo '<td><a href=deleteExpert.php?id=' .$row['id'].' class= "btn btn-danger"><span
     class="glyphicon glyphicon-remove"></span>Delete</a></td>';
     echo "</tr>";   
}

?>
			</tbody>
		</table>
	</div>
	
	  <div class="DataTable" style="overflow:auto;padding-top:1%;" id="Crop"> <!-- Crops block -->
					<table class="table table-striped table-hover">
					<span class="pull-right" style="padding-right:5vw;"><a href="addCrop.php" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> Add Crop</a></span>
			<thead >
		 <tr>
			<th>ID</th>
			<th>Name</th>
			<th>Duration</th>
			<th>Action</th>
		</thead> 
    <tbody>

     <?php

$sql = "select id,name , duration from crops";
$records = mysqli_query($con, $sql);

while($row = mysqli_fetch_array($records)){
	echo "<tr>";
	 echo "<td>".$row['id']."</td>";
	 echo "<td>".$row['name']."</td>";
	 echo "<td>".$row['duration']."</td>";
     echo '<td><a href=deleteCrop.php?id=' .$row['id'].' class= "btn btn-danger"><span
     class="glyphicon glyphicon-remove"></span>Delete</a></td>';
     echo "</tr>";   
}

?>
			</tbody>
		</table>
	</div>
	
	  <div class="DataTable" style="overflow:auto;padding-top:1%;" id="Disease"> <!-- Diseases block -->
					<table class="table table-striped table-hover">
					<span class="pull-right" style="padding-right:5vw;"><a href="addDisease.php" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> Add Disease</a></span>
			<thead >
		 <tr>
			<th>ID</th>
			<th>Name</th>
			<th>severity</th>
			<th>symptoms</th>
			<th>Action</th>
		</thead> 
    <tbody>

     <?php

$sql = "select id,disease_name , severity,symptoms from disease";
$records = mysqli_query($con, $sql);

while($row = mysqli_fetch_array($records)){
	echo "<tr>";
	 echo "<td>".$row['id']."</td>";
	 echo "<td>".$row['disease_name']."</td>";
	 echo "<td>".$row['severity']."</td>";
	 echo "<td>".$row['symptoms']."</td>";
     echo '<td><a href=deleteDisease.php?id=' .$row['id'].' class= "btn btn-danger"><span
     class="glyphicon glyphicon-remove"></span>Delete</a></td>';
     echo "</tr>";   
}

?>
			</tbody>
		</table>
	</div>
	
	<div class="DataTable" style="overflow:auto;padding-top:1%;" id="CropDisease"> <!-- Crops Diseases block -->
					<table class="table table-striped table-hover">
					<span class="pull-right" style="padding-right:5vw;"><a href="addCropDisease.php" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> Add Crop Disease</a></span>
			<thead >
		 <tr>
			<th>Crop</th>
			<th>Disease</th>
			<th>Action</th>
		</thead> 
    <tbody>

     <?php

$sql = "SELECT crops.name,crops_diseases.crop_id,crops_diseases.disease_id,disease.disease_name FROM crops,crops_diseases,disease WHERE crops.id=crops_diseases.crop_id AND disease.id=crops_diseases.disease_id";
$records = mysqli_query($con, $sql);

while($row = mysqli_fetch_array($records)){
	echo "<tr>";
	 echo "<td>".$row['name']."</td>";
	 echo "<td>".$row['disease_name']."</td>";
     echo '<td><a href=deleteCropDisease.php?cropid='.$row['crop_id'].'&diseaseid='.$row['disease_id'].' class= "btn btn-danger"><span
     class="glyphicon glyphicon-remove"></span>Delete</a></td>';
     echo "</tr>";   
}

?>
			</tbody>
		</table>
	</div>

	<div class="DataTable" style="overflow:auto;padding-top:1%;" id="Fungicide"> <!-- Fungicides block -->
					<table class="table table-striped table-hover">
					<span class="pull-right" style="padding-right:5vw;"><a href="addFungicide.php" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> Add Fungicide</a></span>
			<thead >
		 <tr>
			<th>ID</th>
			<th>Name</th>
			<th>Description</th>
			<th>Action</th>
		</thead> 
    <tbody>

     <?php

$sql = "SELECT * FROM fungicides";
$records = mysqli_query($con, $sql);

while($row = mysqli_fetch_array($records)){
	echo "<tr>";
	 echo "<td>".$row['id']."</td>";
	 echo "<td>".$row['name']."</td>";
	 echo "<td>".$row['description']."</td>";
     echo '<td><a href=deleteFungicide.php?id=' .$row['id'].' class= "btn btn-danger"><span
     class="glyphicon glyphicon-remove"></span>Delete</a></td>';
     echo "</tr>";   
}

?>
			</tbody>
		</table>
	</div>
	  <div class="DataTable" style="overflow:auto;padding-top:1%;" id="Treatment"> <!-- Treatments block -->
					<table class="table table-striped table-hover">
					<span class="pull-right" style="padding-right:5vw;"><a href="addTreatment.php" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> Add Treatment</a></span>
			<thead >
		 <tr>
			<th>Disease</th>
			<th>Fungicide</th>
			<th>Dose</th>
			<th>Action</th>
		</thead> 
    <tbody>

     <?php

$sql = "SELECT fungicides.name,disease.disease_name,dose,disease_id,fungicide_id FROM fungicides,disease,treatments WHERE treatments.disease_id=disease.id AND treatments.fungicide_id=fungicides.id";
$records = mysqli_query($con, $sql);

while($row = mysqli_fetch_array($records)){
	echo "<tr>";
	 echo "<td>".$row['disease_name']."</td>";
	 echo "<td>".$row['name']."</td>";
	 echo "<td>".$row['dose']."</td>";
     echo '<td><a href=deleteTreatment.php?fungicide_id=' .$row['fungicide_id'].'&disease_id=' .$row['disease_id'].' class= "btn btn-danger"><span
     class="glyphicon glyphicon-remove"></span>Delete</a></td>';
     echo "</tr>";   
}

?>
			</tbody>
		</table>
	</div>
	
	  <div class="DataTable" style="overflow:auto;padding-top:1%;" id="Land"> <!-- Lands block -->
					<table class="table table-striped table-hover">
					<span class="pull-right" style="padding-right:5vw;"><a href="addLand.php" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> Add Land</a></span>
			<thead >
		 <tr>
			<th>ID</th>
			<th>farmer ID</th>
			<th>Title</th>
			<th>Crop</th>
			<th>Postal Code</th>
			<th>Station</th>
			<th>Action</th>
		</thead> 
    <tbody>

     <?php

$sql = "SELECT * FROM lands,land_owners WHERE lands.id=land_owners.land_id";
$records = mysqli_query($con, $sql);

while($row = mysqli_fetch_array($records)){
	echo "<tr>";
	 echo "<td>".$row['id']."</td>";
	 echo "<td>".$row['farmer_id']."</td>";
	 echo "<td>".$row['title']."</td>";
	 echo "<td>".$row['crop']."</td>";
	 echo "<td>".$row['postal_code']."</td>";
	 echo "<td>".$row['station']."</td>";
     echo '<td><a href=deleteLand.php?id=' .$row['id'].' class= "btn btn-danger"><span
     class="glyphicon glyphicon-remove"></span>Delete</a></td>';
     echo "</tr>";   
}

?>
			</tbody>
		</table>
	</div>
	
	  <div class="DataTable" style="overflow:auto;padding-top:1%;" id="News"> <!-- News block -->
					<table class="table table-striped table-hover">
					<span class="pull-right" style="padding-right:5vw;"><a href="addNews.php" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> Add News</a></span>
			<thead >
		 <tr>
			<th>ID</th>
			<th>Date</th>
			<th>Title</th>
			<th>Content</th>
			<th>Action</th>
		</thead> 
    <tbody>

     <?php

$sql = "SELECT id, date,title,content FROM news";
$records = mysqli_query($con, $sql);

while($row = mysqli_fetch_array($records)){
	echo "<tr>";
	 echo "<td>".$row['id']."</td>";
	 echo "<td>".$row['date']."</td>";
	 echo "<td>".$row['title']."</td>";
	 echo "<td>".$row['content']."</td>";
     echo '<td><a href=deleteNews.php?id=' .$row['id'].' class= "btn btn-danger"><span
     class="glyphicon glyphicon-remove"></span>Delete</a></td>';
     echo "</tr>";   
}

?>
			</tbody>
		</table>
	</div>
    </div>
  </div>
</div>
</body>
</html>