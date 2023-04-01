<?php
session_start();
if (!isset($_SESSION["email"])) {
     $_SESSION["email"] = "";
}
include("PHP/con_db.php");
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'PHPMailer/Exception.php';
require 'PHPMailer/PHPMailer.php';
require 'PHPMailer/SMTP.php';

$nombre = $_POST['nombre'];
$comensales = $_POST['comensales'];
$numero = $_POST['numero'];
$fecha = $_POST['fecha'];

$mail = new PHPMailer(true);

try {
     //Server settings
     $mail->SMTPDebug = 0; //Enable verbose debug output
     $mail->isSMTP(); //Send using SMTP
     $mail->Host = 'smtp.gmail.com'; //Set the SMTP server to send through
     $mail->SMTPAuth = true; //Enable SMTP authentication
     $mail->Username = 'zeusmens123@gmail.com'; //SMTP username
     $mail->Password = 'uqgvbzhghhkgskmp'; //SMTP password
     $mail->SMTPSecure = 'PHPMailer::ENCRYPTION_STARTTLS'; //Enable implicit TLS encryption
     $mail->Port = 587; //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

     //Recipients
     $mail->setFrom('zeusmens123@gmail.com', 'PizzaPaso');
     $mail->addAddress('zeusmens123@gmail.com', 'Atención al Cliente'); //Add a recipient


     //Content
     $mail->isHTML(true); //Set email format to HTML
     $mail->Subject = 'Reserva';
     $mail->Body = "Nombre del Cliente: " . $nombre .
          "<br>\nComensales: " . $comensales .
          "\nNúmero del Cliente: " . $numero .
          "\nFecha Mencionada: " . $fecha;




     $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

     $mail->send();
} catch (Exception $e) {
     echo "El mensaje no se pudo enviar: {$mail->ErrorInfo}";
     echo "<script> setTimeout(\"location.href='../index.php'\",1000)</script>";
}


if (isset($_POST['bottonEnviarReserva'])) {

     if (
          strlen($_POST['nombre']) >= 1 &&
          strlen($_POST['comensales']) >= 1
     ) {

          $nombre = trim($_POST['nombre']);
          $comensales = trim($_POST['comensales']);
          $numero = trim($_POST['numero']);
          $fecha = trim($_POST['fecha']);

          $user_id = null;
          $sql1 = "select * from user where  email=\"$_SESSION[email]\"";
          $query = $con->query($sql1);
          while ($r = $query->fetch_array()) {
               $user_id = $r["IdUsuario"];
               break;
          }
          $consulta = "INSERT INTO reserva(username,numero, fecha, IdUsuario) 
VALUES ('$nombre','$numero', '$fecha','$user_id')";
          $resul = mysqli_query($con, $consulta);

          if ($resul == NULL) {
               print "<script>alert('Usted no inicio sesión , inicie sesión por favor...');</script>";
          } else {
               print "<script> window.location='index.php';</script>";
          }
     }
}

?>