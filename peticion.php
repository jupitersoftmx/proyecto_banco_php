<?php
header("Content-Type: application/json");

$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "tienda_online";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die(json_encode(array("status" => "error", "message" => "Hubo un error al conectarse a la base de datos.", "error" => $conn->connect_error)));
}

$nombre_completo = $_POST['nombre'];
$email = $_POST['email'];
$pass = $_POST['pass'];
$direccion_entrega = $_POST['direccion_entrega'];
$estado = $_POST['estado'];
$paymentMethod = $_POST['paymentMethod'];
$total_carrito = $_POST['total_carrito'];
$fecha_compra = date("Y-m-d");

$sql = "INSERT INTO usuarios (nombre_completo, email, direccion_entrega, estado, fecha_compra)
        VALUES (?, ?, ?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("sssss", $nombre_completo, $email, $direccion_entrega, $estado, $fecha_compra);
$result = $stmt->execute();

if ($result) {
    $usuario_id = $stmt->insert_id;
} else {
    die(json_encode(array("status" => "error", "message" => "Hubo un error al procesar la transacción.", "error" => $stmt->error)));
}

if ($paymentMethod === 'paypal') {
    $sql = "SELECT * FROM cuentas_paypal WHERE email = ? AND contraseña = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $email, $pass);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $payment_status = "completed";
        $moneda = "USD";
    } else {
        die(json_encode(array("status" => "error", "message" => "Correo o contraseña de PayPal incorrectos.")));
    }
} elseif ($paymentMethod === 'sucursal') {
    $payment_status = "pending";
    $moneda = "USD";
} else {
    $payment_status = "completed";
    $moneda = "GTQ";
}

$sql = "INSERT INTO transacciones (usuario_id, payment_method, payment_status, total, moneda, fecha)
        VALUES (?, ?, ?, ?, ?, NOW())";
$stmt = $conn->prepare($sql);
$stmt->bind_param("issds", $usuario_id, $paymentMethod, $payment_status, $total_carrito, $moneda);
$result = $stmt->execute();

if ($result) {
    echo json_encode(array("status" => "success", "message" => "Transacción realizada con éxito."));
} else {
    die(json_encode(array("status" => "error", "message" => "Hubo un error al procesar la transacción.", "error" => $stmt->error)));
}

$conn->close();
?>
