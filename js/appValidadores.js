//Login//
function validarLogin(event) {
    let username = document.getElementById('username').value.trim();
    let password = document.getElementById('password').value.trim();
    let errorUsername = document.getElementById('error-name');
    let errorPassword = document.getElementById('error-password');
    let valid = true;

    if(username === '') {
        errorUsername.textContent = 'Por favor, ingrese su nombre';
        valid = false;
    } else {
        errorUsername.textContent = '';
    }

    if(password ===''){
        errorPassword.textContent = 'Por favor, ingrese una contraseña';
        valid = false;
    } else {
        errorPassword.textContent = '';
    }
    if (!valid) {
        event.preventDefault();
    }
}

//Creación de cuenta//
function validarCta(formulario) {
    let username = document.getElementById(formulario).querySelector('input[name="nombreCta"]').value;
    let email = document.getElementById(formulario).querySelector('input[name="emailCta"]').value
    let password_1 = document.getElementById(formulario).querySelector('input[name="passwordFirts"]').value;
    let password_2 = document.getElementById(formulario).querySelector('input[name="password-new"]').value;
    if(username.trim() === '') {
        alert('Debe ingresar un nombre de usuario');
        return false;
    }    
    if(!validarEmail(email)){
        alert('Ingrese un email válido, por favor.');
        return false;
    }
    if (password_1 === ''){
        alert('Debe ingresar una contraseña');
        return false;
    }
    if (password_2 === ''){
        alert('Debe confirmar su contraseña');
        return false;
    }
    return true;
}
function validarEmail(email) {
    var re = /\S+@\S+\.\S+/;
    return re.test(email);
}
//Contacto//
function validarContacto(formulario){
    let username = document.getElementById(formulario).querySelector('input[name="name"]').value;
    let email = document.getElementById(formulario).querySelector('input[name="email"]').value
    let checkbox = document.getElementById('checkbox');

    if(username.trim() ===''){
        alert('Debe ingresar su nombre y apellido');
        return false;
    }
    if (!validarEmail(email)){
        alert('Debe ingresar un email válido');
        return false;
    }

    if (!checkbox.checked){
        alert('Debe aceptar los téminos y condiciones');
        return false;
    }

    return true
}

function validarSubmit(){
    let checkbox = document.getElementById('checkbox');
    let submit = document.getElementById('submit');

    submit.disabled = !checkbox.ariaChecked;
}