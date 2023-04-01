<?php

//* Checking if the session is set, if not it sets it to an empty string. */
session_start();
if (!isset($_SESSION["email"])) {
    $_SESSION["email"] = "";
}

//*? Getting the data from the post request and putting it into a variable. */

$array = $_POST['data'];

include("../PHP/con_db.php");
$id_compra_table = 0;
$acum_cantidad = 0;
$acum_precio = 0;

if (file_put_contents("compras.json", $array)) {

    echo "Se guardo el Json correctamente";
    /* Getting the data from the json file and putting it into an array. */
    $resultado_compra = json_decode(file_get_contents("compras.json"));
    /* Getting the data from the json file and putting it into an array. */
    foreach ($resultado_compra as $key => $obj) {
        $id_compra[] = $obj->id;
        $title_compra[] = $obj->title;
        $precio_compra[] = $obj->precio;
        $cantidad_compra[] = $obj->cantidad;
    }
    foreach ($precio_compra as $value) {
        $acum_precio = $acum_precio + floatval($value);
    }
    $user_id = null;
    $sql1 = "select * from user where  email=\"$_SESSION[email]\"";
    $query = $con->query($sql1);
    while ($r = $query->fetch_array()) {
        $user_id = $r["IdUsuario"];
        break;
    }
    //  insertar datos a tabla venta
    $consulta_venta = "INSERT INTO venta(FechaVenta,ValorPagar, IdUsuario) 
    VALUES (NOW(),'$acum_precio','$user_id')";
    $resul = mysqli_query($con, $consulta_venta);
    if ($resul == NULL) {
        echo "No se logro realizar su compra";
    } else {
        echo "Se logro realizar su compra";
    }
    //  insertar datos a tabla  detalle venta

    $sQL_ID_venta = "SELECT * FROM venta ORDER BY  IdVenta DESC";
    $query_consulta = $con->query($sQL_ID_venta);

    while ($r = $query_consulta->fetch_array()) {
        $ID_venta = $r["IDVenta"];
        break;
    }
    $subtotal[] = 0;
    for ($i = 0; $i < count($id_compra); $i++) {
        $subtotal[$i] = floatval($precio_compra[$i]) * floatval($cantidad_compra[$i]);
        $consulta_detalleVenta = "INSERT INTO detalleventa (CantidadVendida,Subtotal, IDProducto, IDVenta)
    VALUES ($cantidad_compra[$i],'$subtotal[$i] ','$id_compra[$i]', '$ID_venta')";
        $resul = mysqli_query($con, $consulta_detalleVenta);
    }
}
