<?php
$uid = $_GET['uid'];
$cesta = 'saves/'.$uid.'.json';
$subor = @file_get_contents($cesta);
if(file_exists($cesta)){
echo $subor;
}else{
file_put_contents($cesta, "", LOCK_EX);
}

