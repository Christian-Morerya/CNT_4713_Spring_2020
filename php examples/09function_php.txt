<?php
# php runtime errors can be seen at http://dev.cis.fiu.edu/....
function course_instructor($course, $teaching_assignments) {
  if (array_key_exists($course, $teaching_assignments)) {
    $instructor = $teaching_assignments[$course];
    RETURN "{$instructor} is teaching {$course}";
  }  #testing
  else {
    RETURN "There is no {$course} course";
  }
}

# Hash (i.e. associative array)
$teaching = array('Database' => 'Chen',
  'OS' => 'Osorio', 'Graphics' =>'Berk');
$teaching['Graphics'] = 'Zeng';
$teaching['Data Mining'] = 'Li';
$x = course_instructor('Database', $teaching);
print($x . "<br>");
$x = course_instructor('Computer Architecture', $teaching);
print($x . "<br>");
?>
