<?php

function display_welcome($userID){
 // printing a welcome message if the user submitted a name
 // through the HTML form
  print("Welcome, " . $userID);
}

function display_empty_form($visitStatus) {
   // if the user has visited this website before, print status message
  if ($visitStatus) {
   print(" &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ");
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

// main segment begins here
$user_name = isset($_POST['user_name']) ? $_POST['user_name'] : '';
$visited = isset($_POST['visited']) ? $_POST['visited'] : '';
print ("<br>");
if ($user_name) {
  display_welcome($user_name);
}
else {
  display_empty_form($visited);
}  
?>
