<?php
# Illustrates a query with a browser input value
#  and returns a row of value using MySQL
print ("<br>");
$dbname = isset($_POST['dbname']) ? $_POST['dbname'] : '';
$inpssn = isset($_POST['inpssn']) ? $_POST['inpssn'] : '';
$visited = isset($_POST['visited']) ? $_POST['visited'] : '';
$dbnmmsg = '';
$inpssnmsg = '';
if (!($dbname && $inpssn )) {
  if ($visited) {	  
    if (! $dbname) {
       $dbnmmsg = 'Please enter [SQL Server] database name';
    }
    if (! $inpssn) {
       $inpssnmsg = 'Please enter SSN value for an employee';
    }
  }

 // printing the form to enter the user input
 print <<<_HTML_
 <FORM method="POST" action="{$_SERVER['PHP_SELF']}">
 <br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
 <font color= 'red'>$dbnmmsg</font><br>
 Database name: <input type="text" name="dbname" size="15" value="$dbname">
 <br/>
 <br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
 <font color= 'red'>$inpssnmsg</font><br>
 Employee SSN: <input type="text" name="inpssn" size="9" value="$inpssn">
 <br/>
 <br>
 <INPUT type="submit" value=" Submit ">
 <INPUT type="hidden" name="visited" value="true">
 </FORM>
_HTML_;
 
}
else {
  $host="localhost";
  $user="root";
  $password="";
  $con=mysqli_connect($host, $user, $password, $dbname);
  if (mysqli_connect_errno()) {
    echo "Failed to connect to MariaDB: " . mysqli_connect_error();
    exit;
  }

  print (" Successfully changed to " . $dbname . " database.<br>");

  $querystring = "SELECT fname FROM employee where ssn ='$inpssn'";
  $result = mysqli_query($con, $querystring);
  if (!$result) {
    print ( "Could not successfully run query ($querystring) from DB: " . mysqli_error($con) . "<br>");
    exit;
  }

  if (mysqli_num_rows($result) == 0) {
    print ("No rows found, nothing to print so am exiting<br>");
    exit;
  }

  print("Result:  ");
  if ( $obj = @mysqli_fetch_object($result) ) {
    // Login good, create session variables
    $firstname = $obj->fname;
    print(" Firstname is $firstname <br>");
  }
  else {
    // Query not successful
    die("Sorry, Query has some error.<br>");
  }
  mysqli_close($con);
}
?>
