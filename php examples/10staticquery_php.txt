<?php
# Illustrates a query with static values
#  and returns a row of value using MySQL

print ("<br>");

  $host = "localhost";
  $user = "root";
  $password = "";
  $dbname = "company";
  $con=mysqli_connect($host, $user, $password, $dbname);
  if (mysqli_connect_errno()) {
    echo "Failed to connect to MariaDB: " . mysqli_connect_error();
    exit;
  }

  print (" Successfully changed to " . $dbname . " database.<br>");

  $querystring = "SELECT fname FROM employee where ssn ='123456789'";
  $result = mysqli_query($con, $querystring);
  if (!$result) {
    print ( "Could not successfully run query ($querystring) from DB: " . mysqli_error($con));
    exit;
  }

  if (mysqli_num_rows($result) == 0) {
    print ("No rows found, nothing to print so am exiting<br>");
    exit;
  }

  print("Result: ");
  if ( $obj = @mysqli_fetch_object($result) ) {
    // output the query result
    $firstname = $obj->fname;
    print(" Firstname is $firstname");
  }
  else {
    // Query not successful
    die("Sorry, Query has some error.");
  }
?>
