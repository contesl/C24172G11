// la pagina catalog.html pasa la categoria seleccionada com parametro
// este js lo toma para filtrar los productos
const urlParams = new URLSearchParams(window.location.search);
const categoria = urlParams.get('categoria');

// Define the request URL
//const targetUrl = 'https://venerable-cactus-32abfb.netlify.app/item.json';
//const proxyUrl = 'https://cors-anywhere.herokuapp.com/';
//const url = (proxyUrl + targetUrl);
const url = 'https://contesl.github.io/C24172G11/db/JSON/Item.json';


// tenemos un JSON con el detalle de los productos
// hacemos fetch usando la API como el profe nos enseño
fetch(url)
    .then(response => {
        if (!response.ok) {
            throw new Error('Error en la respuesta ' + response.statusText);
        }
        return response.json();
    })
    .then(data => {
        // filtra los datos basado en la categoria
        const filteredData = data.filter(item => item.Categoria === categoria);

        // de acuerdo a la categoria muestra el titulo en catitems.html
        const categoryTitle = document.getElementById('categoryTitle');
        categoryTitle.textContent = `Categoria: ${categoria}`;
        categoryTitle.setAttribute('class', 'headerSubtitulo'); 

        // llama a la funcion para desplega los productos
        // pasandole la data ya filtrada
        displayProducts(filteredData);
    })
    .catch(error => {
        console.error('Error al intentar recuperar datos:', error);
    });

function displayProducts(products) {
    const productListDiv = document.getElementById('productListContainer');

    if (products.length === 0) {
        productListDiv.innerHTML = '<p>No se encuentran productos para la categoria.</p>';
        return;
    }

    // genera una tabla usando div y clases definidas en estilos.css
    const table = document.createElement('div');
    table.setAttribute('class', 'rTable'); // Add class attribute
    table.setAttribute('border', '1'); // Add border attribute
    table.innerHTML = `
        <div class="rTableRow">
            <div class="rTableHead"><strong>Imagen</strong></div>
            <div class="rTableHead"><strong>Item #</strong></div>
            <div class="rTableHead"><strong>Nombre</strong></div>
            <div class="rTableHead"><strong>Descripcion Catalogo</strong></div>
            <div class="rTableHead"><strong>Precio</strong></div>
            <div class="rTableHead"><strong>Stock</strong></div>
            <div class="rTableHead"><strong>Seleccionar</strong></div>
            <div class="rTableHead"><strong>Cantidad a Comprar</strong></div>
        </div>
    `;

    // lee la data con articulos filtrados y va generando las filas
    products.forEach(product => {
        const row = document.createElement('div');
        row.setAttribute('class', 'rTableRow'); // Add class attribute
        row.innerHTML = `
            <div class="rTableCell"><img class="imagen-detalle" src="../images/${product['Imagen']}" alt="${product['Nombre']}"></div>
            <div class="rTableCell">${product['Item No']}</div>
            <div class="rTableCell">${product['Nombre']}</div>
            <div class="rTableCell">${product['Descripcion Catalogo']}</div>
            <div class="rTableCell">${product['Precio']}</div>
            <div class="rTableCell">${product['Disponible']}</div>
            <div class="rTableCell"><input type="checkbox"></div>
            <div class="rTableCell"><input type="number" value="1" min="1"></div>
        `;
        table.appendChild(row);
    });

    // append al div definido en la pagina como hijo
    productListDiv.appendChild(table);

    // agrega los botones para ir a la finalizacion de la compra
    const buttonRow = document.createElement('div');
    buttonRow.setAttribute('class', 'rTableRow'); 
    buttonRow.innerHTML = `
        <div class="rTableCellNB"></div>
        <div class="rTableCellNB"></div>
        <div class="rTableCellNB"></div>
        <div class="rTableCellNB"><button class="btn" onclick="completePurchase()">Completar la Compra</button></div>
    `;
    table.appendChild(buttonRow);
}

function completePurchase() {
    // toma los valores de todos los checkbox en la pagina
    const checkboxes = document.querySelectorAll('input[type="checkbox"]');

    // array para guardar los checkbox seleccionados con sus cantidad y productos
    const selectedItems = [];

    // Loop entre todos los checkbox para detectar los seleccionados
    checkboxes.forEach((checkbox, index) => {
 
        if (checkbox.checked) {

            const row = checkbox.closest('.rTableRow');
            // toma el valor de la fila que se necesita para completar la compra
            // esto lo hace en order.html
            const itemNo = row.querySelector('.rTableCell:nth-child(2)').textContent;
            const nombre = row.querySelector('.rTableCell:nth-child(3)').textContent;
            const precio = row.querySelector('.rTableCell:nth-child(5)').textContent;
            const cantidad = parseInt(row.querySelector('.rTableCell:nth-child(8) input[type="number"]').value);

            // guarda el valor en el array
            selectedItems.push({ itemNo, nombre, precio, cantidad });
        }
    });

    // arma la query string con todos los valores
    const queryString = selectedItems.map(item => `itemNo=${item.itemNo}&nombre=${item.nombre}&cantidad=${item.cantidad}&precio=${item.precio}`).join('&');

    // redirecciona a la finalizacion de la orden con el query string
    window.location.href = `../internet/order.html?${queryString}`;
}

//esta la usamos para volver al catalogo
function goToCatalog() {
    window.location.href = "../internet/catalog.html";
}
