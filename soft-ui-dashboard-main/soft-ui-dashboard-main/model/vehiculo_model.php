<?php 

    include 'conection.php'; 

    function OptenerVehiculos(){
        $instancia = AbrirDB(); 
        $usuario = $instancia -> query("CALL OptenerVehiculos;");
        CerrarDB($instancia); 

        return $usuario;
    }

?>