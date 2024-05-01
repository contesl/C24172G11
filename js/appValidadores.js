const usernameField = document.querySelector("[name=username]");
const companyField = document.querySelector("[name=company]");
const emailField = document.querySelector("[name=email]");
const phoneField = document.querySelector("[name=phone]");
const comentField = document.querySelector("[name=comentario]");
const checkboxField = document.querySelector("[name=policy]");
const submitBotton = document.querySelector("[type=submit]");
const formContact = document.querySelector("#form-contacto")
let usernameValid = false;
let emailValid = false;


function validarEmail(email) {
    var re = /\S+@\S+\.\S+/;
    return re.test(email);
}

function validarCampo(field){

    submitBotton.nextElementSibling.classList.add('error');
    submitBotton.nextElementSibling.innerText = '';
    field.classList.remove('invalid');
    field.classList.add('valid');
    field.nextElementSibling.classList.add('error');
    field.nextElementSibling.innerText = '';

    field.addEventListener("blur", function(e){

        const fieldValue = e.target.value;

        if (fieldValue.length === 0){
            field.classList.remove("valid");
            field.classList.add("invalid");
            field.nextElementSibling.classList.add("error");
            field.nextElementSibling.innerText = "Debe rellenar este campo";
            if (field.name === "username"){
                usernameValid = false;
            } else if (field.name === "email") {
                emailValid = false;
            }
        } else {
            field.classList.remove("invalid");
            field.classList.add("valid");
            field.nextElementSibling.classList.add("error");
            field.nextElementSibling.innerText = "";
            if (field.name === "username"){
                usernameValid = true;
            } else if (field.name === "email") {
                emailValid = true;
            }

        }

        if (field.name == "email"){
            if (!validarEmail(field.value)){
                field.classList.remove("valid");
                field.classList.add("invalid");
                field.nextElementSibling.classList.add("error");
                field.nextElementSibling.innerText = "El email ingresado no es válido";
            }
        }
    })
}

function sombraCampo(field){
    
    field.classList.remove('invalid');
    field.classList.add('valid');

    field.addEventListener("blur", function(e){
        
        field.classList.remove('valid');
        field.classList.add('');
    })
}

usernameField.addEventListener("click", function(e){
    validarCampo(usernameField);
})

emailField.addEventListener("click", function(e){
    validarCampo(emailField)
})

companyField.addEventListener("click", function(e){
    sombraCampo(companyField)
})

phoneField.addEventListener("click", function(e){
    sombraCampo(phoneField)
})

comentField.addEventListener("click", function(e){
    sombraCampo(comentField)
})

formContact.addEventListener("submit", function(e){
    
    if ((!usernameValid) || (!emailValid) || (!checkboxField.checked)){

        submitBotton.nextElementSibling.classList.add("error");
        submitBotton.nextElementSibling.innerText = "Es necesario que complete todos los campos.";
        e.preventDefault();
    }
    else {
        alert('¡Datos enviados exitosamente!')
    }
})