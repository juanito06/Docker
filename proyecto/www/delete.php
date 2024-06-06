<?php
include 'config.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $correo = $_POST['correo'];

    // Eliminar la fila de la base de datos
    $sql = "DELETE FROM persona WHERE Correo_Electronico = '$correo'";
    if ($conn->query($sql) === TRUE) {
        echo 'success';
    } else {
        echo 'error';
    }
} else {
    echo 'error';
}

$conn->close();
?>
