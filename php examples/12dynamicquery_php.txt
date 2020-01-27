<?php
# Illustrates a query with a browser input value
#  and returns a row of value using MySQL
print ("<br>");
$inpssn = isset($_POST['inpssn']) ? $_POST['inpssn'] : '';
$visited = isset($_POST['visited']) ? $_POST['visited'] : '';
$inpssnmsg = '';
if (!($inpssn )) {
  if ($visited) {	  
    if (! $inpssn) {
       $inpssnmsg = 'Please enter SSN value for an employee';
    }
  }

 // printing the form to enter the user input
 print <<<_HTML_
 <FORM method="POST" action="{$_SERVER['PHP_SELF']}">
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
  require('./dbconfig.php');
  $querystring = "SELECT fname FROM employee where ssn ='$inpssn'";
  $result = mysqli_query($con, $querystring);
  if (!$result) {
    print ( "Could not successfully run query ($querystring) from DB: " . mysql_error() . "<br>");
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
