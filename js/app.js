// Get the category parameter from the URL
const urlParams = new URLSearchParams(window.location.search);
const categoria = urlParams.get('categoria');

// Define the request URL
//const targetUrl = 'https://venerable-cactus-32abfb.netlify.app/item.json';
//const proxyUrl = 'https://cors-anywhere.herokuapp.com/';
//const url = (proxyUrl + targetUrl);
const url = 'https://contesl.github.io/C24172G11/db/JSON/item.json';

// Fetch data using the Fetch API
fetch(url)
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok ' + response.statusText);
        }
        return response.json();
    })
    .then(data => {
        // Filter data based on the category
        const filteredData = data.filter(item => item.Categoria === categoria);

        // Set the category title dynamically
        const categoryTitle = document.getElementById('categoryTitle');
        categoryTitle.textContent = `Categoria: ${categoria}`;
        categoryTitle.setAttribute('class', 'headerSubtitulo'); // Add class attribute

        // Display the filtered data on the page
        displayProducts(filteredData);
    })
    .catch(error => {
        console.error('Error fetching data:', error);
    });

function displayProducts(products) {
    const productListDiv = document.getElementById('productListContainer');

    if (products.length === 0) {
        productListDiv.innerHTML = '<p>No products found for this category.</p>';
        return;
    }

    // Create a table to display the products
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

    // Populate the table with product data
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

    // Append the table to the product list div
    productListDiv.appendChild(table);

    // Add buttons for completing purchase and navigating to catalog page
    const buttonRow = document.createElement('div');
    buttonRow.setAttribute('class', 'rTableRow'); // Add class attribute
    buttonRow.innerHTML = `
        <div class="rTableCellNB"></div>
        <div class="rTableCellNB"></div>
        <div class="rTableCellNB"></div>
        <div class="rTableCellNB"><button class="btn" onclick="completePurchase()">Completar la Compra</button></div>
    `;
    table.appendChild(buttonRow);
}

function completePurchase() {
    // Get all checkboxes in the table
    const checkboxes = document.querySelectorAll('input[type="checkbox"]');

    // Array to store selected items and their quantities
    const selectedItems = [];

    // Loop through checkboxes to find selected items
    checkboxes.forEach((checkbox, index) => {
        // If checkbox is checked
        if (checkbox.checked) {
            // Get the corresponding row
            const row = checkbox.closest('.rTableRow');

            // Get the item details from the row
            const itemNo = row.querySelector('.rTableCell:nth-child(2)').textContent;
            const nombre = row.querySelector('.rTableCell:nth-child(3)').textContent;
            const precio = row.querySelector('.rTableCell:nth-child(5)').textContent;
            const cantidad = parseInt(row.querySelector('.rTableCell:nth-child(8) input[type="number"]').value);

            // Add item to selectedItems array
            selectedItems.push({ itemNo, nombre, precio, cantidad });
        }
    });

    // Convert selectedItems array to query string
    const queryString = selectedItems.map(item => `itemNo=${item.itemNo}&nombre=${item.nombre}&cantidad=${item.cantidad}&precio=${item.precio}`).join('&');

    // Redirect to order.html page with parameters
    window.location.href = `../internet/order.html?${queryString}`;
}

function goToCatalog() {
    window.location.href = "../internet/catalog.html";
}
