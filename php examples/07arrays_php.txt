<?php
# one-dimensional array 
$courses = array('Database', 'OS', 'Graphics', 'Data Mining');
$alt_row_color = array('cyan', 'yellow');
print "<TABLE cellspacing=0 cellpadding=0 border=0>";
for ($i = 0, $num = count($courses); $i < $num; $i++) {
  print '<TR bgcolor="' . $alt_row_color[$i % 2] . '">';
  print "<TD>Course $i is &nbsp; </TD><TD>{$courses[$i]}</TD></TR>\n";
}
print "</TABLE>";

# Hash (i.e. associative array)
$teaching = array('Database' => 'Chen',
  'OS' => 'Wei', 'Graphics' =>'Berk');
$teaching['Graphics'] = 'Zeng';
$teaching['Data Mining'] = 'Li';
ksort($teaching);
print "<br>Teaching roster:<br>";
print "<TABLE cellspacing=0 cellpadding=0 border=0>";
$i = 0;
foreach ($teaching as $key => $value) {
# print " $key : $value <br>"; }
  print '<TR bgcolor="' . $alt_row_color[$i % 2] . '">';
  print "<TD>$key</TD><TD> &nbsp; $value</TD></TR>\n";
  $i++;
}
print "</TABLE>";
?>
