<?php
print 'Welcome to my website.<br>';
print 'I said to him "Welcome home"<br>';
print 'We\'ll now visit the next web site<br>';
$cost = 39.99;
$tax = $cost * 0.07;
printf('The cost is $%.2f and the tax is $%.2f<br>', $cost, $tax);
print strtolower('AbCdE') . '<br>';
print ucwords(strtolower('JOHN smith')) . '<br>';
print 'abc' . 'efg' . '<br>';
$email_address = "faculty@cis.fiu.edu";
print "send your email reply to $email_address" . '<br>';

$visited = isset($_POST['visited']) ? $_POST['visited'] : '';
if ($visited) {
   // if the user has visited this website before, print status message
   print (" &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ");
   print("<font color= 'red'>Please complete the name field</font>");
}
// printing the form to enter the user name since no name
// has been entered yet
print <<<FORM_HTML
<br>
<FORM method="post" action="{$_SERVER['PHP_SELF']}">
Enter your name: <input type="text" name="user_name">
<BR/>
<br>
<INPUT type="submit" value="Submit Name">
<INPUT type="hidden" name="visited" value="true">
</FORM>
FORM_HTML;
?>
