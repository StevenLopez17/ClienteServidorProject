<?php 
    include_once '../model/vehiculo_model.php'; 

    function OptenerListaVehiculos() {
         

        $result = OptenerVehiculos();
    
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
                if($row['estado'] == 'Available'){
                    echo '      <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-input-id="' . $row['id'] . '">';
                    echo '          Rent';
                    echo '      </button>';
                } else {
                    echo '      <button type="button" class="btn btn-danger" ">';
                    echo '          Not Available';
                    echo '      </button>';
                }
                echo '      <p class="mb-4 mt-xl-2 text-sm">';
                echo '        ' . $row['description'] . '<b> Daily Price: ' . $row['price'] . '</b>';
                echo '      </p>';
                echo '    </div>';
                echo '  </div>';
                echo '</div>';
            }
        
        }
    }



?>