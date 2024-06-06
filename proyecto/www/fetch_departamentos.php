<?php
include 'config.php';

$paisId = intval($_GET['paisId']);
$sql = "SELECT Id_Departamento, Nombre_Departamento FROM departamento WHERE Id_Pais = $paisId";
$result = $conn->query($sql);

while ($row = $result->fetch_assoc()) {
    echo '<option value="' . $row['Id_Departamento'] . '">' . $row['Nombre_Departamento'] . '</option>';
}

$conn->close();
?>
