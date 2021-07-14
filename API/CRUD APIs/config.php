<?php

$host = "localhost"; /* Host name */
$user = "id16989450_root"; /* User */
$password = "M+uH8%M_S/Ua}o$1"; /* Password */
$dbname = "id16989450_fungicides_utilizer"; /* Database name */

$con = mysqli_connect($host, $user, $password,$dbname);
// Check connection

if (!$con) {
  die("Connection failed: " . mysqli_connect_error());
}