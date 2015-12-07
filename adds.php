<?php
    require_once "connect.php";
	$ident_group = $_POST[ident_group];
	$sfull_name = $_POST[sfull_name];
	$privilege = $_POST[privilege];
	$sql1 ="SELECT MAX(Ident_St) as id FROM students";
	//$myrow = $db->query($sql1);
	foreach ($db->query($sql1) as $row) {
		$max = $row["id"]+1;
	}
	//$max=$myrow["id"] +1;
    $sql = "insert into students values ($max,$ident_group,'$sfull_name', '$privilege')";
	   $db->query("SET NAMES utf8");
    $rez = $db->query($sql);
?>