<?php
include 'config.php';

$departamentoId = intval($_GET['departamentoId']);
$sql = "SELECT Id_Municipio, Nombre_Municipio FROM municipio WHERE Id_Departamento = $departamentoId";
$result = $conn->query($sql);

while ($row = $result->fetch_assoc()) {
    echo '<option value="' . $row['Id_Municipio'] . '">' . $row['Nombre_Municipio'] . '</option>';
}

$conn->close();
?>
