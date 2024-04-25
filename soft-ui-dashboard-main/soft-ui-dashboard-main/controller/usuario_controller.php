<?php 
    include_once '../model/usuario_model.php'; 

    if(isset($_POST['validarUsuario']))
    {
        $usuario = $_POST["usuario"];
        $password = $_POST["password"];

        $usuario = ValidarUsuario($usuario,$password);

        if($usuario !== null && $usuario->num_rows > 0) {
            $usuarioInfo = $usuario->fetch_assoc();

            session_start();
            $_SESSION['userName'] = $usuarioInfo['name'];
            $_SESSION['rol_id'] = $usuarioInfo['rol_id']; 
            $_SESSION['user_id'] = $usuarioInfo['id']; 

            echo json_encode($usuarioInfo);

        } else {
            echo json_encode(["error" => "Invalid username or password"]);
        }
        
    }

    if(isset($_POST['crearUsuario']))
    {
        $userName = $_POST["userName"];
        $userEmail = $_POST["userEmail"];
        $userPassword = $_POST["userPassword"];
        $userRole = $_POST["userRole"];

        $result = CrearUsuario($userName, $userEmail, $userPassword, $userRole);

        if($result) {
            echo json_encode(["success" => "User created successfully"]);
        } else {
            echo json_encode(["error" => "Error creating user"]);
        }
    }

    function printVehicleCardsForUser() {
         
        $userID = $_SESSION['user_id'];

        $result = OptenerVehiculosUsuario($userID);
    
        if ($result && $result->num_rows > 0) {
            
            while ($row = $result->fetch_assoc()) {
                
                echo '<div class="col-xl-3 col-md-6 mb-xl-0 mb-4">';
                echo '  <div class="card card-blog card-plain">';
                echo '    <div class="position-relative">';
                echo '      <a class="d-block shadow-xl border-radius-xl">';
                echo '        <img src=" ' . $row['image'] . '" alt="img-blur-shadow" class="img-fluid shadow border-radius-xl">';
                echo '      </a>';
                echo '    </div>';
                echo '    <div class="card-body px-1 pb-0">';
                echo '      <p class="text-gradient text-dark mb-2 text-sm">' . $row['name'] . '</p>';
                echo '      <a href="javascript:;">';
                echo '        <h7>';
                echo '          Return Date: ' . $row['fecha_entrega'];
                echo '        </h7>';
                echo '      </a>';
                echo '      <p class="mb-4 mt-xl-2 text-sm">';
                echo '        ' . $row['description'];
                echo '      </p>';
                echo '    </div>';
                echo '  </div>';
                echo '</div>';
            }
        
        }
    }



?>