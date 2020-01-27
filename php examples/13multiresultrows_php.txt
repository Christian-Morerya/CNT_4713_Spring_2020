<?php
# Illustrates a query with a browser input value
#  and returns several rows of values using MySQL
print ("<br>");
$inpdno = isset($_POST['inpdno']) ? $_POST['inpdno'] : '';
$visited = isset($_POST['visited']) ? $_POST['visited'] : '';
$inpdnomsg = '';

if (!($inpdno )) {
  if ($visited) {	  
     $inpdnomsg = 'Please enter a department number value';
  }

 // printing the form to enter the user input
 print <<<_HTML_
 <FORM method="POST" action="{$_SERVER['PHP_SELF']}">
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
 <font color= 'red'>$inpdnomsg</font><br>
 Department Number: <input type="text" name="inpdno" size="9" value="$inpdno">
 <br/>
 <br>
 <INPUT type="submit" value=" Submit ">
 <INPUT type="hidden" name="visited" value="true">
 </FORM>
_HTML_;
 
}
else {
  require ('./dbConfig.php');
  $querystring = "SELECT fname, lname, dno FROM employee where dno = $inpdno";
  $result = mysqli_query($con, $querystring);
  if (!$result) {
    print ( "Could not successfully run query ($querystring) from DB: " . mysqli_error($con) . "<br>");
    exit;
  }

  if (mysqli_num_rows($result) == 0) {
    print ("No rows found, nothing to print so am exiting<br>");
    exit;
  }

  print("Results: <br>");
  while ($rows = mysqli_fetch_assoc($result)) {
    foreach ($rows as $row) {
	  print $row." ";
	}
	print "<br>";
  }
  mysqli_close($con);
}
?>
