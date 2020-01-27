<?php
 // printing a welcome message if the user submitted a name
 // through the HTML form
print ("<br>");
$user_name = isset($_POST['user_name']) ? $_POST['user_name'] : '';
$visited = isset($_POST['visited']) ? $_POST['visited'] : '';
if ($user_name) {
  print("Welcome, ");
  print($user_name);
}
else {
  if ($visited) {
   // if the user has visited this website before, print status message
   print (" &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ");
   print("<font color= 'red'>Please complete the name field</font><br>");
  }
 // printing the form to enter the user name since no name
 // has been entered yet
 print <<<_HTML_
 <FORM method="post" action="{$_SERVER['PHP_SELF']}">
 Enter your name: <input type="text" name="user_name">
 <BR/>
 <br>
 <INPUT type="submit" value="Submit Name">
 <INPUT type="hidden" name="visited" value="true">
 </FORM>
_HTML_;
}
?>
