const userForm = document.querySelector("#userForm")

let users = [] //para guardar los usuarios
let editing = false //señal para saber si edita o crea
let userId = null // se actualiza el editar para que este disponible al guardar

/*cuando levanta la pagina traigo los usuarios y los muestro*/
window.addEventListener("DOMContentLoaded", async () => {
    //const response = await fetch('http://127.0.0.1:5000/api/users', {
    const response = await fetch('https://c24172g11-bk.onrender.com/api/users', {
        method: 'GET'
    })
    const data = await response.json()
    users = data
    editing = false
    userId = null

    renderUser(users)
});

/*queda capturando el evento submit, ademas activa asincronia*/
userForm.addEventListener('submit', async e => {
    e.preventDefault() /*para poder monitorearlo*/

    const username = userForm['username'].value
    const password = userForm['password'].value
    const email = userForm['email'].value

    /*ahora enviamos los datos al backend con fetch
      hay que enviarlos en json y nos va a devolver un json por eso 
     hacemos el fetch guardando en una constante
     IMPORTANTE: el boton Guardar lo estamos usando tanto para ALTA
     como para MODIFICACION por eso los indicadores editing y userId
     */
    if (!editing) {

        const response = await fetch('https://c24172g11-bk.onrender.com/api/users', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                username: username,
                password: password,
                email: email
            })
        })
        /*await sirve para que se quede esperando porque es asincrono*/
        const data = await response.json()


        users.push(data) /*para que al hacer el create luego aparezca en la lista general*/

    
    } else {
        const response = await fetch(`https://c24172g11-bk.onrender.com/${userId}`, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                username: username,
                password: password,
                email: email
            })
        })
        const updatedUser = await response.json()
        /*
        user.id == updatedUser.id: Compara el id del usuario actual con el id de
         updatedUser.
        ? updatedUser : user: Este es un operador ternario que funciona 
        de la siguiente manera:
        Si la condición(user.id == updatedUser.id) es verdadera, 
        devuelve updatedUser.
        Si la condición es falsa, devuelve el usuario original(user).
        */
        users = users.map(user => user.id == updatedUser.id ? updatedUser : user)

        editing=false
        userId=null
    }

    renderUser(users)
    userForm.reset() /*para limpiar el formulario*/
})

function renderUser(users) {
    const userList = document.getElementById('productListContainer');
    userList.innerHTML = ''
    // Create a table to display the products
    const table = document.createElement('div');
    table.setAttribute('class', 'rTable'); // Add class attribute
    table.setAttribute('border', '1'); // Add border attribute
    table.innerHTML = `
        <div class="rTableRow">
        <div class="rTableHead"><strong>Nombre </strong></div>
        <div class="rTableHead"><strong>email</strong></div>
        <div class="rTableHead"><strong>Eliminar</strong></div>
        <div class="rTableHead"><strong>Modificar</strong></div>
        </div>
    `;

    users.forEach(user => {
        // Create a new table row
        const newRow = document.createElement('div');
        newRow.setAttribute('class', 'rTableRow'); // Add class attribute
        newRow.innerHTML = `
            <div class="rTableCell">${user.username}</div>
            <div class="rTableCell">${user.email}</div>
            <div class="rTableCell"><button class="btn-delete">Eliminar</button></div>
            <div class="rTableCell"><button class="btn-edit">Modificar</button></div>
        `;

        /*--para ejecutar la BAJA--*/
        const btnDelete = newRow.querySelector('.btn-delete')
        btnDelete.addEventListener('click', async () => {
            const response = await fetch(`https://c24172g11-bk.onrender.com/api/users/${user.id}`, {
                method: 'DELETE'
            })
            const deletedData = await response.json()


            /*
            user.id != data.id: Compara el id del usuario actual con el id de data.
            Si la condición(user.id != data.id) es verdadera, el usuario se 
            incluye en el nuevo array.
            Si la condición es falsa, el usuario se excluye del nuevo array.
            */
           
            users = users.filter(user => user.id !== deletedData.id)


            renderUser(users)
            
        })

        /*---para ejecutar la modificacion----*/
        const btnEdit = newRow.querySelector('.btn-edit')

        btnEdit.addEventListener('click', async () => {

            const response = await fetch(`https://c24172g11-bk.onrender.com/api/users/${user.id}`, {
                method: 'GET'
            })
            const data = await response.json()

            userForm['username'].value = data.username
            userForm['email'].value = data.email
            userForm['password'].value = data.password
         
            editing = true
            userId = data.id

        })

        // Append the new row to the table body
        table.appendChild(newRow);
    })
    userList.appendChild(table);
}