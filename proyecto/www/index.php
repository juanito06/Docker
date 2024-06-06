<?php
include 'config.php';
?>

<!DOCTYPE html>
<html>
<head>
    <title>CRUD Países, Departamentos y Municipios</title>
    <script>
        function fetchDepartamentos(paisId) {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("departamentos").innerHTML = this.responseText;
                    document.getElementById("municipios").innerHTML = '<option value="">Seleccione un municipio</option>';
                }
            };
            xhttp.open("GET", "fetch_departamentos.php?paisId=" + paisId, true);
            xhttp.send();
        }

        function fetchMunicipios(departamentoId) {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("municipios").innerHTML = this.responseText;
                }
            };
            xhttp.open("GET", "fetch_municipios.php?departamentoId=" + departamentoId, true);
            xhttp.send();
        }
        
        function deletePersona(correo) {
    console.log('Eliminar persona con correo:', correo);
    if (confirm('¿Está seguro de que desea eliminar esta persona?')) {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4) {
                console.log('Respuesta del servidor:', this.responseText);
                if (this.status == 200) {
                    if (this.responseText.trim() == 'success') {
                        // Eliminar la fila de la tabla
                        // Eliminar la fila de la tabla
			var row = document.querySelector('tr[data-correo="' + correo + '"]');
				if (row) {
    				row.parentNode.removeChild(row);
                        } 
                    } 
                } else {
                    alert('Error en la solicitud: ' + this.status);
                }
            }
        };
        xhttp.open("POST", "delete.php", true);
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("correo=" + correo);
    }
}



    </script>
</head>
<body>
    <h1>Registro de Persona</h1>
    <form action="register.php" method="post">
        <label for="correo">Correo Electrónico:</label>
        <input type="email" id="correo" name="correo" required>
        <br><br>

        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre" required>
        <br><br>

        <label for="apellido">Apellido:</label>
        <input type="text" id="apellido" name="apellido" required>
        <br><br>

        <label for="pais">País de Nacimiento:</label>
        <select id="pais" name="pais" onchange="fetchDepartamentos(this.value)" required>
            <option value="">Seleccione un país</option>
            <?php
            $sql = "SELECT Id_Pais, Nombre_Pais FROM pais";
            $result = $conn->query($sql);
            while ($row = $result->fetch_assoc()) {
                echo '<option value="' . $row['Id_Pais'] . '">' . $row['Nombre_Pais'] . '</option>';
            }
            ?>
        </select>
        <br><br>

        <label for="departamento">Departamento de Nacimiento:</label>
        <select id="departamentos" name="departamento" onchange="fetchMunicipios(this.value)" required>
            <option value="">Seleccione un departamento</option>
        </select>
        <br><br>

        <label for="municipio">Municipio de Nacimiento:</label>
        <select id="municipios" name="municipio" required>
            <option value="">Seleccione un municipio</option>
        </select>
        <br><br>

        <label for="telefono">Teléfono:</label>
        <input type="text" id="telefono" name="telefono" required>
        <br><br>

        <label for="contrasena">Contraseña:</label>
        <input type="password" id="contrasena" name="contrasena" required>
        <br><br>

        <label for="confirmar_contrasena">Confirmar Contraseña:</label>
        <input type="password" id="confirmar_contrasena" name="confirmar_contrasena" required>
        <br><br>

        <input type="submit" value="Registrar">
    </form>

    <h2>Personas Registradas</h2>
    <table border="1">
        <tr>
            <th>Correo Electrónico</th>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>País</th>
            <th>Departamento</th>
            <th>Municipio</th>
            <th>Teléfono</th>
            <th>Acciones</th>
        </tr>
        <?php
        $sql = "SELECT p.Correo_Electronico, p.Nombre, p.Apellido, pa.Nombre_Pais, d.Nombre_Departamento, m.Nombre_Municipio, p.Telefono 
                FROM persona p
                JOIN pais pa ON p.Pais_Nacimiento = pa.Id_Pais
                JOIN departamento d ON p.Departamento_Nacimiento = d.Id_Departamento
                JOIN municipio m ON p.Municipio_Nacimiento = m.Id_Municipio";
        $result = $conn->query($sql);
        while ($row = $result->fetch_assoc()) {
            echo '<tr>
                    <td>' . $row['Correo_Electronico'] . '</td>
                    <td>' . $row['Nombre'] . '</td>
                    <td>' . $row['Apellido'] . '</td>
                    <td>' . $row['Nombre_Pais'] . '</td>
                    <td>' . $row['Nombre_Departamento'] . '</td>
                    <td>' . $row['Nombre_Municipio'] . '</td>
                    <td>' . $row['Telefono'] . '</td>
                    <td>
                        <button onclick="deletePersona(\'' . $row['Correo_Electronico'] . '\')">Eliminar</button>
                    </td>
                  </tr>';
        }
        ?>
    </table>
</body>
</html>
