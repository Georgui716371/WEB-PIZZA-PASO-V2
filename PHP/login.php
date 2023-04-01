<?php

if(!empty($_POST)){
	if(isset($_POST["username"]) &&isset($_POST["password"])){
		if($_POST["username"]!=""&&$_POST["password"]!=""){

			include "con_db.php";
			
			$user_id=null;
			$sql1= "select * from user where  email=\"$_POST[username]\" and password=\"$_POST[password]\" ";
		
			$query = $con->query($sql1);
			while ($r=$query->fetch_array()) {
				$user_id=$r["IdUsuario"];
				$user_name=$r["UserName"];
				$user_email = $r["email"];
				break;
			}
			if($user_id==null){
				print "<script>alert(\"Email o Usuario Incorrectos.\");window.location='../login.php';</script>";
			}else{
				session_start();
				$_SESSION["email"]=$user_email;
 
				print "<script> window.location='../index.php';</script>";
			}
		}
	}
}
?>