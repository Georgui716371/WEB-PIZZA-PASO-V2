<?php
   session_start();
   if (!isset($_SESSION["email"])) {
    $_SESSION["email"]="";
   }
$ape=$_POST['apellido'];
$nom=$_POST['nombre'];
$correo=$_POST['correo'];
$tel=$_POST['telefono'];
$tipoDocum=$_POST['dniSection'];
$numDocumento=$_POST['numDocumento'];
$direccion=$_POST['direccion'];

$radioButtonTipo=$_POST['radioButtonTipo'];
$MontoReclamado=$_POST['MontoReclamado'];
$ComentarioMonto=$_POST['ComentarioMonto'];

$radioButtonReclamo=$_POST['radioButtonReclamo'];
$numeroDeBoleta=$_POST['numeroDeBoleta'];
$fechaPedido=$_POST['fechaPedido'];
$ComentarioDetalleReclamo=$_POST['ComentarioDetalleReclamo'];
$ComentarioPedidoConcreto=$_POST['ComentarioPedidoConcreto'];


include("con_db.php");
if($con) {
    echo "<script>alert('Se envio correctamente , muchas gracias por contar con nostros ...');window.location='../index.php';</script>";
}

if(isset($_POST['enviarLibroReclamaciones'])) {
$fechaIncidente=trim($_POST['fechaIncidente']);
$apellido=trim($_POST['apellido']);
$nombre =trim($_POST['nombre']);
$email =trim($_POST['correo']);
$numero =trim($_POST['telefono']);
$tipoDocum=trim($_POST['dniSection']);
$numDocumento=trim($_POST['numDocumento']);
$direccion=trim($_POST['direccion']);
$radioButtonTipo=trim($_POST['radioButtonTipo']);
$MontoReclamado=trim($_POST['MontoReclamado']);
$ComentarioMonto=trim($_POST['ComentarioMonto']);
$radioButtonReclamo=trim($_POST['radioButtonReclamo']);
$numeroDeBoleta=trim($_POST['numeroDeBoleta']);
$fechaPedido=trim($_POST['fechaPedido']);
$ComentarioDetalleReclamo=trim($_POST['ComentarioDetalleReclamo']);
$ComentarioPedidoConcreto=trim($_POST['ComentarioPedidoConcreto']);


$user_id=null;
$sql1= "select * from user where  email=\"$_SESSION[email]\"";

$query = $con->query($sql1);
while ($r=$query->fetch_array()) {
    $user_id=$r["IdUsuario"];
    break;
}


$consulta="INSERT INTO reclamos(Apellidos, Nombres, Correo, Teléfono, TipDocumento, NumDocumento,Dirección,TipoBien,MontoReclamo,Reclamación,Boleta,FechaPedido,Detalle,PedidoConcreto,FechaIncidente,IdUsuario) 
VALUES ('$apellido', '$nombre', '$numero', '$tipoDocum', '$numDocumento', '$direccion','$radioButtonTipo','$MontoReclamado','$ComentarioMonto','$radioButtonReclamo','$numeroDeBoleta','$fechaPedido','$ComentarioDetalleReclamo','$ComentarioPedidoConcreto','$fechaIncidente','$user_id')";
$resul= mysqli_query($con,$consulta);
if ($resul==NULL) {
    
    print "<script>alert('no se guardo ');</script>";
}else{
    print "<script> window.location='../index.php';</script>";
}
}
?>