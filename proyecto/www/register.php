<?php
include 'config.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $correo = $_POST['correo'];
    $nombre = $_POST['nombre'];
    $apellido = $_POST['apellido'];
    $pais = $_POST['pais'];
    $departamento = $_POST['departamento'];
    $municipio = $_POST['municipio'];
    $telefono = $_POST['telefono'];
    $contrasena = $_POST['contrasena'];
    $confirmar_contrasena = $_POST['confirmar_contrasena'];

    // Validar que las contraseñas coincidan
    if ($contrasena !== $confirmar_contrasena) {
        die("Las contraseñas no coinciden.");
    }

    // Verificar si el correo electrónico ya existe
    $check_sql = "SELECT * FROM persona WHERE Correo_Electronico = '$correo'";
    $check_result = $conn->query($check_sql);

    if ($check_result->num_rows > 0) {
        die("El correo electrónico ya está registrado.");
    }

    // Insertar en la base de datos
    $sql = "INSERT INTO persona (Correo_Electronico, Nombre, Apellido, Pais_Nacimiento, Departamento_Nacimiento, Municipio_Nacimiento, Telefono, Contraseña, Confirma_Contraseña)
            VALUES ('$correo', '$nombre', '$apellido', '$pais', '$departamento', '$municipio', '$telefono', '$contrasena', '$confirmar_contrasena')";

    if ($conn->query($sql) === TRUE) {
        header("Location: index.php"); // Redirigir a la página principal después del registro exitoso
        exit();
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

$conn->close();
?>

