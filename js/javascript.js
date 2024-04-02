function confirmExit() {
    if (confirm("¿Está seguro que quiere volver a la página principal?")) {
        window.location = '../index.html';
    }
}
function ScrollMarquee() {

    window.setTimeout('ScrollMarquee()', ScrollSpeed);

    var msg = document.Cart_form.Message.value;

    document.Cart_form.Message.value = msg.substring(ScrollChars) + msg.substring(0, ScrollChars);

}

//Validadores Forms//

function validarLogin(formulario) {

    let nombre = document.getElementById(formulario).querySelector('input[name="username"]').value;
    let password = document.getElementById(formulario).querySelector('input[name="password"]').value;
    
    if(nombre.trim() === '') {
        alert('Debe ingresar un nombre de usuario');
        return false;
    }

    if (password === ''){
        alert('Debe ingresar una contraseña');
        return false;
    }

    return true;
}

function validarCuenta(formulario) {

    let username = document.getElementById(formulario).querySelector('input[name="username"]').value;
    let email = document.getElementById(formulario).querySelector('input[name="email"]').value
    let password_1 = document.getElementById(formulario).querySelector('input[name="password-1"]').value;
    let password_2 = document.getElementById(formulario).querySelector('input[name="password-2"]').value;

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

function validarContacto(formulario){
    let username = document.getElementById(formulario).querySelector('input[name="name"]').value;
    let email = document.getElementById(formulario).querySelector('input[name="email"]').value
    
    if(username.trim() ===''){
        alert('Debe ingresar su nombre y apellido');
        return false;
    }

    if (!validarEmail(email)){
        alert('Debe ingresar un email válido');
        return false;
    }
    
    return true
}