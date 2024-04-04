<?php 
function getStock(){
    $stock = array(array("url" => "index.php", "name" => "Inicio"), array("url" => "about.php", "name" => "Nosotros"));
    $stock[] = array("url" => "#", "name" => "Menú");
    $stock[] = array("url" => "#", "name" => "Reservas");
    $stock[] = array("url" => "#", "name" => "Contacto");
    return $stock;
}
