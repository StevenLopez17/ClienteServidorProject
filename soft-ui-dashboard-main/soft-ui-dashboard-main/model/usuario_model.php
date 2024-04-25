<?php 
    include 'conection.php'; 



    function ValidarUsuario($usuario,$password){
        $instancia = AbrirDB(); 
        $usuario = $instancia -> query("CALL ValidarUsuario ('$usuario','$password');");
        CerrarDB($instancia); 

        return $usuario;
    }

    function CrearUsuario($userName,$userEmail,$userPassword,$userRole){
        $instancia = AbrirDB(); 
        $usuario = $instancia -> query("CALL CrearUsuario ('$userName','$userEmail','$userPassword','$userRole');");
        CerrarDB($instancia); 

        return $usuario;
    }
    
    function OptenerVehiculosUsuario($userID){
        $instancia = AbrirDB(); 
        $usuario = $instancia -> query("CALL OptenerVehiculoUsuario ('$userID');");
        CerrarDB($instancia); 

        return $usuario;
    }

    


?>