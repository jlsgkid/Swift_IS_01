<?php
if(isset($_GET['params'])){
$params=$_GET['params']; 
#echo $params;
}else{
$apiId=$_GET['apiId'];
$deviceId=$_GET['deviceId'];
$loginId=$_GET['loginId'];
$password=$_GET['password'];
#echo $apiId;
#echo $deviceId;
#echo $loginId;
#echo $password;
}

echo  '{"status":0,"token":"6VBwmYjcZhjYrPafhBMz"}';

?>

