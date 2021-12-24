<?php
$array = [];
for($i = 0; $i < 10; $i++) {
	exec("echo " . 10-$i, $array);
	echo $array[$i] . "<br />";
}
?>