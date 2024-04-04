<?php
include("functions.php");
include("config.php");
$stock = getStock();

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Error de conexion");
}

?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo  $title_page; ?></title>
    <link rel="stylesheet" href="css/styles.css">
</head>

<body>
    <header>
        <nav>
            <div class="logo">
                <img src="images/Logo.jpg" alt="RentaCar Pilot">
            </div>
            <ul class="stock">
                <?php foreach ($stock as $item) { ?>
                    <li><a href="<?php echo $item["url"] ?>"><?php echo $item["name"] ?></a></li>
                <?php } ?>
            </ul>
        </nav>
    </header>
    <section class="about">
        <h2>Sobre Nosotros</h2>
        <p> Ofrecemos servicios de alquiler temporal de automóviles a nuestros clientes.
            Contamos con una variedad de vehículos disponibles para alquilar, que van desde automóviles económicos
             hasta vehículos de lujo, camionetas, furgonetas y otros tipos de transporte.Brindamos la
              posibilidad a nuestros clientes de utilizar un vehículo por un período determinado, ya sea por horas, días 
              o semanas, a cambio de una tarifa acordada. 
                Ofrecemos servicios adicionales como seguros, asistencia en carretera, GPS, sillas de bebé y otros complementos
                para satisfacer las necesidades específicas de nuestros clientes.</p>
    </section>
    <section class="personas">
        <h2>Nuestros Managers</h2>
        <div class="personas">
            <?php
            $sql = "SELECT * FROM personas";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
            ?>
                    <div class="chef-item">
                        <img src='<?php echo $row["image"] ?>'>
                        <h3><?php echo $row["name"] ?></h3>
                        <p><?php echo $row["description"] ?></p>
                    </div>
            <?php }
            } ?>
        </div>
    </section>
    <footer>
        <p>Derechos de autor &copy; <?php echo date('Y')?> RentaCar Pilot</p>
    </footer>
</body>

</html>