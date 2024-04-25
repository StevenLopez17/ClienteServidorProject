<?php 


    function AbrirDB(){
        $databaseName = 'rentacar'; 
        return mysqli_connect('127.0.0.1:3306','root','',$databaseName); 
    }

    function CerrarDB($instancia){
        mysqli_close($instancia);
    }

?>  