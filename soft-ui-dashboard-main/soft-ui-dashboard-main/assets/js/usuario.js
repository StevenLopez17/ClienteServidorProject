function validarUsuario() {

    var userEmail = document.getElementById("txtEmail").value
    var userPassword = document.getElementById("txtPassword").value

    $.ajax({
        type: 'POST',
        url: '../controller/usuario_controller.php',
        data: {
            "usuario": userEmail,
            "password": userPassword, 
            "validarUsuario":"validarUsuario"
        }, success: function (data){
             
            var responseData = JSON.parse(data);

            if(responseData.error){
                document.getElementById("errorAlert").style.display = "";
            } else {
                window.location.href = "../views/profile.php";
            }

        }, error: function(data){

            document.getElementById("errorAlert").innerHTML = "error during user creation";

        }
    })

}

function crearUsuario(){

    var userName = document.getElementById('txtName').value; 
    var userEmail = document.getElementById('txtEmail').value;
    var userPassword = document.getElementById('txtPassword').value;
    var userPasswordConfirmation = document.getElementById('txtPasswordConfirmation').value; 
    
    if (userName === '' || userEmail === '' || userPassword === '' || userPasswordConfirmation === '') {
        document.getElementById('errorAlertText').innerText = 'Please fill in all fields';
        document.getElementById('errorAlert').style.display = '';
        return;
    }

    if (userPassword !== userPasswordConfirmation) {
        document.getElementById('errorAlertText').innerText = 'Passwords do not match';
        document.getElementById('errorAlert').style.display = '';
        return;
    }

    document.getElementById('errorAlert').style.display = 'none';

    $.ajax({
        type: 'POST',
        url: '../controller/usuario_controller.php',
        data: {
            "crearUsuario": true,
            "userName": userName,
            "userEmail": userEmail,
            "userPassword": userPassword,
            "userRole": 2,
            "crearUsuario":"crearUsuario"
        },
        success: function(response) {
            var responseData = JSON.parse(response);
            if (responseData.success) {
                
                window.location.href = "../index.php";
            } else {
                
                document.getElementById('errorAlertText').innerText = responseData.error;
                document.getElementById('errorAlert').style.display = ''; 
            
            }
        },
        error: function(xhr, status, error) {
            
            console.log(xhr);
            console.log(status);
            console.log(error);
            document.getElementById('errorAlertText').innerText = 'Error creating user';
            document.getElementById('errorAlert').style.display = ''; 
        }
    });

}