<?php
	$time = time();
	$date = date(('d F Y G-i-s'), $time);
	$text = "Working at ".$date;
	$fp = fopen("TEMP_CRON\\".$date.".txt", "w");
	fwrite($fp, $text);
	fclose($fp);
?>